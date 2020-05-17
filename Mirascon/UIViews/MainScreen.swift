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
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    let url = URL(string: "https://www.mirascon.com")
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        ZStack {
            if sizeClass == .compact {
            RadialGradientUI()
            VStack {
                LogoBarWithLabel(labelName: stringsClass.labelNameM)
                Spacer()
                    HStack{
                        MainViewRow(viewModel: viewRouter, viewRouterName: stringsClass.emergency_img, image: stringsClass.emergency_img, name: stringsClass.emergency_name)
                        MainViewRow(viewModel: viewRouter, viewRouterName: stringsClass.roadsideAssistance_img, image: stringsClass.roadsideAssistance_img, name: stringsClass.roadsideAssistance_name)
                    }
                Spacer()
                 //view.flex.addItem(imageView).width(100).aspectRatio(1)
                    HStack{
                        MainViewRow(viewModel: viewRouter, viewRouterName: stringsClass.view_claimsCenter, image: stringsClass.claimsCenter_img, name: stringsClass.claimsCenter_name)
                        MainViewRow(viewModel: viewRouter, viewRouterName: stringsClass.products_img, image: stringsClass.products_img, name: stringsClass.products_img)
                }
                Spacer()
            }
            HStack{
                Spacer()
                Button(action: {
                    //self.viewRouter.currentPage = "chatFirebase"
                }) {
                    Image(stringsClass.chat_img)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(dimensClass.cg_5)
                        .mask(Circle())
                }
            }
            } else {
                
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
                    .frame(width: dimensClass.cg_150,height: dimensClass.cg_150)
                    .foregroundColor(Color.white)
                Text("\(name)")
                    .font(.body)
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




//Automatische Standort zur Polizei
//Welchen Support brauchst du gerade?
//Polizei und Notdienst werden automatisch kontaktiert.
//auf Service warten...
//Möchtest du deine Anfrage vervollständigen ?
//Klare Anweisungen

