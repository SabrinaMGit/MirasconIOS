//
//  ClaimReason.swift
//  Mirascon
//
//  Created by Dev-Notebook on 05.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimReason: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack{
                HStack {
                    Spacer()
                    Spacer()
                    LogoBar()
                    Spacer()
                    Button(action: {
                        //self.viewRouter.currentPage = "claimsForm"
                    }) {
                        Image("help")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.white)
                            .frame(width: dimensClass.cg_30,height: dimensClass.cg_30)
                    }
                    Spacer()
                }
                Walkthrough()
                List{
                    HStack{
                        //Spacer()
                    VStack {
                        ImageRow(image: stringsClass.roadside_img, label: "I habe a flat tire.")
                        ImageRow(image: stringsClass.roadside_img, label: "I habe a flat tire.")
                        ImageRow(image: stringsClass.roadside_img, label: "I habe a flat tire.")
                        ImageRow(image: stringsClass.roadside_img, label: "I habe a flat tire.")
                        ImageRow(image: stringsClass.roadside_img, label: "I habe a flat tire.")
                        ImageRow(image: stringsClass.roadside_img, label: "I habe a flat tire.")
                    }
                    .padding(.top, 20)
                    .listRowInsets(EdgeInsets())
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ClaimReason_Previews: PreviewProvider {
    static var previews: some View {
        ClaimReason()
    }
}

struct ImageRow : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var image: String
    var label: String
    
    var body: some View {
        
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: CGFloat(dimensClass.cg_80),height: CGFloat(dimensClass.cg_60))
            Text("\(label)")
                .foregroundColor(Color.white)
        } .frame(width: CGFloat(dimensClass.cg_350),height: CGFloat(dimensClass.cg_60))
            .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
        
    }
}
