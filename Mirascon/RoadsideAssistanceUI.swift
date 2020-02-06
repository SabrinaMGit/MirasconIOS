//
//  RoadsideAssistanceUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 20.12.19.
//  Copyright © 2019 MIRASCON. All rights reserved.
//

import SwiftUI

struct RoadsideAssistanceUI: View {
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let roadsideNmb = ""
    let carclaimsNmb = ""
    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.viewRouter = viewRouter
    }
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("MirasconLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:100)
                HStack {
                    Image("roadside_assistance_label")
                    Spacer()
                }
                Spacer()
                Image("PhoneCall")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:130)
                Spacer()
                Text("If you need help, call the roadside assistance contacts")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
                VStack {
                    Form{
                        Button(action: {
                            print("police number tapped!")
                            let tel = "tel://"
                            let formattedString = tel + self.roadsideNmb
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: "RoadsideAssistance", name: "ROADSIDE ASSISTANCE")
                        }; Button(action: {
                            print("police number tapped!")
                            let tel = "tel://"
                            let formattedString = tel + self.carclaimsNmb
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image: "CarClaims", name: "0800 CARCLAIMS         ")
                        }
                    }
                    Spacer()
                    Button(action: {
                        print("back tapped!")
                        self.viewRouter.currentPage = "mainView"
                    }) {
                        Image("btnBack")
                            .foregroundColor(Color.white)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(endColor)
                        .cornerRadius(10)
                    
                }
            }
        }
    }}

struct RoadsideAssistanceUI_Previews: PreviewProvider {
    static var previews: some View {
        RoadsideAssistanceUI(ViewRouter())
    }
}

/* HStack {
 HStack{
 Image("RoadsideAssistance")
 .resizable()
 .scaledToFit()
 .foregroundColor(Color.white)
 .frame(width: 100.0,height: 90)
 Text("POLICE 110")
 .foregroundColor(Color.white)
 }
 Spacer()
 }.padding()
 HStack{
 Image("CarClaims")
 .resizable()
 .scaledToFit()
 .foregroundColor(Color.white)
 .frame(width: 100.0,height: 90)
 Text("FIRE DEPARTMENT 112")
 .foregroundColor(Color.white)
 Spacer()
 }.padding()
 */
