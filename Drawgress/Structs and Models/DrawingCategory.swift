//
//  Category.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/28.
//

import Foundation
import SwiftData

@Model
class DrawingCategory{
    @Attribute(.unique) var id = UUID()
    var title: String
    var colorHex: String?
    @Relationship var prompts: [DrawingPrompt] = []
    
    

        static let animals = DrawingCategory(title: "animals", colorHex: "#FF6B6B")
        static let foods  = DrawingCategory(title: "food", colorHex: "#4ECDC4")
        static let shapes = DrawingCategory(title: "shapes", colorHex: "#45B7D1")
        static let nature = DrawingCategory(title: "nature", colorHex: "#FFEAA7")
    
    
      
   
    
    init(title: String , colorHex: String) {
       
        self.title = title
        self.colorHex = colorHex
   
    }
}
