//
//  ContinueBtn.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct NextBtn: View {
    let stringsClass = strings()
    let colorClass = ColorUI()
    @ObservedObject var viewModel:ViewRouter
    
    var viewRouterName: String
    var btn_name: String
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Button(action: {
                   self.viewModel.currentPage = "\(self.viewRouterName)"
                }) {
                    Text("\(btn_name)")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }.buttonStyle(GradientBackgroundStyle(color: colorClass.btnColor))
                /*.alert(isPresented: $showingAlert) {
                 Alert(title: Text("Some fields are empty"), message: Text("Fill out all fields"), dismissButton: .default(Text("Got it!")))
                 }*/
            }
            Spacer()
        }
    }
}

struct ContinueBtn_Previews: PreviewProvider {
    static var previews: some View {
        NextBtn(viewModel: ViewRouter(), viewRouterName: "", btn_name: "")
    }
}
