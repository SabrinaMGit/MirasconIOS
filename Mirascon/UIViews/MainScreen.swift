//
//  MainScreen.swift
//  Mirascon
//
//  Created by Dev-Notebook on 30.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import UIKit

struct MainScreen: View {
    
    let url = URL(string: "https://www.mirascon.com")
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    
    let labelName = "WHAT CAN WE DO FOR YOU?"
    let emergency_img = "emergency"
    let emergency_name = "Emergency Call"
    
    let roadsideAssistance_img = "RoadsideAssistance"
    let roadsideAssistance_name = "Roadside Assistance"
    
    let claimsCenter_img = "ClaimsCenter"
    let claimsCenter_name = "Claims Center"
    
    let products_img = "Products"
    
    let back_btn_img = "btnBack"
    
    let chat_img = "chat_smaller_icon"
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        ZStack {
            RadialGradientUI()
            VStack {
                LogoBarWithLabel(labelName: labelName)
                VStack {
                    HStack{
                        MainViewRow(viewModel: viewRouter, viewRouterName: emergency_img, image: emergency_img, name: emergency_name)
                        MainViewRow(viewModel: viewRouter, viewRouterName: roadsideAssistance_img, image: roadsideAssistance_img, name: roadsideAssistance_name)
                    }
                    HStack{
                        MainViewRow(viewModel: viewRouter, viewRouterName: claimsCenter_img, image: claimsCenter_img, name: claimsCenter_name)
                        MainViewRow(viewModel: viewRouter, viewRouterName: products_img, image: products_img, name: products_img)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            exit(Int32(self.dimensClass.cg_0));
                        }) {
                            Image(back_btn_img)
                                .foregroundColor(Color.white)
                        }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                            .padding()
                            .padding(.horizontal, dimensClass.cg_10)
                            .background(colorClass.endColor)
                            .cornerRadius(dimensClass.cg_10)
                    }
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    //self.viewRouter.currentPage = "chatFirebase"
                }) {
                    Image(chat_img)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(dimensClass.cg_5)
                        .mask(Circle())
                }
            }
        }
        
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(ViewRouter())
    }
}

struct MainViewRow: View {
    
    @ObservedObject var viewModel:ViewRouter
    let dimensClass = dimens()
    var viewRouterName: String
    var image: String
    var name: String
    
    var body: some View {
        Button(action: {
            self.viewModel.currentPage = "\(self.viewRouterName)"
        }) {
            VStack{
                Image("\(image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensClass.cg_190,height: dimensClass.cg_190)
                    .foregroundColor(Color.white)
                Text("\(name)")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(Int(dimensClass.cg_2))
            }.buttonStyle(btnStyle())
        }
    }
}


struct btnStyle: ButtonStyle {
     let dimensClass = dimens()
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                .scaleEffect(configuration.isPressed ? dimensClass.cg_scaleEffect_0_9 : dimensClass.cg_scaleEffect_1)
        }
    }
}

import WebKit

struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

