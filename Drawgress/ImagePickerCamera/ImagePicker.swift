//
//  ImagePicker.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/22.
//

import SwiftUI
import PhotosUI
@Observable
class ImagePicker {
    
    // The selectedItem has to be null in the beginning.
    // Once you change the selected item, it creates a new image.
    var selectedItem: PhotosPickerItem? = nil {
        didSet {
            setImage(from: selectedItem)
        }
    }
    
    var vm: UpdateEditFormViewModel?
    
    /// ImagePicker object gets initialized first in the UpdateEditeFormView
    /// When you do initialize it, it first doesn' have the vm associated with it. That's why you need the onAppear
    func setup(_ vm: UpdateEditFormViewModel) {
        self.vm = vm
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        // didSet is a synchronous. The task here just allows you to do asynchronous operations inside a synchronous function
        Task {
            do {
                let data = try await selection.loadTransferable(type: Data.self)
                vm?.coverPhoto = data
      
            } catch {
                print(error)
            }
        }
    }
}
