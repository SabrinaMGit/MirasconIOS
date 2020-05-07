//
//  ContinueBtn.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ContinueBtn: View {
    let stringsClass = strings()
    @ObservedObject var viewModel:ViewRouter
    
    var viewRouterName: String
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Button(action: {
                   self.viewModel.currentPage = "\(self.viewRouterName)"
                }) {
                    Text(stringsClass.continue_name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }.buttonStyle(GradientBackgroundStyle())
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
        ContinueBtn(viewModel: ViewRouter(), viewRouterName: "")
    }
}
