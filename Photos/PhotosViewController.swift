//
//  PhotosViewController.swift
//  Photos
//
//  Created by Anand Kulkarni on 10/8/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let imagePicker = UIImagePickerController()
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func openCamera(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("camera not supported by this device")
            return
        }
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker .allowsEditing = true
        
        present(imagePicker, animated: true)
    }
//    func openCamera() {
//        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
//            print("camera not supported by this device")
//            return
//        }
//        imagePicker.sourceType = .camera
//        imagePicker.delegate = self
//        imagePicker .allowsEditing = true
//
//        present(imagePicker, animated: true)
//    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
    }
    @IBAction func openPhotoLibrary(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("Unable to open Photo Library")
            return
        }
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
//    func openPhotoLibrary() {
//        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
//            print("Unable to open Photo Library")
//            return
//        }
//        
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.delegate = self
//        
//        present(imagePicker, animated: true)
//    }
}
extension PhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        defer {
            picker.dismiss(animated: true)
        }
        
        print(info)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        defer {
            picker.dismiss(animated: true)
        }
        
        print("did cancel")
    }
}
