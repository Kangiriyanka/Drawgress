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
    static var preview: ModelContainer {
        let container = try! ModelContainer (for: DrawingPrompt.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        var samples: [DrawingPrompt] {
            [
                .init(title: "mouse", category: "animals"),
                .init(title: "food", category: "food"),
                .init(title: "cube", category: "shapes")
            ]
        }
        samples.forEach {
            container.mainContext.insert($0)
        }
        
        return container
    }
}

