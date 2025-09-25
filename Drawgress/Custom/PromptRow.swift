//
//  PromptRow.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/24.
//

import Foundation
import SwiftUI

struct PromptRow: View {
    let prompt: DrawingPrompt
    
    var body: some View {
        HStack {
            Image(
                uiImage: prompt.getCoverPhoto ?? Constants.placeholder
            )
            .resizable()
            .scaledToFill()
            .frame(width:50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.trailing)
            Text(prompt.title)
        }
        
    }
}
