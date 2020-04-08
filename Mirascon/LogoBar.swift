//
//  LogoBar.swift
//  Mirascon
//
//  Created by Dev-Notebook on 07.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct LogoBar: View {
    let dimensClass = dimens()
    
    var body: some View {
        Image("MirasconLogo")
        .resizable()
        .scaledToFit()
            .frame(width: dimensClass.cg_200 ,height: dimensClass.cg_100, alignment: .trailing)
    }
}

struct LogoBar_Previews: PreviewProvider {
    static var previews: some View {
        LogoBar()
    }
}
