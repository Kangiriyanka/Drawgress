//
//  UpdateEditFormViewModel.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/22.
//



import UIKit

@Observable
class UpdateEditFormViewModel {
    var title: String = ""
    var category: String = ""
    var images: [DrawingImage] = []
    var coverPhoto: Data?
    var image: UIImage {
        if let coverPhoto, let uiImage = UIImage(data: coverPhoto) {
            return uiImage
        } else {
            return Constants.placeholder
        }
    }
    var cameraImage: UIImage?
    var prompt:  DrawingPrompt?
    
    
    
    init() {}
    init(prompt: DrawingPrompt) {
        self.prompt = prompt
        self.category = prompt.category
        self.title = prompt.title
        self.coverPhoto = prompt.coverPhoto
      
     
        
    }
    
    @MainActor
    func clearImage() {
            coverPhoto = nil
        }
    @MainActor
    func clearImages() {
        images.removeAll()
        
    }
    
    func updatePrompt() {
        guard let prompt else { return }
        
        if image != Constants.placeholder {
                prompt.coverPhoto = image.jpegData(compressionQuality: 0.8)
            } else {
                coverPhoto = nil
            }
            

      
        prompt.title = title
        prompt.category = category
    }
  
    
    var isDisabled: Bool {title.isEmpty || category.isEmpty}
    var isUpdating: Bool { prompt != nil}
    
    
}

