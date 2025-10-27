//
//  PromptBubble.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/27.
//

import Foundation
import SwiftUI


struct PromptBubble: View {
    
    let prompt: DrawingPrompt

    
    var body: some View {
        
    
            Text(prompt.title)
                
               
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                colors: [.white.opacity(0.6), .black.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                        .shadow(color: .white.opacity(0.2), radius: 2, x: 0, y: 1)
                )
              
               
                
               
               
            
              
        }
        
     
        
    
}
