//
//  Walkthrough.swift
//  Mirascon
//
//  Created by Dev-Notebook on 05.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct Walkthrough: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    var body: some View {
        Image("selectInfo")
            .resizable()
            .scaledToFit()
            .frame(height:dimensClass.cg_50)
            .padding()
    }
}

struct Walkthrough_Previews: PreviewProvider {
    static var previews: some View {
        Walkthrough()
    }
}
