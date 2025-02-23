//
//  DrawingImage.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/22.
//

import Foundation
import SwiftData

@Model
class DrawingImage {
    var imageData: Data
    var comment: String?
    
    init(imageData: Data, comment: String? = nil) {
        self.imageData = imageData
        self.comment = comment
    }
}
