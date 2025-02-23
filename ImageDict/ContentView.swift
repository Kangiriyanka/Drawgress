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
    
    
    @State private var viewModel: ViewModel
    @State private var formType: ModelFormType?
    var body: some View {
        
        
        NavigationStack {
            List(viewModel.prompts) { prompt in
                NavigationLink(value: prompt) {
                    HStack {
                        Image(uiImage: prompt.getCoverPhoto ?? Constants.placeholder)
                            .resizable()
                            .scaledToFill()
                            .frame(width:50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.trailing)
                        Text(prompt.title)
                        
                    }
                }
            }
            .listStyle(.plain)
            
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
    
    init(modelContext: ModelContext) {
           let viewModel = ViewModel(modelContext: modelContext)
           _viewModel = State(initialValue: viewModel)
       }
}




#Preview {
    let modelContainer = DrawingPrompt.preview
    let modelContext = modelContainer.mainContext
    ContentView(modelContext: modelContext)
        .modelContainer(modelContainer)
}





