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
    let dimensClass = dimens()
    
    let view_label_description = "If you need help, quickly call the emergency contacts"
    
    //telefon number's
    let tel = "tel://"
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
                    .frame(width: dimensClass.cg_160,height: dimensClass.cg_130)
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
                        
                    }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, dimensClass.cg_10)
                        .background(colorClass.endColor)
                        .cornerRadius(dimensClass.cg_10)
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
    let dimensClass = dimens()
    
    var image: String
    var name: String
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: CGFloat(dimensClass.cg_100),height: CGFloat(dimensClass.cg_90))
            Text("\(name)")
                .foregroundColor(Color.white)
        } .frame(width: CGFloat(dimensClass.cg_370),height: CGFloat(dimensClass.cg_100))
            .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
    }
}
