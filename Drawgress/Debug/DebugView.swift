//
//  DebugView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/20.
//

import SwiftUI

struct DebugView: View {
    
    @Environment(\.modelContext)  var modelContext
    
    var body: some View {
        
        deleteButton
    }
    
    
    
    private var deleteButton: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Button("Delete prompts") {
                    deletePrompts()
                }
                
            }
            .frame(width: 200, height: 50)
         
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.accent, lineWidth: 2))
        }
        
        .frame(maxWidth: .infinity)
        .background(Color.main)
        
        
        
    }
    private func deletePrompts() {
        do {
            try modelContext.delete(model: DrawingCategory.self)
        } catch {
            print("Failed to delete all routines")
        }
    }
}

#Preview {
    DebugView()
}
