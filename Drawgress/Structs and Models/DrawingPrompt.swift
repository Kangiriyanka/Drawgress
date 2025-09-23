//
//  Prompt.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/21.
//

import Foundation
import SwiftUI
import SwiftData



@Model
class DrawingPrompt {
    
    
    var title: String
    var category: String
    var images: [DrawingImage] = []
    var coverPhoto: Data? 
    
    var getCoverPhoto: UIImage? {
        if let coverPhoto, let uiImage = UIImage(data: coverPhoto) {
            return uiImage
        } else {
            return Constants.placeholder
        }
    }

    
    
    init(title: String, category: String) {
        self.title = title
        self.category = category
    }
    
  
   
    
    
}

extension DrawingPrompt {
    @MainActor
    static var previewContainer: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: DrawingPrompt.self, configurations: configuration)

        // Insert samples directly
        let samples: [DrawingPrompt] = [
            .init(title: "mouse", category: "animals"),
            .init(title: "food", category: "food"),
            .init(title: "cube", category: "shapes"),
            .init(title: "guitar", category: "objects"),
            .init(title: "tree", category: "nature"),
            .init(title: "car", category: "vehicles"),
            .init(title: "house", category: "buildings"),
            .init(title: "flower", category: "plants"),
            .init(title: "star", category: "symbols"),
            .init(title: "robot", category: "fantasy"),
            .init(title: "dog", category: "animals"),
            .init(title: "cat", category: "animals")
        ]
        samples.forEach { container.mainContext.insert($0) }

        return container
    }
}

