//
//  GoogleMapsView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.02.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI


struct GoogleMapsView: View {
    //@ObservedObject var viewModel = ContentViewModel()
    @ObservedObject var viewRouter: ViewRouter
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("MirasconLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200.0,height:100, alignment: .bottomLeading)
                    GoogleMap()
                    Button(action: {
                        print("back tapped!")
                        self.viewRouter.currentPage = "camera"
                    }) {
                        Image("arrow-right")
                            .foregroundColor(Color.white)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(endColor)
                        .cornerRadius(10)
                }//.edgesIgnoringSafeArea(.vertical)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView(ViewRouter())
    }
}
