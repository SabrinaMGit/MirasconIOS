//
//  RoadsideAssistanceUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 20.12.19.
//  Copyright © 2019 MIRASCON. All rights reserved.
//

import SwiftUI

struct RoadsideAssistanceUI: View {
    let colorClass = ColorUI()
    let roadsideNmb = ""
    let carclaimsNmb = ""
    let labelName = "ROADSIDE ASSISTANCE"
    let description = "If you need help, call the roadside assistance contacts"
    let tel = "tel://"
    let view_mainview = "mainView"
    
    let phoneCall_img = "PhoneCall"
    let roadside_img = "RoadsideAssistance"
    let carClaims_img = "CarClaims"
    let carClaims_description = "0800 CARCLAIMS         "
    let back_btn_img = "btnBack"
    

    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.viewRouter = viewRouter
    }
    var body: some View {
        ZStack {
            RadialGradientUI()
            VStack {
                LogoBarWithLabel(labelName: labelName)
                Spacer()
                Image(phoneCall_img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:130)
                Spacer()
                Text( description)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
                VStack {
                    
                    Button(action: {
                        let formattedString = self.tel + self.roadsideNmb
                        let url = URL(string: formattedString)!
                        UIApplication.shared.open(url)  }){
                            Rows(image: roadside_img, name: labelName)
                    }.buttonStyle(btnStyle()); Button(action: {
                        let formattedString = self.tel + self.carclaimsNmb
                        let url = URL(string: formattedString)!
                        UIApplication.shared.open(url)  }){
                            Rows(image: carClaims_img, name: carClaims_description)
                    }.buttonStyle(btnStyle())
                    
                    Spacer()
                    Button(action: {
                        self.viewRouter.currentPage = self.view_mainview
                    }) {
                        Image(back_btn_img)
                            .foregroundColor(Color.white)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(colorClass.endColor)
                        .cornerRadius(10)
                    
                }
            }
        }
    }}

struct RoadsideAssistanceUI_Previews: PreviewProvider {
    static var previews: some View {
        RoadsideAssistanceUI(ViewRouter())
    }
}
