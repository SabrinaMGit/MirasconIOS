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
                LogoBarWithLabel(labelName: stringsClass.emergencyService_name)
                cellphone_layout(description: stringsClass.view_label_description)
                VStack {
                    //Change this maybe
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
                    
                  Spacer()
                }
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_mainview)
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
                .frame(width: CGFloat(dimensClass.cg_80),height: CGFloat(dimensClass.cg_60))
            Text("\(name)")
                .foregroundColor(Color.white)
        } .frame(width: CGFloat(dimensClass.cg_300),height: CGFloat(dimensClass.cg_60))
            .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
    }
}
