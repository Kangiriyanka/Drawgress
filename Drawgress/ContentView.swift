//
//  ContentView.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/20.
//

import SwiftUI
import PhotosUI
import SwiftData


struct ContentView: View {
    
    @Environment(SwiftDataViewModel.self) var viewModel
    @State private var formType: ModelFormType?
    var body: some View {
        
        
        NavigationStack {
            Group {
                if viewModel.prompts.isEmpty {
                    ContentUnavailableView {
                        Label("No Drawing Prompts", systemImage: "paintpalette")
                    } description: {
                        Text("New drawing prompts will appear here.")
                    }
                }
                else {
                    
                    List(viewModel.prompts) { prompt in
                        NavigationLink(value: prompt) {
                            PromptRow(prompt: prompt)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deletePrompt(prompt)
                                
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                
                }
            }
            
            
            .navigationDestination(for: DrawingPrompt.self) { prompt in
                DrawingPromptView(prompt: prompt)
            }
          
            
            .navigationTitle("Drawgress")
            .toolbar {
                Button {
                    formType = .new
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                
                .sheet(item: $formType) { $0 }
            }
            
        }
        
        
        
    }
    
    
 
    
}


#Preview {
    let container = DrawingPrompt.previewContainer
    let mockViewModel = SwiftDataViewModel(modelContext: container.mainContext)
    
    return ContentView()
        .modelContainer(container)
        .environment(mockViewModel)
}
