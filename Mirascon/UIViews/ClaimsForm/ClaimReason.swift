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
            VStack{
                NavigationBarImageUI().padding(.bottom,20)
                Walkthrough(image: "WalkthroughCar").padding(.horizontal,10)
                    //Spacer()
                List{
                ZStack(alignment: .leading){
                    RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                    
                    Text("What is the cause of your accident?")
                        //.background(Color.white)
                        //.cornerRadius(dimensClass.cg_4)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .padding(dimensClass.cg_8)
                        .font(.subheadline)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    //.padding(.top, dimensClass.cg_20)
                }.frame( height: dimensClass.cg_40).cornerRadius(5)
                   // .padding(.horizontal,12)
            
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: "car-disabled", name: "My vehicle is deactivated")
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: "car-fire", name: "Stuck in a Ditch")
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: "platter_reifen", name: "Flat Tire")
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: "gas-station", name: "Low Fuel")
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: "battery-off-outline", name: "Battery Dead")
                    ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_camera, image: "car-door-lock", name: "Locked")
                    // Spacer()
                    }
                //.padding()
                    .listRowInsets(EdgeInsets())
                
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

