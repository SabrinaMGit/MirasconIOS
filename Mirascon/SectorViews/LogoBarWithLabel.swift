//
//  LogoBar.swift
//  Mirascon
//
//  Created by Dev-Notebook on 07.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct LogoBarWithLabel: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    var labelName: String
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [colorClass.darkerBlue, colorClass.endColor]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
            VStack(alignment: .center){
                LogoBar()
                HStack {
                    Text("")
                    Divider()
                    Text("\(labelName)")
                        .frame(height: dimensClass.cg_30)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        //.fontWeight(.medium)
                        .cornerRadius(dimensClass.cg_4)
                    Spacer()
                }.background(colorClass.labelColor)
                    .frame(height: dimensClass.cg_20)
                
            }
        }.frame( height: dimensClass.cg_68)
         .padding(.top, 20)
    }
}

struct LogoBarWithLabel_Previews: PreviewProvider {
    static var previews: some View {
        LogoBarWithLabel(labelName: "")
    }
}

/*
 Image("MirasconLogo")
 .resizable()
 .scaledToFit()
 .frame(width: 200.0,height:100, alignment: .center)
 HStack {
 HStack {
 Spacer()
 VStack(alignment: .leading){
 //HStack (spacing: 20) {
 //Text("")
 Text("\(labelName)")
 .frame(height: 40)
 .foregroundColor(Color.white)
 .font(.headline)
 //.fontWeight(.medium)
 .cornerRadius(4)
 //   Spacer()
 //}.background(labelColor)
 
 //.padding(10)
 }
 Spacer()
 }.background(colorClass.labelColor).frame(width: 350,height: 40, alignment: .leading)
 Spacer()
 */
