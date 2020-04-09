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
    let stringsClass = strings()
    
    var label_descriptionWithData: String {
          return " Your Data: \n First Name: \(cForm.firstNameSaved!) \n Last Name: \(cForm.lastNameSaved!) \n License Plate: \(cForm.lpSaved!)"
      }

    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack {
                HStack(alignment: .center){
                    Text(stringsClass.emptyText)
                    LogoBar()
                    Button(action: {
                        self.viewRouter.currentPage = self.stringsClass.view_profil
                    }) {
                        Image(stringsClass.edit_img)
                            .padding(.leading)
                            .foregroundColor(Color.white)
                    }
                }
                Text(label_descriptionWithData)
                    .frame(minWidth: dimensClass.cg_390, idealWidth: dimensClass.cg_390, maxWidth: dimensClass.cg_390, minHeight: dimensClass.cg_100, idealHeight: dimensClass.cg_100, maxHeight: dimensClass.cg_100, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(dimensClass.cg_4)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_claimsForm
                }) {
                    ClaimsCenterRow(image: stringsClass.fillForm_img, name: stringsClass.fillForm_description)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .border(colorClass.endColor, width: dimensClass.cg_2)
                }.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_camera
                }) {
                    ClaimsCenterRow(image: stringsClass.view_camera, name: stringsClass.camera_description)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .overlay(
                            RoundedRectangle(cornerRadius: dimensClass.cg_1)
                                .stroke(colorClass.endColor, lineWidth: dimensClass.cg_2)
                    )}.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_googleMaps
                }) {
                    ClaimsCenterRow(image: stringsClass.cellphone_img, name: stringsClass.cellphone_decription)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
                }.buttonStyle(btnStyle());
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_glassDamage
                }) {
                    ClaimsCenterRow(image: stringsClass.glassDamage_img, name: stringsClass.glassDamage_description)
                        .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
                        .border(colorClass.endColor, width: dimensClass.cg_2)
                }.buttonStyle(btnStyle())
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_mainview
                }) {
                    Image(stringsClass.back_btn_img)
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
