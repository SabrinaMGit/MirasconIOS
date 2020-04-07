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
    let startRadius = 2
    let endRadius = 650
    
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [colorClass.startColor, colorClass.endColor]), center: .center, startRadius: CGFloat(startRadius), endRadius: CGFloat(endRadius))
        .edgesIgnoringSafeArea(.all)
    }
}

struct RadialGradientUI_Previews: PreviewProvider {
    static var previews: some View {
        RadialGradientUI()
    }
}
