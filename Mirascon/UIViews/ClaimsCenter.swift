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
    
    let colorClass = ColorUI()
    let cForm = ClaimsForm(ViewRouter())
    
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
    
    let width = 390
    let minWidth = 0
    let width_370 = 370.0
    let height = 100
    let cornerRadius_4 = 4
    let cornerRadius_1 = 1
    let borderWidth = 2
    let cg_10 = 10
    
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
                    .frame(minWidth: CGFloat(width), idealWidth: CGFloat(width), maxWidth: CGFloat(width), minHeight: CGFloat(height), idealHeight: CGFloat(height), maxHeight: CGFloat(height), alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(CGFloat(cornerRadius_4))
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    self.viewRouter.currentPage = self.view_claimsForm
                }) {
                    ClaimsCenterRow(image: fillForm_img, name: fillForm_description)
                        .frame(width: CGFloat(width_370), height: CGFloat(height))
                        .border(colorClass.endColor, width: CGFloat(borderWidth))
                }.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.view_camera
                }) {
                    ClaimsCenterRow(image: view_camera, name: camera_description)
                        .frame(width: CGFloat(width_370), height: CGFloat(height))
                        .overlay(
                            RoundedRectangle(cornerRadius: CGFloat(cornerRadius_1))
                                .stroke(colorClass.endColor, lineWidth: CGFloat(borderWidth))
                    )}.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.view_googleMaps
                }) {
                    ClaimsCenterRow(image: cellphone_img, name: cellphone_decription)
                        .frame(width: CGFloat(width_370), height: CGFloat(height))
                        .border(colorClass.endColor, width: CGFloat(borderWidth))
                }.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.view_glassDamage
                }) {
                    ClaimsCenterRow(image: glassDamage_img, name: glassDamage_description)
                        .frame(width: CGFloat(width_370), height: CGFloat(height))
                        .border(colorClass.endColor, width: CGFloat(borderWidth))
                }.buttonStyle(btnStyle())
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = self.view_mainView
                }) {
                    Image(back_btn_img)
                        .foregroundColor(Color.white)
                    
                }.frame(minWidth: CGFloat(minWidth), maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, CGFloat(cg_10))
                    .background(colorClass.endColor)
                    .cornerRadius(CGFloat(cg_10))
                
                
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
    
    let width = 100.0
    let height = 90
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: CGFloat(width), height: CGFloat(height))
            
            Text("\(name)")
                .foregroundColor(Color.white)
        }
    }
}
