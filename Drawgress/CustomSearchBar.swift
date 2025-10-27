//
//  CustomSearchBar.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/27.
//

import Foundation
import SwiftUI

struct CustomSearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search"

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(placeholder, text: $text)
              
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.none)
            
            if !text.isEmpty {
                Button {
                    withAnimation(.easeOut(duration: 0.2)) {
                        text = ""
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.accent.opacity(0.8))
                        .transition(.scale)
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: UIConstants.lgRadius)
                .fill(Color.main.opacity(0.3))
        )
        .overlay(
            RoundedRectangle(cornerRadius: UIConstants.lgRadius)
                .stroke(Color.main.opacity(0.7), lineWidth: 1)
        )
        .padding(.horizontal)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}
