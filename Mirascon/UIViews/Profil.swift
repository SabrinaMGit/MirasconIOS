//
//  Profil.swift
//  Mirascon
//
//  Created by Dev-Notebook on 08.03.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct Profil: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    let cForm = ClaimsForm(ViewRouter())
    
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
                NavigationBarImageUI()
                HStack {
                    Text(stringsClass.emptyText)
                    Divider()
                    Text(stringsClass.profil_txt)
                        .frame(height: dimensClass.cg_40)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        //.fontWeight(.medium)
                        .cornerRadius(dimensClass.cg_4)
                    Spacer()
                }.background(colorClass.labelColor)
                    .frame(height: dimensClass.cg_40)
                Spacer()
                Image(stringsClass.account_circle_img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensClass.cg_70, height: dimensClass.cg_70)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: dimensClass.cg_2))
                    .shadow(radius: dimensClass.cg_10)
                Spacer()
                List {
                    ProfilRow(category:stringsClass.firstName_name, customer_details: "\(cForm.firstNameSaved!)", whichEntry: Int(dimensClass.cg_1))
                    ProfilRow(category:stringsClass.lastName_name, customer_details: "\(cForm.lastNameSaved!)", whichEntry: Int(dimensClass.cg_2))
                    ProfilRow(category:stringsClass.licencePlate_name, customer_details: "\(cForm.lpSaved!)", whichEntry: Int(dimensClass.cg_3))
                    ProfilRow(category:stringsClass.phoneNumber_name, customer_details: "\(cForm.phoneSaved!)", whichEntry: Int(dimensClass.cg_4))
                    ProfilRow(category:stringsClass.email_name, customer_details: "\(cForm.mailSaved!)", whichEntry: Int(dimensClass.cg_5))
                
                }.foregroundColor(Color.white)
                Spacer()
                LogOutView(viewRouter: viewRouter)
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsForm)
                
            }
        }
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil(ViewRouter())
    }
}



