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
    @State private var formType: ModelFormType?
    
    var body: some View {
        
      
            VStack(alignment: .leading){
                Text(prompt.title).bold().font(.title)
                ZoomableScrollView {
                    Image(uiImage: prompt.getCoverPhoto ?? Constants.placeholder)
                    
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                }
                
                Spacer()
            }
            
            
            .padding()
            .toolbar {
                ToolbarItemGroup {
                    Button("Edit", systemImage: "pencil") {
                        formType = .update(prompt)
                    }
                    .sheet(item: $formType) { $0 }
                }
              
            }
        }
    
    }

                           
#Preview {
  
    let prompt = DrawingPrompt(title: "Computer", category: "Things")
    
    return DrawingPromptView(prompt: prompt)
        
                    
                
}
