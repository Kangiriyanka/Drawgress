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
    
    init() {
        do {
            container = try ModelContainer(for: DrawingPrompt.self)
            viewModel = SwiftDataViewModel(modelContext: container.mainContext)
            
        } catch {
            fatalError("Failed to create ModelContainer for DrawingPrompt")
        }
    }
    
    let container: ModelContainer
    @State var viewModel: SwiftDataViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .modelContainer(container)
        
        
        
    
    }
}

