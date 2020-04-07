//
//  GoogleMapsV.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.02.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//
import SwiftUI


struct GoogleMapsView: View {
    //@ObservedObject var viewModel = ContentViewModel()
    @ObservedObject var viewRouter: ViewRouter
    let colorClass = ColorUI()
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradientUI()
                VStack {
                    LogoBar()
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
                        .background(colorClass.endColor)
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
