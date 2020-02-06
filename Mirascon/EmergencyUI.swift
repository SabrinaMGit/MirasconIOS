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
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let policeNumber = "110"
    let fireDepartment = "112"
    let mirascon = ""
    
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
                Spacer()
                Image("MirasconLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:40)
                    .padding()
                HStack {
                    Image("emergency_call_Label")
                    Spacer()
                }
                Image("PhoneCall")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160.0,height:130)
                Text("If you need help, quickly call the emergency contacts")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding()
                VStack {
                    Form{
                        Button(action: {
                            print("police number tapped!")
                            let tel = "tel://"
                            let formattedString = tel + self.policeNumber
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image:"Police",name:"POLICE 110                   ")
                        }; Button(action: {
                            print("fireDepartment tapped!")
                            let tel = "tel://"
                            let formattedString = tel + self.fireDepartment
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image:"FireDepartment",name:"FIRE DEPARTMENT 112")
                        }; Button(action: {
                            print("police number tapped!")
                            let tel = "tel://"
                            let formattedString = tel + self.mirascon
                            let url = URL(string: formattedString)!
                            UIApplication.shared.open(url)  }){
                                Rows(image:"MirasconStar",name:"0800 MIRASCON         ")
                        }
                    }
                    
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
    }
}

struct EmergencyUI_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyUI(ViewRouter())
    }
}

struct Rows: View {
    let endColor = Color(hex: "#102234")
    var image: String
    var name: String
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: 100.0,height: 90)
            Text("\(name)")
                .foregroundColor(Color.white)
        } .frame(width: 370.0,height:100)
            .border(endColor, width: 2)
    }
}



/* HStack {
 HStack{
 Image("Police")
 .resizable()
 .scaledToFit()
 .foregroundColor(Color.white)
 .frame(width: 100.0,height: 90)
 Text("POLICE 110")
 .foregroundColor(Color.white)
 } .frame(width: 370.0,height:100)
 .border(endColor, width: 2)
 Spacer()
 }.padding()
 HStack {
 HStack{
 Image("FireDepartment")
 .resizable()
 .scaledToFit()
 .foregroundColor(Color.white)
 .frame(width: 100.0,height: 90)
 Text("FIRE DEPARTMENT 112")
 .foregroundColor(Color.white)
 }.frame(width: 370.0,height:100)
 .border(endColor, width: 2)
 Spacer()
 }.padding()
 HStack {
 HStack{
 Image("MirasconStar")
 .resizable()
 .scaledToFit()
 .foregroundColor(Color.white)
 .frame(width: 100.0,height: 90)
 Text("0800 MIRASCON")
 .foregroundColor(Color.white)
 }.frame(width: 370.0,height:100)
 .border(endColor, width: 2)
 .padding()
 Spacer()
 }
 */
