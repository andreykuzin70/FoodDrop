//
//  ImagePickerVM.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 4/16/21.
//

import Foundation
import SwiftUI


struct ImagePicker:UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool
    @Binding var imageButtonText: String
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(image: $image, showImagePicker: $showImagePicker, imageButtonText: $imageButtonText )
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context){

    }
    
}


class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
    @Binding var image:UIImage?
    @Binding var showImagePicker: Bool
    @Binding var imageButtonText: String
    
    init(image: Binding<UIImage?>, showImagePicker: Binding<Bool>, imageButtonText: Binding<String>){
        _image = image
        _showImagePicker = showImagePicker
        _imageButtonText = imageButtonText
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image = uiimage
            showImagePicker = false
            imageButtonText = "Image Attached"
        }
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showImagePicker = false
    }
}
