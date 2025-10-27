//
//  ContentView.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/20.
//

import SwiftUI
import PhotosUI
import SwiftData


struct CategoryView: View {
    
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
                            spacing: 20
                        ) {
                            ForEach(dataModel.categories) { category in
                                NavigationLink(value: category) {
                                    
                                    categoryCard(category)
                                    
                                }
                            }
                        }
                        .padding()
                    }  
                
                }
            }
            
            
            .background(Color.main)
            .navigationTitle("Drawgress")
           
          
            .toolbar {
               addButton
            }
            .navigationDestination(for: DrawingCategory.self) { category in
                PromptsView(prompts: category.prompts)
            }
            
        }
       
        
     
        
        
        
    }
    
     private func categoryCard(_ category: DrawingCategory) -> some  View {
        
        VStack {
            Text(category.name)
                .foregroundStyle(.black)
                .font(.title2)
                .bold()
        }
        
        
        .frame(width: UIConstants.categoryWidth, height: UIConstants.categoryHeight)
        .cornerRadius(UIConstants.lgRadius)
        .overlay(
            RoundedRectangle(cornerRadius: UIConstants.lgRadius)
                .stroke(Color(hex: category.colorHex ?? "FFFFFF").gradient, lineWidth: 2)
        )
        
        
    }
    
    private var addButton: some View {
        
        Button {
            formType = .new
        } label: {
            Image(systemName: "plus.circle.fill")
        }
        
        .sheet(item: $formType) { $0 }
    }
    
    
 
    
}


#Preview {
    let container = DrawingPrompt.previewContainer
    let mockViewModel = SwiftDataViewModel(modelContext: container.mainContext)
    
    return ContentView()
        .modelContainer(container)
        .environment(mockViewModel)
}
