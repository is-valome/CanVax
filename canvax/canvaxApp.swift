//
//  canvaxApp.swift
//  canvax
//
//  Created by valome on 5/26/25.
//

import SwiftUI
import SwiftData

@main
struct canvaxApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    LaunchScreen()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    ContentView()
                        .transition(.opacity)
                }
            }
            .animation(.easeOut(duration: 0.2), value: showSplash)
        }
    }
}
