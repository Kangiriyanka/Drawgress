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
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }
        
        func addSample() {
            let prompt = DrawingPrompt(title: "Apple", category: "fruit")
            modelContext.insert(prompt)
            fetchData()
        }
        
        func addPrompt(prompt: DrawingPrompt) {
            modelContext.insert(prompt)
            fetchData()
        }
        
        func deletePrompt(_ prompt: DrawingPrompt) {
                modelContext.delete(prompt) 
                do {
                    try modelContext.save()
                    fetchData()
                } catch {
                    print("Error saving context after delete: \(error)")
                }
            }
        
        
        func fetchData() {
            do {
                let descriptor = FetchDescriptor<DrawingPrompt>(sortBy: [SortDescriptor(\.title)])
                prompts = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
        
        
        
        
        
        
    }

