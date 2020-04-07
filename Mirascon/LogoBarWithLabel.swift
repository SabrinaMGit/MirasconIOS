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
    var labelName: String
    let height = 40
    
    var body: some View {
        VStack{
            LogoBar()
            HStack {
                Text("")
                Divider()
                Text("\(labelName)")
                    .frame(height: CGFloat(height))
                    .foregroundColor(Color.white)
                    .font(.headline)
                    //.fontWeight(.medium)
                    .cornerRadius(4)
                Spacer()
            }.background(colorClass.labelColor)
                .frame(height: CGFloat(height))
            
            
            
        }
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
