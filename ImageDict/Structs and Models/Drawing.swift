//
//  Drawing.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/21.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Drawing: Identifiable {
    var name: String
    @Attribute(.externalStorage)
    var data: Data?


    
    var image: UIImage? {
        if let data {
            return UIImage(data: data)
        }
        else {
            return nil
        }
    }
    
  
    init(name: String, data: Data? = nil) {
        self.name = name
        self.data = data
        
    }
    
    
}
