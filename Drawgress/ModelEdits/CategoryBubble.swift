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
                
                .background(
                    category == selectedCategory ? Color(hex: category.colorHex!) : Color.clear
                )
                .padding()
                .foregroundStyle(category == selectedCategory ? .white : .black)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: category.colorHex!), lineWidth: 2)
                )
               
                
               
               
            
              
        }
        
     
        
    }
}
