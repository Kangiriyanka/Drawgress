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
    @State var vm : UpdateEditFormViewModel
    @State private var imagePicker = ImagePicker()
    
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
                           
                       }
                       
                       else {
                           
                           
                           
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
            .toolbar {
                ToolbarItemGroup {
                    Button("Camera", systemImage: "camera") {}
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
    UpdateEditFormView(vm: UpdateEditFormViewModel())
}
