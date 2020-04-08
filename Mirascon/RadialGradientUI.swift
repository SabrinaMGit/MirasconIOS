//
//  RadialGradient.swift
//  Mirascon
//
//  Created by Dev-Notebook on 07.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct RadialGradientUI: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [colorClass.startColor, colorClass.endColor]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RadialGradientUI_Previews: PreviewProvider {
    static var previews: some View {
        RadialGradientUI()
    }
}
