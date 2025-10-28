//
//  AllCategoriesView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/26.
//

import SwiftUI

struct AllCategoriesView: View {
    
   
    @Environment(SwiftDataViewModel.self) var dataModel

        
        var body: some View {
            List(dataModel.categories) { category in
                Text(category.title)
            }
            .navigationTitle("All Categories")
        }
}

#Preview {
    AllCategoriesView()
}
