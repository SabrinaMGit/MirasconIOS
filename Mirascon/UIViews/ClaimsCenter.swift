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
        return " Your Data: \n First Name:  \n Last Name:  \n License Plate: "
    }
    
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack (alignment: .center){
                NavigationBarWithItemUI(viewModel: viewRouter, viewRouterName: stringsClass.view_profil, image: stringsClass.edit_img)
                List{
                    ZStack(alignment: .leading){
                        RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                        
                        Text(label_descriptionWithData)
                            //.background(Color.white)
                            //.cornerRadius(dimensClass.cg_4)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .padding(dimensClass.cg_8)
                            .font(.subheadline)
                        //.padding(.top, dimensClass.cg_20)
                    }.frame( height: dimensClass.cg_100)
                    
                    
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_claimsForm, image: stringsClass.fillForm_img, name: stringsClass.fillForm_description)
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: stringsClass.view_camera, name: stringsClass.camera_description)
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_googleMaps, image: stringsClass.cellphone_img, name: stringsClass.cellphone_decription)
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_glassDamage, image: stringsClass.glassDamage_img, name: stringsClass.glassDamage_description)
                    Spacer()
                    
                }.padding(.top, 20)
                    .listRowInsets(EdgeInsets())
                //Spacer()
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_mainview)
                
                /*Button(action: {
                 self.viewRouter.currentPage = self.stringsClass.view_mainview
                 }) {
                 Image(stringsClass.back_btn_img)
                 .foregroundColor(Color.white)
                 
                 }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                 .padding()
                 .padding(.horizontal, dimensClass.cg_10)
                 .background(colorClass.endColor)
                 .cornerRadius(dimensClass.cg_10)
                 */
                
                // Spacer()
            }
        }
    }
}

struct ClaimsCenter_Previews: PreviewProvider {
    static var previews: some View {
        ClaimsCenter(ViewRouter())
    }
}

/*
struct ClaimsCenterRow: View {
    
    @ObservedObject var viewModel:ViewRouter
    
    let dimensClass = dimens()
    let colorClass = ColorUI()
    
    var viewRouterName: String
    var image: String
    var name: String
    
    var body: some View {
        VStack{
            Button(action: {
                self.viewModel.currentPage = "\(self.viewRouterName)"
            }) {
                HStack{
                    Image("\(image)")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        //.frame(width: dimensClass.cg_100, height: dimensClass.cg_90)
                        .frame(width: CGFloat(dimensClass.cg_80),height: CGFloat(dimensClass.cg_60))
                    
                    Text("\(name)")
                        .foregroundColor(Color.white)
                }.buttonStyle(btnStyle())
                    .frame(width: dimensClass.cg_300,height: dimensClass.cg_60)
                    .border(colorClass.endColor, width: dimensClass.cg_2)
                
            }.buttonStyle(btnStyle())
        }
    }
}
/*
 .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
 .border(colorClass.endColor, width: dimensClass.cg_2)
 
 .frame(width: dimensClass.cg_370, height: dimensClass.cg_100)
 .overlay(
 RoundedRectangle(cornerRadius: dimensClass.cg_1)
 .stroke(colorClass.endColor, lineWidth: dimensClass.cg_2))
 */*/
