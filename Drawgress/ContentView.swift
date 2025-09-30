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
    
    @Environment(SwiftDataViewModel.self) var dataModel
    @State private var formType: ModelFormType?
    var body: some View {
        
        
        NavigationStack {
            Group {
                if dataModel.prompts.isEmpty {
                    ContentUnavailableView {
                        Label("No Drawing Prompts", systemImage: "paintpalette")
                    } description: {
                        Text("New categories will appear here.")
                    }
                }
                else {
                    
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(dataModel.categories) { category in
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(category.name)
                                        .font(.title2)
                                        .bold()
                                        .padding(.horizontal)
                                    
                                    ForEach(category.prompts) { prompt in
                                        NavigationLink(value: prompt) {
                                            PromptRow(prompt: prompt)
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                                
                                .background(Color(hex: category.colorHex!).gradient)
                              
                            
                            }
                            
                        }
                    
                        .padding(.vertical)
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
