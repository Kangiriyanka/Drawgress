//
//  Comment.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/21.
//

import Foundation
import SwiftData


@Model
class Comment{

    var text: String
    
    init(text: String) {
        self.text = text
    }
}
