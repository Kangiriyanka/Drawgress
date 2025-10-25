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
    @State private var isNewCategory = false
    @State private var selectedCategory: DrawingCategory?
    
    

    @State private var cameraError: CameraPermission.CameraError?
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                titleField
                promptField
                
                categoryField
                
                
                imageField
              
                saveButton
            }
            
            .background(Color.bgCream.gradient)
            .onAppear {
                imagePicker.setup(vm)
            }
            .onChange(of: vm.cameraImage) {
                // Camera -> cameraImage gets filled -> back to coverPhoto
                if let image = vm.cameraImage {
                    vm.coverPhoto = image.jpegData(compressionQuality: 0.8)
                }
            }
            .toolbar {
               
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
    }
    

    /// Saves the form data by either updating an existing prompt or creating a new one
    /// Uses two ViewModels, one to add the prompt to SwiftData and the other to modify the cover image
    private func handleSave() {
        if vm.isUpdating {
            vm.updatePrompt()
        } else {
            let prompt = vm.createPrompt()
            let category = vm.createCategory()
            
            dataModel.addPrompt(prompt: prompt)
//            if isNewCategory {
//                dataModel.addCategory(category: category)
//            }
        }
        dismiss()
    }
    // MARK: - Subviews
    private var titleField: some View {
        (vm.isUpdating ? Text("Update \(vm.title)") : Text("Add Prompt"))
            .font(.title).bold()
            .padding()
           
    }
    
    
    
    private var promptField: some View {
        VStack(alignment: .leading){
                CustomHeader(title: "Title", icon: "textformat")
                CustomTextField(title: "Title", text: $vm.title, )
           
            }
            .padding(.horizontal)
    }
    

    private var categoryField: some View {
        VStack(alignment: .leading){
          
            CustomHeader(title: "Category", icon: "menucard")
               
            
            if dataModel.categories.isEmpty || isNewCategory {
                CustomTextField(title: "New Category", text: $vm.categoryName)
                    
            }
            
            
            ScrollView(.horizontal) {
                
               
             
                    if !dataModel.categories.isEmpty {
                        
                        
                        ForEach(dataModel.categories) { category in
                            
                            
                            CategoryBubble(category: category, selectedCategory: $selectedCategory)
                        }
                        
                    }
                    
                  
                }
            
            .onChange(of: selectedCategory) {
                vm.updateCategory(category: selectedCategory!)
            }
         
            
            
            
            Spacer()
            
            
            
            
            if isNewCategory {
                HStack(alignment: .center) {
                    CustomTextField(title: "Category", text: $vm.categoryName,)
                        .padding()
                    ColorPicker("", selection: $vm.categoryColor)
                        .frame(width: 50)
                }
            }
        }
        .padding()
            
            
        
    }
    
  
 
    private var imageField: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
             
                
                cameraPhotosField
            }

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.bgCream)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                

                if vm.coverPhoto != nil {
                    Image(uiImage: vm.image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(alignment: .topTrailing) {
                            Button(action: vm.clearImage) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .background(Circle().fill(.black.opacity(0.3)))
                            }
                            .padding(8)
                        }
                        
                } else {
                    ContentUnavailableView(
                        "Add a cover",
                        systemImage: "photo",
                        
                    )
                    
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
    
    private var cameraPhotosField: some View {
        
        HStack(spacing: 0){
            cameraButton()
            PhotosPicker(selection: $imagePicker.selectedItem) {
                Image(systemName: "photo")
            }
            .buttonStyle(CameraButtonStyle(color: Color.espressoBrown))
            
            
        }
    
        
        
    }
    
    private var saveButton: some View {
        
     
            Button {
                self.handleSave()
                
            } label: {
                HStack(spacing: 5){
                    
                    Spacer()
                   
                    Image(systemName: "plus")
                    Spacer()
                    
                       
                     
                }
              
                  
            }
            .buttonStyle(CameraButtonStyle(color: Color.mahoganyBrown))
            .disabled(vm.isDisabled)
        
               
            

    }
    
    /// CameraButton that shows the UIKitCamera if there's no error.
    private func cameraButton() -> some View {

            Button{
                if let error = CameraPermission.checkPermissions(){
                    cameraError = error
                }
                else {
                    showCamera.toggle()
                }
                
            } label: {
                Image(systemName: "camera")
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
