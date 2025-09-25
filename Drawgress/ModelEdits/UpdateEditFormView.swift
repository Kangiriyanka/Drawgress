//
//  UpdateEditFormView.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/22.
//

import SwiftUI
import SwiftData
import PhotosUI


struct UpdateEditFormView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(SwiftDataViewModel.self) var dataModel
    @State var vm : UpdateEditFormViewModel
    @State private var imagePicker = ImagePicker()
    @State private var showCamera = false
    @State private var cameraError: CameraPermission.CameraError?
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
              
                VStack {
                    CustomTextField(title: "Title", text: $vm.title, icon: "textformat")
                    CustomTextField(title: "Category", text: $vm.category, icon: "folder")
                }.padding(.horizontal)
                
                Image(uiImage: vm.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                
                // MARK: UIKitCamera or Picker Buttons
                HStack {
                    cameraButton()
                    
                    PhotosPicker(selection: $imagePicker.selectedItem) {
                        Label("Photos", systemImage: "photo")
                    }
                    .buttonStyle(CameraButtonStyle(color: Color.espressoBrown))
                    
                    
                }
                
                HStack {
                    Spacer()
                    Button {
                        handleSave()
                        
                    } label: {
                        Text(vm.isUpdating ? "Update" : "Add")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(vm.isDisabled)
                    
                    if vm.coverPhoto != nil {
                        Button("Clear Image") {
                            
                            vm.clearImage()
                            
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                
                
            }
            .onAppear {
                imagePicker.setup(vm)
            }
            .onChange(of: vm.cameraImage) {
                if let image = vm.cameraImage {
                    vm.coverPhoto = image.jpegData(compressionQuality: 0.8)
                }
            }
            .toolbar {
               
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
    }
    
    
    
    
    /// Saves the form data by either updating an existing prompt or creating a new one
    private func handleSave() {
        if vm.isUpdating {
            vm.updatePrompt()
        } else {
            let prompt = vm.createPrompt()
            dataModel.addPrompt(prompt: prompt)
        }
        dismiss()
    }
    
    /// CameraButton that shows the UIKitCamera
    ///
    private func cameraButton() ->  some View {

            Button("Camera", systemImage: "camera") {
                if let error = CameraPermission.checkPermissions(){
                    cameraError = error
                }
                else {
                    showCamera.toggle()
                }
            }
            // Display the alert if the cameraError isn't nil
            .alert(isPresented: .constant(cameraError != nil), error: cameraError) { _ in
                Button("OK") {
                    cameraError = nil
                }
            } message: { error in
                Text(error.recoverySuggestion ?? "Try again later")
            }
            .sheet(isPresented: $showCamera) {
                UIKitCamera(selectedImage: $vm.cameraImage)
                    .ignoresSafeArea(.all)
                
            }
            .buttonStyle(CameraButtonStyle(color: Color.richBrown))
        
            
        }
    }


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: DrawingPrompt.self, configurations: config)
    let datavm = SwiftDataViewModel(modelContext: container.mainContext)
    UpdateEditFormView(vm: UpdateEditFormViewModel())
        .environment(datavm)
        
}
