//
//  TextFields.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/24.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(.secondary)
                    .frame(width: 20)
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            
            TextField("Enter \(title.lowercased())", text: $text)
                .textFieldStyle(.plain)
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
        }
    }
}
