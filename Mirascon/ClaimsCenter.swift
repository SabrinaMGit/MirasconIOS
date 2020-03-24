//
//  ClaimsCenter.swift
//  Mirascon
//
//  Created by Dev-Notebook on 28.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimsCenter: View {
    let blueRectangle = Color(hex: "#1b325e")
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let cForm = ClaimsForm(ViewRouter())
    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack(alignment: .center){
                    Text("")
                    Image("MirasconLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200.0,height:100, alignment: .trailing)
                    Button(action: {
                        print("profil tapped!")
                        self.viewRouter.currentPage = "profil"
                    }) {
                        Image("account-edit-outline")
                            .padding(.leading)
                            .foregroundColor(Color.white)
                    }
                }
                Text(" Your Data: \n First Name: \(cForm.firstNameSaved!),\n Last Name: \(cForm.lastNameSaved!),\n License Plate: \(cForm.lpSaved!)")
                    .frame(minWidth: 390, idealWidth: 390, maxWidth: 390, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(4)
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    print("claimsForm tapped!")
                    self.viewRouter.currentPage = "claimsForm"
                }) {
                    ClaimsCenterRow(image: "fillForm", name: "FILL OUT THE CLAIMS FORM")
                        .frame(width: 370.0,height:100)
                        .border(endColor, width: 2)
                }.buttonStyle(btnStyle());
                Button(action: {
                    print("camera tapped!")
                    self.viewRouter.currentPage = "camera"
                }) {
                    ClaimsCenterRow(image: "camera", name: "PHOTOS CAMERA UPLOAD      ")
                        .frame(width: 370.0,height:100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(endColor, lineWidth: 2)
                    )}.buttonStyle(btnStyle());
                Button(action: {
                    print("other info tapped!")
                    self.viewRouter.currentPage = "googleMaps"
                }) {
                    ClaimsCenterRow(image: "cellphone_information", name: "OTHER INFO MP / POLICE        ")
                        .frame(width: 370.0,height:100)
                        .border(endColor, width: 2)
                }.buttonStyle(btnStyle());
                Button(action: {
                    print("glass damage tapped!")
                    self.viewRouter.currentPage = "glassDamage"
                }) {
                    ClaimsCenterRow(image: "ic_glassdamage", name: "GLASS DAMAGE                       ")
                        .frame(width: 370.0,height:100)
                        .border(endColor, width: 2)
                }.buttonStyle(btnStyle())
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
                
                
                Spacer()
            }
        }
    }
}

struct ClaimsCenter_Previews: PreviewProvider {
    static var previews: some View {
        ClaimsCenter(ViewRouter())
    }
}
struct ClaimsCenterRow: View {
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
        }
    }
}
