//
//  uploadPhotos.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MessageUI
import UIKit


struct uploadPhotos: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @State var showCaptureImageView: Bool = false
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var showingImagePicker2 = false
    @State private var inputImage2: UIImage?
    @State private var image2: Image?
    @State private var showingImagePicker3 = false
    @State private var inputImage3: UIImage?
    @State private var image3: Image?
    @State private var showingImagePicker4 = false
    @State private var inputImage4: UIImage?
    @State private var image4: Image?
    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    /*
    let introduction_photos = " INSTRUCTION WHAT TO MAKE PHOTOS FROM \n - CAR \n - SCENE \n - OTHER"
    let gesture_tap_img = "gesture-tap"
    let send_txt = "SEND"
    let no_mail_setup_txt = "NO MAIL SETUP"
 */
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack {
                LogoBar()
                Text(stringsClass.introduction_photos)
                    .frame(minWidth: dimensClass.cg_390, idealWidth: dimensClass.cg_390, maxWidth: dimensClass.cg_390, minHeight: dimensClass.cg_100, idealHeight: dimensClass.cg_100, maxHeight: dimensClass.cg_100, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(dimensClass.cg_4)
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack{
                    ZStack{
                        if image != nil{
                            image?.resizable()
                                .scaledToFit()
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        } else {
                            Image(stringsClass.gesture_tap_img)
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker = true
                    }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: self.$inputImage)
                    }/*.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                     ImagePicker(image: self.$inputImage)
                     }
                     MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                     }
                     //            .disabled(!MFMailComposeViewController.canSendMail())
                     .sheet(isPresented: $isShowingMailView) {
                     MailView(result: self.$result)
                     }
                     .alert(isPresented: self.$alertNoMail) {
                     Alert(title: Text("NO MAIL SETUP"))
                     }*/
                    ZStack{
                        if image2 != nil{
                            image2?.resizable()
                                .scaledToFit()
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        } else {
                            Image(stringsClass.gesture_tap_img)
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker2 = true
                    }.sheet(isPresented: $showingImagePicker2, onDismiss: loadImage2) {
                        ImagePicker(image: self.$inputImage2)
                    }.buttonStyle(btnStyle()) //Check if it zoom in if pressed
                }
                HStack{
                    ZStack{
                        if image3 != nil{
                            image3?.resizable()
                                .scaledToFit()
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        } else {
                            Image(stringsClass.gesture_tap_img)
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker3 = true
                    }.sheet(isPresented: $showingImagePicker3, onDismiss: loadImage3) {
                        ImagePicker(image: self.$inputImage3)
                    }
                    ZStack{
                        if image4 != nil{
                            image4?.resizable()
                                .scaledToFit()
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        } else {
                            Image(stringsClass.gesture_tap_img)
                                .frame(width: dimensClass.cg_200, height: dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker4 = true
                    }.sheet(isPresented: $showingImagePicker4, onDismiss: loadImage4) {
                        ImagePicker(image: self.$inputImage4)
                    }
                }
                Spacer()
                ZStack{
                    Button(action: {
                        //self.showCaptureImageView.toggle()
                        MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                    }) {
                        Text(stringsClass.send_txt)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                    }}.buttonStyle(GradientBackgroundStyle())
                    //            .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                }
                .alert(isPresented: self.$alertNoMail) {
                    Alert(title: Text(stringsClass.no_mail_setup_txt))
                }/*
                 if (isShowingMailView) {
                 mailView()
                 .transition(.move(edge: .bottom))
                 .animation(.default)
                 }*/
                
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_claimsCenter
                }) {
                    Image(stringsClass.back_btn_img)
                        .foregroundColor(Color.white)
                    
                }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, dimensClass.cg_10)
                    .background(colorClass.endColor)
                    .cornerRadius(dimensClass.cg_10)
            }
            /*if (showCaptureImageView) {
             CameraView(showCameraView: $showCaptureImageView, pickedImage: $image)
             }*/
            
            
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    func loadImage2() {
        guard let inputImage2 = inputImage2 else { return }
        image2 = Image(uiImage: inputImage2)
    }
    func loadImage3() {
        guard let inputImage3 = inputImage3 else { return }
        image3 = Image(uiImage: inputImage3)
    }
    func loadImage4() {
        guard let inputImage4 = inputImage4 else { return }
        image4 = Image(uiImage: inputImage4)
    }
    /*private func mailView() -> some View {
     MFMailComposeViewController.canSendMail() ?
     AnyView(MailView(isShowing: $isShowingMailView, result: $result)) :
     AnyView(Text("Can't send emails from this device"))
     }*/
}

struct uploadPhotos_Previews: PreviewProvider {
    static var previews: some View {
        uploadPhotos(ViewRouter())
    }
}



struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        /// Default is images gallery. Un-comment the next line of code if you would like to test camera
        //    picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}


struct MailView: UIViewControllerRepresentable {
    let gMap = GoogleMap()
    let cForm = ClaimsForm(ViewRouter())
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        
        let vc = MFMailComposeViewController()
        //vc.setPreferredSendingEmailAddress("")
        vc.setToRecipients(["claims@mirascon.com"])
        vc.setSubject("Claims Form")
        vc.setMessageBody("<p>First Name: \(String(describing: cForm.firstNameSaved)),\nLast Name: \(String(describing: cForm.lastNameSaved)),\nLicense Plate: \(String(describing: cForm.lpSaved)),\nPhone Number: \(String(describing: cForm.phoneSaved)),\n EMail: \(String(describing: cForm.mailSaved)),\nLatitude: \(self.gMap.userLatitude) Longitute:  \(self.gMap.userLongitude)</p>", isHTML: true)
        //vc.setMessageBody("Hello Im here", isHTML: false)
        
        //vc.addAttachmentData(self.image, mimeType: <#T##String#>, fileName: <#T##String#>)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}
/*
 struct MailView: UIViewControllerRepresentable {
 
 @Binding var isShowing: Bool
 @Binding var result: Result<MFMailComposeResult, Error>?
 
 class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
 
 @Binding var isShowing: Bool
 @Binding var result: Result<MFMailComposeResult, Error>?
 
 init(isShowing: Binding<Bool>,
 result: Binding<Result<MFMailComposeResult, Error>?>) {
 _isShowing = isShowing
 _result = result
 }
 
 func mailComposeController(_ controller: MFMailComposeViewController,
 didFinishWith result: MFMailComposeResult,
 error: Error?) {
 defer {
 isShowing = false
 }
 guard error == nil else {
 self.result = .failure(error!)
 return
 }
 self.result = .success(result)
 }
 }
 
 func makeCoordinator() -> Coordinator {
 return Coordinator(isShowing: $isShowing,
 result: $result)
 }
 
 func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
 let vc = MFMailComposeViewController()
 vc.mailComposeDelegate = context.coordinator
 return vc
 }
 
 func updateUIViewController(_ uiViewController: MFMailComposeViewController,
 context: UIViewControllerRepresentableContext<MailView>) {
 
 }
 }*/

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
}

struct CameraView: UIViewControllerRepresentable {
    
    @Binding var showCameraView: Bool
    @Binding var pickedImage: Image
    
    func makeCoordinator() -> CameraView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIViewController {
        let cameraViewController = UIImagePickerController()
        cameraViewController.delegate = context.coordinator
        cameraViewController.sourceType = .camera
        cameraViewController.allowsEditing = false
        return cameraViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CameraView>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(_ cameraView: CameraView) {
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
