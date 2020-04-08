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
   
    let colorClass = ColorUI()
    let dimensClass = dimens()
    
    @ObservedObject var viewRouter: ViewRouter
    
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
                        
                    }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, dimensClass.cg_10)
                        .background(colorClass.endColor)
                        .cornerRadius(dimensClass.cg_10)
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
