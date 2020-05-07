//
//  NavigationBarWithItemUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct NavigationBarWithItemUI: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @ObservedObject var viewModel:ViewRouter
    
    var viewRouterName: String
    var image: String
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [colorClass.darkerBlue, colorClass.endColor]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
            HStack {
                Spacer()
                Spacer()
                LogoBar()
                Spacer()
                Button(action: {
                    self.viewModel.currentPage = "\(self.viewRouterName)"
                }) {
                    Image("\(image)")
                        .foregroundColor(Color.white)
                }
                Spacer()
            }//.frame( height: dimensClass.cg_50)
        }.frame( height: dimensClass.cg_40) .padding(.top, 20)
    }
}

struct NavigationBarWithItemUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarWithItemUI(viewModel: ViewRouter(), viewRouterName: "", image: "")
    }
}
