//
//  ClaimsCenter.swift
//  Mirascon
//
//  Created by Dev-Notebook on 28.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimsCenter: View {
    
    @ObservedObject var viewRouter: ViewRouter
     
     init(_ viewRouter: ViewRouter){
         self.viewRouter = viewRouter
     }
    
    //initialized classes
    let colorClass = ColorUI()
    let cForm = ClaimsForm(ViewRouter())
    let dimensClass = dimens()
    
    let emptyText = ""
    let fillForm_img = "fillForm"
    let fillForm_description = "FILL OUT THE CLAIMS FORM"
    let camera_description = "PHOTOS CAMERA UPLOAD      "
    let cellphone_img = "cellphone_information"
    let cellphone_decription = "OTHER INFO MP / POLICE        "
    let glassDamage_img = "ic_glassdamage"
    let glassDamage_description = "GLASS DAMAGE                       "
    
    let view_profil = "profil"
    let view_claimsForm = "claimsForm"
    let view_camera = "camera"
    let view_googleMaps = "googleMaps"
    let view_glassDamage = "glassDamage"
    let view_mainView = "mainView"
    
    let edit_img = "account-edit-outline"
    let back_btn_img = "btnBack"
    
    var label_descriptionWithData: String {
          return " Your Data: \n First Name: \(cForm.firstNameSaved!),\n Last Name: \(cForm.lastNameSaved!),\n License Plate: \(cForm.lpSaved!)"
      }

    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack {
                HStack(alignment: .center){
                    Text(emptyText)
                    LogoBar()
                    Button(action: {
                        self.viewRouter.currentPage = self.view_profil
                    }) {
                        Image(edit_img)
                            .padding(.leading)
                            .foregroundColor(Color.white)
                    }
                }
                Text(label_descriptionWithData)
                    .frame(minWidth: dimensClass.cg_390, idealWidth: dimensClass.cg_390, maxWidth: dimensClass.cg_390, minHeight: dimensClass.cg_100, idealHeight: dimensClass.cg_100, maxHeight: dimensClass.cg_100, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(dimensClass.cg_4)
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    self.viewRouter.currentPage = self.view_claimsForm
                }) {
                    ClaimsCenterRow(image: fillForm_img, name: fillForm_description)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .border(colorClass.endColor, width: dimensClass.cg_2)
                }.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.view_camera
                }) {
                    ClaimsCenterRow(image: view_camera, name: camera_description)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .overlay(
                            RoundedRectangle(cornerRadius: dimensClass.cg_1)
                                .stroke(colorClass.endColor, lineWidth: dimensClass.cg_2)
                    )}.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.view_googleMaps
                }) {
                    ClaimsCenterRow(image: cellphone_img, name: cellphone_decription)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
                }.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.view_glassDamage
                }) {
                    ClaimsCenterRow(image: glassDamage_img, name: glassDamage_description)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .border(colorClass.endColor, width: dimensClass.cg_2)
                }.buttonStyle(btnStyle())
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = self.view_mainView
                }) {
                    Image(back_btn_img)
                        .foregroundColor(Color.white)
                    
                }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, dimensClass.cg_10)
                    .background(colorClass.endColor)
                    .cornerRadius(dimensClass.cg_10)
                
                
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
    
    let dimensClass = dimens()
    
    var image: String
    var name: String
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: dimensClass.cg_100, height: dimensClass.cg_90)
            
            Text("\(name)")
                .foregroundColor(Color.white)
        }
    }
}
