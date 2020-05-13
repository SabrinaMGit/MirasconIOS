//
//  GradientBackgroundStyle.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    
    var color: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                .frame(minWidth: dimensClass.cg_0, maxWidth: dimensClass.cg_260)
                .padding()
                //.padding(.horizontal, dimensClass.cg_20)
                .background(color)
                .cornerRadius(dimensClass.cg_10)
                .scaleEffect(configuration.isPressed ? dimensClass.cg_scaleEffect_0_9 : dimensClass.cg_scaleEffect_1)
            
        }
    }
}
