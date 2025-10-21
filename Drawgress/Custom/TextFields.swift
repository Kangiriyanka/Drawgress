//
//  TextFields.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/24.
//

import Foundation
import SwiftUI


struct CustomHeader: View {
    
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.secondary)
                .frame(width: 20)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        
    }
 
    
    
}
struct CustomTextField: View {
    let title: String
    @Binding var text: String
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
          
            
            TextField("Enter \(title.lowercased())", text: $text)
                .textFieldStyle(.plain)
                .font(.headline)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.gray), lineWidth: 1)
                )
        }
        .padding(5)
    }
}
