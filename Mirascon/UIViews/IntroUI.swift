//
//  IntroUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 05.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct IntroUI: View {
    @ObservedObject var viewRouter: ViewRouter
    let dimensClass = dimens()
    let stringClass = strings()
    let colorClass = ColorUI()
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [colorClass.darkerBlue, colorClass.endColor]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                .edgesIgnoringSafeArea(.all)
            VStack{
                NavigationBarWithItemUI(viewModel: ViewRouter(), viewRouterName: stringClass.view_saveData, image: "close")
                /*HStack {
                    Spacer()
                    Spacer()
                    LogoBar()
                    Spacer()
                    Button(action: {
                        self.viewRouter.currentPage = self.stringClass.view_saveData
                    }) {
                        Image("close")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }.frame( height: dimensClass.cg_70)
 */
                PageView(features.map { PreviewIntroduction(introduction: $0, viewRouter: viewRouter) }) .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct IntroUI_Previews: PreviewProvider {
    static var previews: some View {
        IntroUI(viewRouter: ViewRouter())
    }
}
