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
                        LazyVGrid(
                            columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2),
                            spacing: 15
                        ) {
                            ForEach(dataModel.categories) { category in
                                NavigationLink(value: category) {
                                    VStack {
                                        Text(category.name)
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    .frame(width: 200, height: 100)
                                    .background(Color(hex: category.colorHex ?? "FFFFFF").gradient)
                                    .cornerRadius(12)
                                }
                            }
                        }
                        .padding()
                    }
                
                }
            }
            

            .navigationTitle("Drawgress")
            .navigationDestination(for: DrawingCategory.self) { category in
                PromptsView(prompts: category.prompts)
            }
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
