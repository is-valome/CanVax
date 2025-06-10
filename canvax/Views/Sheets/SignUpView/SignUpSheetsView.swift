//
//  SignUpSheetsView.swift
//  canvax
//
//  Created by valome on 6/6/25.
//

import SwiftUI

struct SignUpSheetsView: View {
    @Environment(\.colorScheme) var colorScheme // 👈 Detect light/dark mode
    @Environment(\.dismiss) private var dismiss
    @Binding var showSignUpSheet: Bool
    @Binding var showAcceptView: Bool
    
    private let letters = ["•","C", "A", "N", "V", "A", "X", " ", "A R T", " ", "T H A T", " ", "U N D E R S T A N D S", " ", "Y O U"]
    private let marqueeLetters: [String]

    @State private var scrollOffset: CGFloat
    @State private var singlePassWidth: CGFloat

    init(showSignUpSheet: Binding<Bool>, showAcceptView: Binding<Bool>) {
        self._showSignUpSheet = showSignUpSheet
        self._showAcceptView = showAcceptView
        self.marqueeLetters = letters + letters + letters
        _scrollOffset = State(initialValue: 0)
        _singlePassWidth = State(initialValue: 0)
    }

    private func LetterView(letter: String, isAccent: Bool = false) -> some View {
        HStack {
            Text(letter)
                .font(.system(size: isAccent ? 12 : 12))
                .fontWeight(.bold)
                .tracking(0.4)
                .foregroundColor(isAccent ? (colorScheme == .dark ? .black : .white) : .primary)
        }
        .padding(.horizontal, 23)
        .padding(.vertical, 4)
        .frame(width: isAccent ? 55 : nil, height: isAccent ? 22 : nil)
        .background(
            isAccent ?
            AnyView(
                Image(colorScheme == .dark ? "RadientMix" : "RadientMix1")
                    .resizable()
                    .scaledToFill()
            ) :
            AnyView(colorScheme == .dark ? Color(#colorLiteral(red: 0.141, green: 0.141, blue: 0.157, alpha: 1)) : Color.appcircleAsh)
        )
        .clipShape(RoundedRectangle(cornerRadius: 40))
    }

    var body: some View {
        ZStack {
            (colorScheme == .dark ? Color.black : Color.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Hi Artist 👋") // Say hello to users(artist)
                        .font(.system(size: 21))
                        .fontWeight(.bold)
                        .tracking(0.2)
                    Spacer()
                }
                .padding()

                HStack {
                    Image(colorScheme == .dark ? "black_canvax" : "white_canvax") // 👈 Switch image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 85)
                }
                .padding()
                .frame(maxWidth: .infinity) // *It* stretches

                // Marquee Effect
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(marqueeLetters.indices, id: \.self) { index in
                            LetterView(letter: marqueeLetters[index], isAccent: marqueeLetters[index] == "X")
                        }
                    }
                    .background(
                        GeometryReader { geometry in
                            Color.clear.onAppear {
                                DispatchQueue.main.async {
                                    singlePassWidth = geometry.size.width / 3.0
                                }
                            }
                        }
                    )
                    .fixedSize(horizontal: true, vertical: false)
                    .offset(x: scrollOffset)
                    .onAppear {
                        startMarqueeAnimation()
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                }
                VStack {
                    SignUpButton(logo: "apple.logo", buttonText: "Sign up with Apple", action:  {
                        pd_print("Tapped Apple Sign Up")
                        showSignUpSheet = false
                        showAcceptView = true
                    }, platform: nil)
                    SignUpButton(logo: "google_canvax", buttonText: "Sign up with Google", action:  {
                        pd_print("Tapped Google Login to Acces CanVax Account")
                        showSignUpSheet = false
                        showAcceptView = true
                    }, platform: "google")
                    SignUpButton(logo: "instagram_canvax", buttonText: "Sign up with Instagram", action:  {
                        pd_print("Tapped Instagram Login to Access CanVax Account")
                        showSignUpSheet = false
                        showAcceptView = true
                    }, platform: "instagram")
                }
                .padding()
                // footer Privacy Policy • About CanVax • Terms of Service
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        Button(action: {
                            pd_print("Tapped Privacy Policy")
                        }) {
                            Text("Privacy Policy")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }
                        
                        Text("•")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            pd_print("Tapped About CanVax")
                        }) {
                            Text("About CanVax")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }
                        
                        Text("•")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            pd_print("Tapped Terms of Service")
                        }) {
                            Text("Terms of Service")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
        .navigationDestination(isPresented: $showAcceptView) {
            AcceptView()
        }
    }

    private func startMarqueeAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            scrollOffset -= 1.5
            if scrollOffset <= -singlePassWidth && singlePassWidth > 0 {
                scrollOffset += singlePassWidth
            }
        }
    }
}

#Preview {
    SignUpSheetsView(showSignUpSheet: .constant(true), showAcceptView: .constant(false))
}

