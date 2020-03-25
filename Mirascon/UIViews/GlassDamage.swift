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
    
    let blueRectangle = Color(hex: "#1b325e")
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let pictureHolderColor = Color(hex: "#19334f")
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("MirasconLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:100)
                Text(" INSTRUCTION WHAT TO MAKE PHOTOS FROM \n - CAR \n - SCENE \n - OTHER")
                    .frame(minWidth: 390, idealWidth: 390, maxWidth: 390, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(4)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    HStack {
                        Text("When?:")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    TextField("", text: $when)
                        .padding(8)
                        .background(blueRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke( lineWidth: 0)
                    )
                    HStack {
                        Text("Where?:")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    TextField("", text: $wheree)
                        .padding(8)
                        .background(blueRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke( lineWidth: 0)
                    )
                    HStack {
                        Text("What?:")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    TextField("", text: $what)
                        .padding(8)
                        .background(blueRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke( lineWidth: 0)
                    )
                }.padding()
                Spacer()
                HStack{
                    ZStack{
                        if image1 != nil{
                            image1?.resizable()
                                .scaledToFit()
                                .frame(width: 200.0,height:200)
                                .background(pictureHolderColor)
                        } else {
                            Image("gesture-tap")
                                .frame(width: 200.0,height:200)
                                .background(pictureHolderColor)
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
                                .frame(width: 200.0,height:200)
                                .background(pictureHolderColor)
                        } else {
                            Image("gesture-tap")
                                .frame(width: 200.0,height:200)
                                .background(pictureHolderColor)
                        }}
                        .onTapGesture {
                            self.showingImagePicker2 = true
                    }.sheet(isPresented: $showingImagePicker2, onDismiss: loadImage2) {
                        ImagePicker(image: self.$inputImage2)
                    }
                }
                ZStack{
                    Button(action: {
                        print("send tapped!")
                        //self.showCaptureImageView.toggle()
                        MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                    }) {
                        Text("SEND")
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                    }}.buttonStyle(GradientBackgroundStyle())
                    //            .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                }
                .alert(isPresented: self.$alertNoMail) {
                    Alert(title: Text("NO MAIL SETUP"))
                }
                Button(action: {
                    print("back tapped!")
                    self.viewRouter.currentPage = "claimsCenter"
                }) {
                    Image("btnBack")
                        .foregroundColor(Color.white)
                    
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(endColor)
                    .cornerRadius(10)
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
