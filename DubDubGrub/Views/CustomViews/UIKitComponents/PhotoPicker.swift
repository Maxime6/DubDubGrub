//
//  PhotoPicker.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 04/06/2024.
//

import Foundation
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.image = image
            }
            
            photoPicker.presentationMode.wrappedValue.dismiss()
        }
    }
}
