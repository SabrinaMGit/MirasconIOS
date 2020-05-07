//
//  NavigationBarImageUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct NavigationBarImageUI: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [colorClass.darkerBlue, colorClass.endColor]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
            LogoBar()
        }.frame( height: dimensClass.cg_40)
            .padding(.top, 20)
    }
}

struct NavigationBarImageUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarImageUI()
    }
}
