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
    let stringsClass = strings()
    
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
                LogoBarWithLabel(labelName: stringsClass.emergencyService_name)
                Image(stringsClass.phoneCall_img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensClass.cg_160,height: dimensClass.cg_130)
                Text(stringsClass.view_label_description)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding()
                VStack {
                        Button(action: {
                            let formattedString = self.stringsClass.tel + self.stringsClass.police_number
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: stringsClass.police_img, name: stringsClass.police_description)
                        }.buttonStyle(btnStyle()); Button(action: {
                            let formattedString = self.stringsClass.tel + self.stringsClass.fireDepartment_number
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: stringsClass.firedepartment_img, name: stringsClass.firedepartment_description)
                        }.buttonStyle(btnStyle()); Button(action: {
                            let formattedString = self.stringsClass.tel + self.stringsClass.mirascon_number
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: stringsClass.mirasconStar_img, name: stringsClass.mirasconStar_description)
                        }.buttonStyle(btnStyle())
                    
                    Button(action: {
                        self.viewRouter.currentPage = self.stringsClass.view_mainview
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
