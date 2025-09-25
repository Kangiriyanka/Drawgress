import SwiftUI
struct UIKitCamera: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    /// Creates the image picker with custom options
    /// The delegate is the coordinator, it's the object that handles the image after its been captured/selected
    /// When the user selects a picture, the imagePickerController function from the delegate is called.
 
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    
    /// Required by UIViewControllerRepresentable,
    /// See https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable/updateuiviewcontroller(_:context:)
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    /// Create an instance of the Coordinator
    /// self refers to the UIKitCamera instance, so the Coordinator's parent is the UIKitCamera calss
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: UIKitCamera
        init(parent: UIKitCamera) {
            self.parent = parent
        }
        
        /// info dictionary contains all the data from the selected/taken picture (image, metadata, etc.)
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
            
        }
    }
    
    
    
}
