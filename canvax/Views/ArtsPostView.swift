//
//  ArtsPost.swift
//  canvax
//
//  Created by valome on 5/28/25.
//

import SwiftUI

// Shimmer effect modifier
struct SShimmerEffect: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: phase - 0.5),
                            .init(color: .white.opacity(0.3), location: phase),
                            .init(color: .clear, location: phase + 0.5)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geometry.size.width * 2)
                    .offset(x: -geometry.size.width)
                    .mask(content)
                }
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

// Skeleton view for image loading
struct ImageSkeletonView: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .modifier(SShimmerEffect())
    }
}

// Enhanced image cache manager with memory warnings
class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    private var memoryWarningObserver: NSObjectProtocol?
    
    private init() {
        cache.countLimit = 20 // Reduced from 100 to 20
        cache.totalCostLimit = 1024 * 1024 * 50 // Reduced from 100MB to 50MB
        
        // Observe memory warnings
        memoryWarningObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.didReceiveMemoryWarningNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.clear()
        }
    }
    
    deinit {
        if let observer = memoryWarningObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    func set(_ image: UIImage, forKey key: String) {
        let cost = Int(image.size.width * image.size.height * 4) // 4 bytes per pixel
        cache.setObject(image, forKey: key as NSString, cost: cost)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func clear() {
        cache.removeAllObjects()
    }
}

// Optimized image loading view with shimmer effect
struct ProgressiveImageView: View {
    let imageName: String
    @State private var image: UIImage?
    @State private var isLoading = true
    @State private var loadTask: Task<Void, Never>?
    @State private var loadingStartTime: Date?
    
    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .transition(.opacity)
            } else {
                ImageSkeletonView()
                    .onAppear {
                        loadingStartTime = Date()
                        loadImage()
                    }
                    .onDisappear {
                        loadTask?.cancel()
                        loadTask = nil
                    }
            }
        }
    }
    
    private func loadImage() {
        // Cancel any existing load task
        loadTask?.cancel()
        
        // Check cache first
        if let cachedImage = ImageCache.shared.get(forKey: imageName) {
            self.image = cachedImage
            self.isLoading = false
            return
        }
        
        // Create new load task
        loadTask = Task {
            // Load image asynchronously
            if let image = await loadImageAsync() {
                if !Task.isCancelled {
                    // Cache the image
                    ImageCache.shared.set(image, forKey: imageName)
                    
                    // Ensure minimum loading time for smooth transition
                    if let startTime = loadingStartTime {
                        let elapsedTime = Date().timeIntervalSince(startTime)
                        if elapsedTime < 0.5 {
                            try? await Task.sleep(nanoseconds: UInt64((0.5 - elapsedTime) * 1_000_000_000))
                        }
                    }
                    
                    // Update UI on main thread
                    await MainActor.run {
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.image = image
                            self.isLoading = false
                        }
                    }
                }
            }
        }
    }
    
    private func loadImageAsync() async -> UIImage? {
        await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                if let image = UIImage(named: imageName) {
                    // Downsample image if needed
                    let maxDimension: CGFloat = 1242 // Maximum dimension for 1x scale
                    if image.size.width > maxDimension || image.size.height > maxDimension {
                        let scale = min(maxDimension / image.size.width, maxDimension / image.size.height)
                        let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
                        
                        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
                        image.draw(in: CGRect(origin: .zero, size: newSize))
                        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
                        UIGraphicsEndImageContext()
                        
                        continuation.resume(returning: resizedImage)
                    } else {
                        continuation.resume(returning: image)
                    }
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}

struct ArtsPostView: View {
    let art: ArtPost
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                TabView(selection: $currentIndex) {
                    ForEach(ArtPost.sampleData.indices, id: \.self) { index in
                        LazyView {
                            ZStack(alignment: .bottom) {
                                // Progressive image loading with shimmer effect
                                ProgressiveImageView(imageName: ArtPost.sampleData[index].imageName)
                                    .frame(width: geometry.size.width)
                                    .clipped()
                                    .id(index)
                                    .onDisappear {
                                        // Clean up memory when view disappears
                                        if index != currentIndex {
                                            autoreleasepool {
                                                ImageCache.shared.clear()
                                            }
                                        }
                                    }

                                TransparentBlurView()
                                    .frame(width: geometry.size.width)
                                    .frame(height: 320)
                                    .mask(
                                        LinearGradient(
                                            gradient: Gradient(stops: [
                                                .init(color: Color.appLinearAsh.opacity(0.00), location: 0.00),
                                                .init(color: Color.appLinearBlack, location: 0.55)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )

                                // Overlay InfoSet at bottom
                                VStack {
                                    InfoSet(
                                        title: ArtPost.sampleData[index].title,
                                        artist: ArtPost.sampleData[index].artist,
                                        location: ArtPost.sampleData[index].location,
                                        likes: ArtPost.sampleData[index].likes,
                                        comments: ArtPost.sampleData[index].comments,
                                        shares: ArtPost.sampleData[index].shares
                                    )
                                    Rectangle()
                                        .frame(height: 40)
                                        .opacity(0.0)
                                }
                            }
                            .frame(width: geometry.size.width)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            // Overlay Fancy3DotsIndexView at bottom
            VStack {
                Spacer()
                HStack {
                    Fancy3DotsIndexView(
                        numberOfPages: ArtPost.sampleData.count,
                        currentIndex: currentIndex
                    )
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 24)
                .background(.whiteM.opacity(0.1))
                .cornerRadius(40)
                .padding(10)
            }
        }
    }
}

// LazyView wrapper to prevent unnecessary view creation
struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @escaping () -> Content) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ArtsPostView(art: ArtPost.sampleData[0])
        .frame(maxWidth: .infinity)
        .scaledToFit()
}
