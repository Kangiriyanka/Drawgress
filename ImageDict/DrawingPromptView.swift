//
//  DrawingPromptView.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/22.
//

import SwiftUI
import SwiftData

struct DrawingPromptView: View {
    
    let prompt: DrawingPrompt
    
    var body: some View {
        Text(prompt.title)
    }
    
}
