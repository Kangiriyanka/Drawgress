//
//  ContentView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "paintpalette")
                }
            
            #if targetEnvironment(simulator)
            
            DebugView()
                .tabItem {
                    Label("Debug", systemImage: "ladybug")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings.", systemImage: "gearshape")
                }
            
            #endif
        }
        
    }
}

#Preview {
    let container = DrawingPrompt.previewContainer
    let mockViewModel = SwiftDataViewModel(modelContext: container.mainContext)
    ContentView()
        .modelContainer(container)
        .environment(mockViewModel)
}
