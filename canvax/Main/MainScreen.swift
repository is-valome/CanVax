//
//  MainScreen.swift
//  canvax
//
//  Created by valome on 5/26/25.
// HomeScreen

import SwiftUI

struct MainScreen: View {
    @State private var isArts = true
    @State private var shimmerID = UUID()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // CanVax-style header
                HStack {
                    HStack {
                        Text("Gallery •")
                            .font(.system(size: 34, weight: .bold))
                        Button(action: {
                            pd_print("🔍 DEBUG: Button tapped - Current state: \(isArts ? "Arts" : "Loop")")
                            HapticManager.light()
                            // Optimize state changes
                            Task { @MainActor in
                                withAnimation(.smooth(duration: 0.1)) {
                                    isArts.toggle()
                                    shimmerID = UUID()
                                    pd_print("🔄 DEBUG: State changed to: \(isArts ? "Arts" : "Loop")")
                                    pd_print("📱 DEBUG: ShimmerID updated: \(shimmerID)")
                                }
                            }
                        }) {
                            Text(isArts ? "Arts" : "Loop")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundStyle(Color.appLightGray)
                                .overlay(
                                    ShimmerEffect()
                                        .id(shimmerID)
                                        .mask(
                                            Text(isArts ? "Arts" : "Loop")
                                                .font(.system(size: 34, weight: .bold))
                                        )
                                )
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 22)
                    }
                    .foregroundStyle(.primary)
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                StoryStatusView(stories: StoryStatus.sampleData)
                    .padding(.top, 10)
                Divider()
                Spacer()
                // Add your main content here
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MainScreen()
}
