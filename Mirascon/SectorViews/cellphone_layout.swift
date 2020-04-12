//
//  cellphone_layout.swift
//  Mirascon
//
//  Created by Dev-Notebook on 11.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct cellphone_layout: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var description: String
    //stringsClass.view_label_description
    
    var body: some View {
        VStack{
        Image(stringsClass.phoneCall_img)
            .resizable()
            .scaledToFit()
            .frame(width: dimensClass.cg_100,height: dimensClass.cg_80)
        Text("\(description)")
            .font(.body)
            .fontWeight(.regular)
            .foregroundColor(Color.white)
            .padding()
            .multilineTextAlignment(.center)
            //.lineSpacing(dimensClass.cg_40)
        }
            
    }
}

struct cellphone_layout_Previews: PreviewProvider {
    static var previews: some View {
        cellphone_layout(description: "")
    }
}
