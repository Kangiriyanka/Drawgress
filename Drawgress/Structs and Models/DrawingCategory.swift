//
//  Category.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/28.
//

import Foundation
import SwiftData

@Model
class DrawingCategory {
    
    var name: String
    var colorHex: String?
    @Relationship var prompts: [DrawingPrompt] = []
    
    

        static let animals = DrawingCategory(name: "animals", colorHex: "#FF6B6B")
        static let foods  = DrawingCategory(name: "food", colorHex: "#4ECDC4")
        static let shapes = DrawingCategory(name: "shapes", colorHex: "#45B7D1")
        static let nature = DrawingCategory(name: "nature", colorHex: "#FFEAA7")
    
    
      
   
    
    init(name: String , colorHex: String) {
        self.name = name
        self.colorHex = colorHex
   
    }
}
