//
//  Rows.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct Rows: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    
    var image: String
    var name: String
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .frame(width: CGFloat(dimensClass.cg_80),height: CGFloat(dimensClass.cg_60))
            Text("\(name)")
                .foregroundColor(Color.white)
        } .frame(width: screenWidth-30, height: CGFloat(dimensClass.cg_60))
            .border(colorClass.endColor, width: CGFloat(dimensClass.cg_2))
    }
}

struct Rows_Previews: PreviewProvider {
    static var previews: some View {
        Rows(image: "", name: "")
    }
}
