//
//  GlassDamage.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MessageUI

struct GlassDamage: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    
    @State var when: String = ""
    @State var wheree: String = ""
    @State var what: String = ""
    
    @State private var image1: Image?
    @State var showCaptureImageView1: Bool = false
    @State private var showingImagePicker1 = false
    @State private var inputImage1: UIImage?
    @State private var image2: Image?
    @State private var showingImagePicker2 = false
    @State private var inputImage2: UIImage?
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false

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
                VStack{
                    HStack {
                        Text(stringsClass.when_txt)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    TextField(stringsClass.emptyText, text: $when)
                        .padding(dimensClass.cg_8)
                        .background(colorClass.blueRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                            .stroke( lineWidth: dimensClass.cg_0)
                    )
                    HStack {
                        Text(stringsClass.where_txt)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    TextField(stringsClass.emptyText, text: $wheree)
                        .padding(dimensClass.cg_8)
                        .background(colorClass.blueRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                            .stroke( lineWidth: dimensClass.cg_0)
                    )
                    HStack {
                        Text(stringsClass.what_txt)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    TextField(stringsClass.emptyText, text: $what)
                        .padding(dimensClass.cg_8)
                        .background(colorClass.blueRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                            .stroke( lineWidth: dimensClass.cg_0)
                    )
                }.padding()
                Spacer()
                HStack{
                    ZStack{
                        if image1 != nil{
                            image1?.resizable()
                                .scaledToFit()
                                .frame(width: dimensClass.cg_200, height:dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        } else {
                            Image(stringsClass.gesture_tap_img)
                                .frame(width: dimensClass.cg_200,height:dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker1 = true
                    }.sheet(isPresented: $showingImagePicker1, onDismiss: loadImage1) {
                        ImagePicker(image: self.$inputImage1)
                    }
                    ZStack{
                        if image2 != nil{
                            image2?.resizable()
                                .scaledToFit()
                                .frame(width: dimensClass.cg_200,height:dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        } else {
                            Image(stringsClass.gesture_tap_img)
                                .frame(width: dimensClass.cg_200,height:dimensClass.cg_200)
                                .background(colorClass.pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker2 = true
                    }.sheet(isPresented: $showingImagePicker2, onDismiss: loadImage2) {
                        ImagePicker(image: self.$inputImage2)
                    }
                }
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
                }
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
        }
    }
    func loadImage1() {
        guard let inputImage1 = inputImage1 else { return }
        image1 = Image(uiImage: inputImage1)
    }
    func loadImage2() {
        guard let inputImage2 = inputImage2 else { return }
        image2 = Image(uiImage: inputImage2)
    }
}

struct GlassDamage_Previews: PreviewProvider {
    static var previews: some View {
        GlassDamage(ViewRouter())
    }
}

