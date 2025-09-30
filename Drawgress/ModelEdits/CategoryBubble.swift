//
//  CategoryBubble.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/29.
//

import Foundation

import SwiftUI
struct CategoryBubble: View {
    
    let category: DrawingCategory
    @Binding var selectedCategory: DrawingCategory?
    
    var body: some View {
        
    
        Button(action: {
            withAnimation {
                selectedCategory = category
            }
        }) {
            Text(category.name)
                 
               
                .foregroundStyle(category == selectedCategory ? Color(hex: category.colorHex!) : Color.black)
                .padding()
                .background(
                    Capsule()
                        .stroke(category == selectedCategory ? Color(hex: category.colorHex!) : Color.gray, lineWidth: 2 )
                )
            
              
        }
        
        .buttonStyle(.plain)

        
        
    }
}
