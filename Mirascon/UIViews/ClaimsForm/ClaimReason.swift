//
//  ClaimReason.swift
//  Mirascon
//
//  Created by Dev-Notebook on 05.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimReason: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
     @ObservedObject var viewRouter: ViewRouter
       
       init(_ viewRouter: ViewRouter){
           self.viewRouter = viewRouter
           UITableView.appearance().backgroundColor = .clear
           UITableViewCell.appearance().backgroundColor = .clear
       }
    
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack (alignment: .center){
            VStack{
                NavigationBarWithItemUI(viewModel: ViewRouter(), viewRouterName: stringsClass.view_claimsForm, image: "help")
                Walkthrough()
                
                    //Spacer()
                List{
                        
                    ButtonRows(viewModel: ViewRouter(), viewRouterName: stringsClass.view_camera, image: stringsClass.products_img, name: "I have a flat tire.")
                    ButtonRows(viewModel: ViewRouter(), viewRouterName: "", image: stringsClass.products_img, name: "I'm out of gas.")
                    ButtonRows(viewModel: ViewRouter(), viewRouterName: "", image: stringsClass.products_img, name: "My battery is dead.")
                    ButtonRows(viewModel: ViewRouter(), viewRouterName: "", image: stringsClass.products_img, name: "I'm locked out.")
                    ButtonRows(viewModel: ViewRouter(), viewRouterName: "", image: stringsClass.products_img, name: "My vecicle is disabled.")
                    ButtonRows(viewModel: ViewRouter(), viewRouterName: "", image: stringsClass.products_img, name: "I'm stuck in a ditch.")
                    // Spacer()
                    }.padding()
                    .listRowInsets(EdgeInsets())
                       
                  
                }
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsForm)
            }
        }
    }
}

struct ClaimReason_Previews: PreviewProvider {
    static var previews: some View {
        ClaimReason(ViewRouter())
    }
}

/*struct ImageRow : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var image: String
    var label: String
    
    var body: some View {
        
        HStack{
                   Image("\(image)")
                       .resizable()
                       .scaledToFit()
                       .foregroundColor(Color.white)
                       .frame(width: CGFloat(dimensClass.cg_80),height: CGFloat(dimensClass.cg_60))
                   Text("\(name)")
                       .foregroundColor(Color.white)
               } .frame(width: CGFloat(dimensClass.cg_300),height: CGFloat(dimensClass.cg_60))
                   .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
        
    }
}*/
struct ButtonRows: View {
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
                        Spacer()
                       }.buttonStyle(btnStyle())
                           .frame(width: dimensClass.cg_260, height: dimensClass.cg_60)
                           .border(colorClass.endColor, width: dimensClass.cg_2)
                       
                   }.buttonStyle(btnStyle())
               }
           }
}

