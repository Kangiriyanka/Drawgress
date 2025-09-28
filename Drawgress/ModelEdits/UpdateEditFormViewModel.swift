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
    /// Every UIImage is redirected here.
    var coverPhoto: Data?
    var image: UIImage {
        if let coverPhoto, let uiImage = UIImage(data: coverPhoto) {
            return uiImage
        } else {
            return Constants.placeholder
        }
    }
    
    /// Bind the cameraImage to the UIKitCamera class.
    /// Once a picture is taken, UIKitCamera will fill  cameraImage the UIImage, and the UpdateEditFormView has an onChange  that will change the coverPhoto data.
    var cameraImage: UIImage?
    var prompt: DrawingPrompt?
    
    
    
    init() {}
    init(prompt: DrawingPrompt) {
        self.prompt = prompt
        self.category = prompt.category
        self.title = prompt.title
        self.coverPhoto = prompt.coverPhoto
      
     
    }
    
   
    func clearImage() {
            coverPhoto = nil
        }

    func clearImages() {
        images.removeAll()
        
    }
    
    /// Change the cover photo
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
    
    
    func createPrompt() -> DrawingPrompt {
        return DrawingPrompt(title: self.title , category: self.category)
    }
  
    
    var isDisabled: Bool {title.isEmpty || category.isEmpty}
    var isUpdating: Bool { prompt != nil}
    
    
}

