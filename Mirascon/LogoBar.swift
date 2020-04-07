//
//  LogoBar.swift
//  Mirascon
//
//  Created by Dev-Notebook on 07.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct LogoBar: View {
    let width = 200.0
    let height = 100
    
    var body: some View {
        Image("MirasconLogo")
        .resizable()
        .scaledToFit()
        .frame(width: CGFloat(width) ,height: CGFloat(height), alignment: .trailing)
    }
}

struct LogoBar_Previews: PreviewProvider {
    static var previews: some View {
        LogoBar()
    }
}
