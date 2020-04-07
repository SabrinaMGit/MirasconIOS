//
//  EmergencyUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 20.12.19.
//  Copyright © 2019 MIRASCON. All rights reserved.
//

import SwiftUI

struct EmergencyUI: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    let colorClass = ColorUI()
    let view_label_description = "If you need help, quickly call the emergency contacts"
    let tel = "tel://"
    let width = 160.0
    let height = 130
    
    //telefon number's
    let police_number = "110"
    let fireDepartment_number = "112"
    let mirascon_number = ""
    
    //img's and button name's
    let emergencyService_name = "EMERGENCY SERVICE"
    let phoneCall_img = "PhoneCall"
    let police_img = "Police"
    let police_description = "POLICE 110                   "
    let firedepartment_img = "FireDepartment"
    let firedepartment_description = "FIRE DEPARTMENT 112"
    let mirasconStar_img = "MirasconStar"
    let mirasconStar_description = "0800 MIRASCON         "
    let back_btn_img = "btnBack"
    
    //view's
    let view_mainview = "mainView"
    
    
    
    init(_ viewRouter: ViewRouter){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        ZStack {
            RadialGradientUI()
            VStack {
                Spacer()
                LogoBarWithLabel(labelName: emergencyService_name)
                Image(phoneCall_img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat(width),height: CGFloat(height))
                Text(view_label_description)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding()
                VStack {
                        Button(action: {
                            let formattedString = self.tel + self.police_number
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: police_img, name: police_description)
                        }.buttonStyle(btnStyle()); Button(action: {
                            let formattedString = self.tel + self.fireDepartment_number
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: firedepartment_img, name: firedepartment_description)
                        }.buttonStyle(btnStyle()); Button(action: {
                            let formattedString = self.tel + self.mirascon_number
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: mirasconStar_img, name: mirasconStar_description)
                        }.buttonStyle(btnStyle())
                    
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
    }
}

struct EmergencyUI_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyUI(ViewRouter())
    }
}

struct Rows: View {
    let colorClass = ColorUI()
    var image: String
    var name: String
    
    let cg_100 = 100
    let cg_370 = 370
    let cg_90 = 90
    let cg_2 = 2
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: CGFloat(cg_100),height: CGFloat(cg_90))
            Text("\(name)")
                .foregroundColor(Color.white)
        } .frame(width: CGFloat(cg_370),height: CGFloat(cg_100))
            .border(colorClass.endColor, width: CGFloat(cg_2))
    }
}
