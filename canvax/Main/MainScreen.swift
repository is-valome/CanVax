//
//  MainScreen.swift
//  canvax
//
//  Created by valome on 5/26/25.
// HomeScreen

import SwiftUI

// Gallery Screen
struct MainScreen: View {
    @State private var selectedTab = 0
    
    init() {
        // Set tab bar background to solid color
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .systemBackground // This will automatically adapt to light/dark mode
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GalleryView()
                .tabItem {
                    Image(systemName: "photo.stack.fill")
                    Text("Gallery")
                }
                .tag(0)
            
            ActivitiesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Activities")
                }
                .tag(1)
            
            EmotionView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Emotion")
                }
                .tag(2)
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "face.dashed")
                    Text("Profile")
                }
                .tag(4)
        }
        .tint(.primary)
    }
}

#Preview {
    MainScreen()
}
