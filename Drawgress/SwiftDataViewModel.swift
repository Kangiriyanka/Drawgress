//
//  ContentView-ViewModel.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/21.
//

import SwiftUI
import SwiftData 

@Observable
    class SwiftDataViewModel {
        
        var modelContext: ModelContext
        var prompts = [DrawingPrompt]()
        var categories = [DrawingCategory]()
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchPromptData()
            fetchCategories()
        }
        
        func addSample() {
            let category = DrawingCategory(title: "fruits", colorHex: "#FFC107")
            let prompt = DrawingPrompt(title: "Apple", category: category)
            modelContext.insert(prompt)
            fetchPromptData()
        }
        
        func addPrompt(prompt: DrawingPrompt) {
            modelContext.insert(prompt)
            fetchPromptData()
            fetchCategories()
        }
       
        
        func deletePrompt(_ prompt: DrawingPrompt) {
                modelContext.delete(prompt) 
                do {
                    try modelContext.save()
                    fetchPromptData()
                } catch {
                    print("Error saving context after delete: \(error)")
                }
            }
        
        
        func fetchPromptData() {
            do {
                let descriptor = FetchDescriptor<DrawingPrompt>(sortBy: [SortDescriptor(\.title)])
                prompts = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
        
        func fetchCategories() {
               do {
                   let descriptor = FetchDescriptor<DrawingCategory>(sortBy: [SortDescriptor(\.title)])
                   categories = try modelContext.fetch(descriptor)
                   print(categories)
               } catch {
                   print("Categories fetch failed")
               }
           }
        
        
        
        
        
        
        
        
        
    }

