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
    let stringsClass = strings()
    
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
                        self.viewRouter.currentPage = self.stringsClass.view_camera
                    }) {
                    Text(stringsClass.continue_name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                                    
                    }.buttonStyle(GradientBackgroundStyle())
                       
                    backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsForm)
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
/*
 Button(action: {
     self.viewRouter.currentPage = self.stringsClass.view_camera
 }) {
     Image(stringsClass.arrow_right_img)
         .foregroundColor(Color.white)
     
 }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
     .padding()
     .padding(.horizontal, dimensClass.cg_10)
     .background(colorClass.endColor)
     .cornerRadius(dimensClass.cg_10)
 */
