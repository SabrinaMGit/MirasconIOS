//
//  LabelTextField.swift
//  Mirascon
//
//  Created by Dev-Notebook on 02.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct LabelTextField : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var label: String
    var labelColor: Color
    var data: String
    var dataColor: Color
    
    var body: some View {
        
        HStack {
            Text(label)
                .foregroundColor(labelColor)
                .multilineTextAlignment(.leading)
                .font(.body)
            Text(data)
                .foregroundColor(dataColor)
                .multilineTextAlignment(.leading)
                .font(.body)
        }
        .padding(.horizontal, 15)
    }
}

struct LabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabelTextField(label: "", labelColor: Color.white, data: "", dataColor: Color.white)
    }
}
