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
    @Environment(SwiftDataViewModel.self) var viewModel
    @State var vm : UpdateEditFormViewModel
    @State private var imagePicker = ImagePicker()
    @State private var showCamera = false
    @State private var cameraError: CameraPermission.CameraError?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $vm.title)
                TextField("Category", text: $vm.category)
                Image(uiImage: vm.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                
                HStack {
                    Spacer()
                    Button {
                        if vm.isUpdating {
                            vm.updatePrompt()
                            dismiss()
                            
                        }
                        
                        else {
                            
                            let prompt = vm.createPrompt()
                            viewModel.addPrompt(prompt: prompt)
                            dismiss()
                            
                        
                            
                        }
                        
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
                ToolbarItemGroup {
                    Button("Camera", systemImage: "camera") {
                        if let error = CameraPermission.checkPermissions(){
                            cameraError = error
                        }
                        else {
                            showCamera.toggle()
                        }
                    }
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
                    
                    PhotosPicker(selection: $imagePicker.selectedItem) {
                        Label("Photos", systemImage: "photo")
                    }
                    
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: DrawingPrompt.self, configurations: config)
    let datavm = SwiftDataViewModel(modelContext: container.mainContext)
    UpdateEditFormView(vm: UpdateEditFormViewModel())
        .environment(datavm)
        
}
