//
//  LoginRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 13.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct LoginRow: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    var image: String
    var name: String
    var color: Color
    @ObservedObject var viewModel:ViewRouter
    var viewRouterName: String
    
    var body: some View {
        VStack(alignment: .leading){
        Button(action: {
            
            self.viewModel.currentPage = "\(self.viewRouterName)"
        }) {
            
        HStack{
            Image("\(image)") .resizable() .scaledToFit() .padding(5).foregroundColor(Color.white)
                //.padding(.trailing,20)
            Text("\(name)")
                .foregroundColor(Color.white) .fontWeight(.bold) .font(.headline)
                
            }  .frame( width: dimensClass.cg_280, height: dimensClass.cg_50)  .background(color.opacity(0.8)) .cornerRadius(20) .clipped().shadow(color: Color.black, radius: 5, x: 0, y: 5)
        }
        }
    }
}

struct LoginRow_Previews: PreviewProvider {
    static var previews: some View {
        LoginRow(image: "Icon_Claims_Schwarz", name: "Sign up with email", color: Color.green, viewModel: ViewRouter(), viewRouterName: "")
    }
}

/*
  RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
 
 .border(colorClass.endColor, width: dimensClass.cg_2)
 */
