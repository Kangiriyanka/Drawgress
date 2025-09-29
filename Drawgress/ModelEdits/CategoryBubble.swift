//
//  CategoryBubble.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/29.
//

import Foundation

import SwiftUI
struct CategoryBubble: View {
    
    @Binding var isNewCategory: Bool
    
    var body: some View {
        
        Button("New", systemImage: "plus.circle") {
            withAnimation {
                isNewCategory.toggle()
            }
        }
        .padding()
        
        
    }
}
