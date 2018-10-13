//
//  PhotosViewController.swift
//  Photos
//
//  Created by Anand Kulkarni on 10/8/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        imagePicker .allowsEditing = false
        
        present(imagePicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        else {
            print("Error")
        }
    }
    @IBAction func openPhotoLibrary(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("Unable to open Photo Library")
            return
        }
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true)
    }
}
//extension PhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        defer {
//            picker.dismiss(animated: true)
//        }
//
//        print(info)
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        defer {
//            picker.dismiss(animated: true)
//        }
//
//        print("did cancel")
//    }
//}
