//
//  PromptsView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/02.
//

import SwiftUI

struct PromptsView: View {
    
    var prompts: [DrawingPrompt]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2),
                    spacing: 20
                ) {
                    ForEach(prompts) { prompt in
                        Text(prompt.title)
                    }
                }
                
            }
            .background(Color.main)
            
        }
    }
}



#Preview {

    
    
    PromptsView(prompts: DrawingPrompt.samples)
 
    
    
}

