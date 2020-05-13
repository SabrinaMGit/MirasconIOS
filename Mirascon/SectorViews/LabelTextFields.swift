//
//  LabelTextFiels.swift
//  Mirascon
//
//  Created by Dev-Notebook on 07.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct LabelTextFields : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    let claimsForm = ClaimsForm(ViewRouter())
    
    var label: String
    var labelColor: Color
    @Binding var datas: String
    var savedDatas: String
    var textFieldBorderColor: Color
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(labelColor)
                .multilineTextAlignment(.leading)
                .font(.headline)
            
            TextField(stringsClass.emptyText, text: $datas)
                .padding(dimensClass.cg_3)
                .background(colorClass.startColor)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous)
                    .stroke( lineWidth: dimensClass.cg_0))
            .border(textFieldBorderColor, width: CGFloat(dimensClass.cg_2))
            .cornerRadius(5)
            if datas.isEmpty { Text("\(savedDatas )").foregroundColor(.white) }
        }
        .padding(.horizontal, 15)
    }
}
