//
//  Colors.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/24.
//

import Foundation
import SwiftUI


extension Color {
 
    static let bgCream = Color(red: 0.984, green: 0.973, blue: 0.953)
    
    static let warmIvory = Color(red: 0.969, green: 0.949, blue: 0.910)
    static let softBeige = Color(red: 0.941, green: 0.902, blue: 0.824)
    static let canvasCream = Color(red: 0.961, green: 0.941, blue: 0.910)
    static let linenWhite = Color(red: 0.980, green: 0.941, blue: 0.902)
    
    static let warmTan = Color(red: 0.886, green: 0.831, blue: 0.733)     
    static let mediumBrown = Color(red: 0.647, green: 0.576, blue: 0.482)
    static let richBrown = Color(red: 0.545, green: 0.400, blue: 0.290)
    
    static let forestBrown = Color(red: 0.471, green: 0.384, blue: 0.275)
    static let mahoganyBrown = Color(red: 0.580, green: 0.365, blue: 0.275)
    static let espressoBrown = Color(red: 0.420, green: 0.345, blue: 0.290)
    
    
    /// Transform a SwiftUI Color to an UIColor and extract the components
    /// % start of specification, 0: pad with zeros 2: width, X: uppercase hexcadecimal
    func toHex() -> String? {
            guard let components = UIColor(self).cgColor.components else { return nil }
            
            let r = components[0]
            let g = components[1]
            let b = components[2]
            
            return String(format: "#%02X%02X%02X",
                         Int(r * 255),
                         Int(g * 255),
                         Int(b * 255))
        }
    
    
    
    
    /// 1. Trim all non-alphanumeric characters
    /// 2. Scanner decodes the hex digits from the string and stores them in the int variable. &int is a reference to the variable.
    init(hex: String) {
            
     
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
           
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3:
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6:
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8:
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue: Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
    }
    
    
  


