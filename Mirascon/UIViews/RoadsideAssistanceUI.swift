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
                Spacer()
                cellphone_layout(description: stringsClass.description)
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
                    backBtn_view(viewRouter: viewRouter)
                    
                }
            }
        }
    }}

struct RoadsideAssistanceUI_Previews: PreviewProvider {
    static var previews: some View {
        RoadsideAssistanceUI(ViewRouter())
    }
}
