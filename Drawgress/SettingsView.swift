//
//  SettingsView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/26.
//

import SwiftUI

struct SettingsView: View {
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: AllCategoriesView()) {
                        Text("Categories")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
            }
                  
                }
            
        }
    }


#Preview {
    SettingsView()
}
