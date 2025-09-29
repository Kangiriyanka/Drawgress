//
//  TestView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/29.
//

import SwiftUI

struct TestView: View {
    
    @Environment(SwiftDataViewModel.self) var viewModel
    
  
    
    var body: some View {
        Text("Categories")
        Button("Add Sample") {
            viewModel.addSample()
        }
        List(viewModel.prompts)
        { prompt in
            Text(prompt.title)
        }
        
        List(viewModel.categories) { category in
            Text(category.name)
        }

 
    }
}

#Preview {
    let container = DrawingPrompt.previewContainer
    let mockViewModel = SwiftDataViewModel(modelContext: container.mainContext)
   
    TestView()
        .modelContainer(container)
        .environment(mockViewModel)
}
