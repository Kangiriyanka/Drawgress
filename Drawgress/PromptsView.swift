//
//  PromptsView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/02.
//

import SwiftUI

struct PromptsView: View {
    
    var prompts: [DrawingPrompt]
    @State private var searchText: String = ""
    
    
    var filteredPrompts: [DrawingPrompt] {
            if searchText.isEmpty {
                return prompts
            }
            return prompts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    
    
    var body: some View {
        
        VStack {
            CustomSearchBar(text: $searchText)
            
            
            ScrollView(.vertical) {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2),
                    spacing: 20
                ) {
                    ForEach(filteredPrompts) { prompt in
                        PromptBubble(prompt : prompt)
                    }
                }
                
            }
           
            
        }
        .background(Color.main)
    }
      
    
}





#Preview {

    
    
    PromptsView(prompts: DrawingPrompt.samples)
 
    
    
}

