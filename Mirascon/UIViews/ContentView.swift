//
//  ContentView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 20.12.19.
//  Copyright © 2019 MIRASCON. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewRouter: ViewRouter
    //@State var page = "emergency"
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "mainView" {
                MainScreen(viewRouter)
            } else if viewRouter.currentPage == "emergency" {
                EmergencyUI(viewRouter)
            } else if viewRouter.currentPage == "RoadsideAssistance" {
                RoadsideAssistanceUI(viewRouter)
            } else if viewRouter.currentPage == "ClaimsCenter" {
                ClaimsCenter(viewRouter)
            } else if viewRouter.currentPage == "launch" {
                LaunchLogo(viewRouter)
            } else if viewRouter.currentPage == "pagerView" {
                PageView(features.map { PreviewIntroduction(introduction: $0, viewRouter: viewRouter) }) .edgesIgnoringSafeArea(.all)
            } else if viewRouter.currentPage == "claimsForm" {
                ClaimsForm(viewRouter)
            } else if viewRouter.currentPage == "camera" {
                uploadPhotos(viewRouter)
            } else if viewRouter.currentPage == "otherInfo" {
                //GlassDamage(viewRouter)
            } else if viewRouter.currentPage == "glassDamage" {
                GlassDamage(viewRouter)
            } else if viewRouter.currentPage == "Products" {
                WebView(request: URLRequest(url: URL(string: "https://www.mirascon.com")!))
            } else if viewRouter.currentPage == "googleMaps" {
                GoogleMapsView(viewRouter)
            } else if viewRouter.currentPage == "chatFirebase" {
                //ChatFirebaseView(viewRouter: viewRouter)
                //CloudMessaging(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "profil" {
                Profil(viewRouter)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
