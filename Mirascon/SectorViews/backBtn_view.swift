//
//  backBtn_view.swift
//  Mirascon
//
//  Created by Dev-Notebook on 11.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct backBtn_view: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var body: some View {
        HStack {
            Button(action: {
                self.viewRouter.currentPage = self.stringsClass.view_mainview //exit(Int32(self.dimensClass.cg_0));
            }) {
                Image(stringsClass.back_btn_img)
                    .foregroundColor(Color.white)
            }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                // .padding()
                .padding(.horizontal, dimensClass.cg_5)
                .background(colorClass.endColor)
                .cornerRadius(dimensClass.cg_10)
        }
    }
}

struct backBtn_view_Previews: PreviewProvider {
    static var previews: some View {
        backBtn_view(viewRouter: ViewRouter())
    }
}
