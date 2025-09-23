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
    
    private(set) var selectedImage: UIImage?
    var selectedItem: PhotosPickerItem? = nil {
        didSet {
            setImage(from: selectedItem)
        }
    }
    
    var vm: UpdateEditFormViewModel?
    
    func setup(_ vm: UpdateEditFormViewModel) {
        self.vm = vm
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
            do {
                let data = try await selection.loadTransferable(type: Data.self)
                vm?.coverPhoto = data
                
                guard let data, let uiImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                
                selectedImage = uiImage
            } catch {
                print(error)
            }
        }
    }
}
