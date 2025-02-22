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
    var body: some View {
        
        
        NavigationStack {
            List(viewModel.prompts) { prompt in
                NavigationLink(value: prompt) {
                    HStack {
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
                    viewModel.addSample()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
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






//        VStack {
//
//            Text("Hi")
//            if let image = photoViewModel.selectedImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 300, height: 300)
//            }
//            PhotosPicker("Select Image", selection: $photoViewModel.selectedItem, matching: .images)
//
//        }
