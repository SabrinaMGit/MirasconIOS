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
    let dimensClass = dimens()
    let stringsClass = strings()

    
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
                LogoBarWithLabel(labelName: stringsClass.labelNameR)
                Spacer()
                Image(stringsClass.phoneCall_img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensClass.cg_200,height: dimensClass.cg_130)
                Spacer()
                Text( stringsClass.description)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
                VStack {
                    
                    Button(action: {
                        let formattedString = self.stringsClass.tel + self.stringsClass.roadsideNmb
                        let url = URL(string: formattedString)!
                        UIApplication.shared.open(url)  }){
                            Rows(image: stringsClass.roadside_img, name: stringsClass.labelNameR)
                    }.buttonStyle(btnStyle()); Button(action: {
                        let formattedString = self.stringsClass.tel + self.stringsClass.carclaimsNmb
                        let url = URL(string: formattedString)!
                        UIApplication.shared.open(url)  }){
                            Rows(image: stringsClass.carClaims_img, name: stringsClass.carClaims_description)
                    }.buttonStyle(btnStyle())
                    
                    Spacer()
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
    }}

struct RoadsideAssistanceUI_Previews: PreviewProvider {
    static var previews: some View {
        RoadsideAssistanceUI(ViewRouter())
    }
}
