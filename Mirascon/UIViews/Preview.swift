//
//  Preview.swift
//  Mirascon
//
//  Created by Dev-Notebook on 10.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct Preview: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack(alignment: .center){
                Text("Welcome to \n MIRASCON")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                /*Text("MIRASCON")
                    .foregroundColor(colorClass.blue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)*/
                List{
                    PreviewRow(image: "Claims_80x80px", name: "Claims Center", description: "Mirascon supports you by quickly connecting to your local emergency center and also creating an accident report for you.")
                    PreviewRow(image: "Police_80x80px", name: "Emergency Center", description: "Mirascon supports you by quickly connecting to your local emergency center and also creating an accident report for you.")
                    PreviewRow(image: "GlassDamage_1024x1024px", name: "Glass Damage", description: "Mirascon supports you by quickly connecting to your local emergency center and also creating an accident report for you.")
                    PreviewRow(image: "Chat_80x80px", name: "Support", description: "Mirascon supports you by quickly connecting to your local emergency center and also creating an accident report for you.")
                }
                .listRowInsets(EdgeInsets())
                Button(stringsClass.continue_name) {
                    self.viewRouter.currentPage = self.stringsClass.view_saveData
                }.foregroundColor(Color.white)
                    .buttonStyle(GradientBackgroundStyle(color: colorClass.blue))
                
            }.padding(10)
        }
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(ViewRouter())
    }
}
