//
//  MailView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MessageUI
import UIKit

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
        //vc.setMessageBody("<p>First Name: \(String(describing: cForm.firstNameSaved)),\nLast Name: \(String(describing: cForm.lastNameSaved)),\nLicense Plate: \(String(describing: cForm.lpSaved)),\nPhone Number: \(String(describing: cForm.phoneSaved)),\n EMail: \(String(describing: cForm.mailSaved)),\nLatitude: \(self.gMap.userLatitude) Longitute:  \(self.gMap.userLongitude)</p>", isHTML: true)
        //vc.setMessageBody("Hello Im here", isHTML: false)
        
        //vc.addAttachmentData(self.image, mimeType: <#T##String#>, fileName: <#T##String#>)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}
