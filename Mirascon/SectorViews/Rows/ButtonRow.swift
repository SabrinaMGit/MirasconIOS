//
//  ButtonRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ButtonRow: View {
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
                           .frame(width: screenWidth-30,height: dimensClass.cg_60)
                           .border(colorClass.endColor, width: dimensClass.cg_2)
                       
                   }.buttonStyle(btnStyle())
               }
           }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRow(viewModel: ViewRouter(), viewRouterName: "", image: "", name: "")
    }
}
