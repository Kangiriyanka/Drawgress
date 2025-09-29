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
    var category: DrawingCategory?
    var images: [DrawingImage] = []
    var coverPhoto: Data?
    
    
    
    var getCoverPhoto: UIImage? {
        if let coverPhoto, let uiImage = UIImage(data: coverPhoto) {
            return uiImage
        } else {
            return Constants.placeholder
        }
    }

    
    
    init(title: String, category: DrawingCategory) {
        self.title = title
        self.category = category
    }
    
  
   
    
    
}

extension DrawingPrompt {
    @MainActor
    static var previewContainer: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: DrawingPrompt.self, configurations: configuration)
        
        

     
        let samples: [DrawingPrompt] = [
            DrawingPrompt(title: "mouse", category: DrawingCategory.animals),
            DrawingPrompt(title: "cube", category: DrawingCategory.shapes)
      
        ]
        samples.forEach { container.mainContext.insert($0) }

        return container
    }
}

