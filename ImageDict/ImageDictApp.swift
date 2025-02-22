//
//  ImageDictApp.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/20.
//

import SwiftUI
import SwiftData

@main
struct ImageDictApp: App {
    
    // Place your init first
    init() {
        do {
            container = try ModelContainer(for: DrawingPrompt.self)
        } catch {
            fatalError("Failed to create ModelContainer for DrawingPrompt")
        }
    }
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: container.mainContext)
        }
        .modelContainer(container)
        
        
    
    }
}

