//
//  PreviewRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 10.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct PreviewRow: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var image: String
    var name: String
    var description: String
    
    var body: some View {
        HStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.black)
                .frame(width: CGFloat(dimensClass.cg_40),height: CGFloat(dimensClass.cg_40))
            VStack(alignment: .leading){
                Text("\(name)")
                    .foregroundColor(Color.white)
                    .font(.headline)
                Text("\(description)")
                    .foregroundColor(colorClass.grey)
                    .font(.body)
            }
        }
    }
}

struct PreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        PreviewRow(image: "", name: "", description: "")
    }
}
