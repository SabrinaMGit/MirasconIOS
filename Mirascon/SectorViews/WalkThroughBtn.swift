//
//  WalkThroughRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct WalkThroughBtn: View {
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    @ObservedObject var viewModel: ViewRouter
    
    var viewRouterName: String
    @State private var isSelected: Bool = false
    
    var body: some View {
        
        ZStack{
            //Horizontal Line
            VStack{
                colorClass.fillForm_orange.frame(width: screenWidth-40, height:CGFloat(1) / UIScreen.main.scale)
            }
            HStack{
                Button(action: {self.viewModel.currentPage = "\(self.viewRouterName)"}) {
                    ZStack{
                        Image(isSelected ? isSelected ? "Selected_Red_View": "" : "Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("car-info")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action:
                    {self.viewModel.currentPage = "\(self.viewRouterName)"
                }) {
                    ZStack{
                        Image("Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("car-info")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {
                    self.viewModel.currentPage = "\(self.viewRouterName)"
                    
                }
                ) {
                    ZStack{
                        Image("Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {self.viewModel.currentPage = "\(self.viewRouterName)"}) {
                    ZStack{
                        Image("Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("googlemaps")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {self.viewModel.currentPage = "\(self.viewRouterName)"}) {
                    ZStack{
                        Image("Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270, height: CGFloat(dimensClass.cg_60))
                        Image("email-send-outline")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
            }//.frame(width: screenWidth)
        }
    }
}

struct WalkThroughBtn_Previews: PreviewProvider {
    static var previews: some View {
       WalkThroughBtn(viewModel: ViewRouter(), viewRouterName: "")
    }
}


