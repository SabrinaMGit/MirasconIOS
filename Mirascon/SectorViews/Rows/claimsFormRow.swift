//
//  claimsFormRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 02.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct claimsFormRow: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @State var lp: String = ""
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    
    var body: some View{
        VStack {
            HStack {
                Text(stringsClass.licencePlate_name)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                // Spacer()
            }
            ZStack(alignment: .leading){
                TextField(stringsClass.emptyText, text: $lp)
                    .padding(dimensClass.cg_8)
                    .background(colorClass.blueRectangle)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius:  dimensClass.cg_10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius:  dimensClass.cg_10, style: .continuous)
                        .stroke( lineWidth:  dimensClass.cg_0))
                if lp.isEmpty { Text("\(lpSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
            }
        }
    }
}
