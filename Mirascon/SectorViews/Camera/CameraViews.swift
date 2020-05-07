//
//  CameraView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MessageUI
import UIKit

struct CameraViews: UIViewControllerRepresentable {

@Binding var showCameraView: Bool
@Binding var pickedImage: Image?

func makeCoordinator() -> CameraViews.Coordinator {
    Coordinator(self)
}

func makeUIViewController(context: UIViewControllerRepresentableContext<CameraViews>) -> UIViewController {
    let cameraViewController = UIImagePickerController()
    cameraViewController.delegate = context.coordinator
    cameraViewController.sourceType = .camera
    cameraViewController.allowsEditing = false
    return cameraViewController
}

func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CameraViews>) {

}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: CameraViews

    init(_ cameraView: CameraViews) {
        self.parent = cameraView
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        parent.pickedImage = Image(uiImage: uiImage)
        parent.showCameraView = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.showCameraView = false
    }
}
}

