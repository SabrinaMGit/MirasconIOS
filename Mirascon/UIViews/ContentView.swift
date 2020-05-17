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
    init(_ viewRouter: ViewRouter){
             self.viewRouter = viewRouter
         }
    //@State var page = "emergency"
    var body: some View {
        VStack {
            if viewRouter.currentPage == "mainView" {
                MainScreen(viewRouter)
            } else if viewRouter.currentPage == "emergency" {
                EmergencyUI(viewRouter)
            } else if viewRouter.currentPage == "RoadsideAssistance" {
                RoadsideAssistanceUI(viewRouter)
            } else if viewRouter.currentPage == "claimsCenter" {
                ClaimsCenter(viewRouter)
            } else if viewRouter.currentPage == "launch" {
                LaunchLogo(viewRouter)
            } else if viewRouter.currentPage == "pagerView" {
                //IntroUI(viewRouter: viewRouter)
                Preview(viewRouter)
            } else if viewRouter.currentPage == "saveData" {
                SaveUserData(viewRouter)
            } else if viewRouter.currentPage == "claimsForm" {
                ClaimsForm(viewRouter)
            }else if viewRouter.currentPage == "camera" {
                camera(viewRouter)
            } else if viewRouter.currentPage == "Products" {
               // WebView(request: URLRequest(url: URL(string: "https://www.mirascon.com")!))
            } else if viewRouter.currentPage == "googleMaps" {
                GoogleMapsView(viewRouter)
            } else if viewRouter.currentPage == "profil" {
                Profil(viewRouter)
            } else if viewRouter.currentPage == "claimReason" {
                ClaimReason(viewRouter)
            } else if viewRouter.currentPage == "review" {
                Review(viewRouter)
            } else if viewRouter.currentPage == "LoginUI" {
                LoginUI(viewRouter)
            } else if viewRouter.currentPage == "PhoneAuth" {
                PhoneAuth(viewRouter) 
            } else if viewRouter.currentPage == "ScndPage" {
                //ScndPage(viewRouter)
            } else if viewRouter.currentPage == "MailUI" {
                //VerificationUIView(viewRouter)
            } else if viewRouter.currentPage == "ABG" {
               AGB(viewRouter)
            } else if viewRouter.currentPage == "SignIn" {
               //SignInView(viewRouter)
            } else if viewRouter.currentPage == "SignUp" {
               SignUpView(viewRouter)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ViewRouter())
    }
}
/*
else if viewRouter.currentPage == "otherInfo" {
               //GlassDamage(viewRouter)
           } else if viewRouter.currentPage == "glassDamage" {
              // GlassDamage(viewRouter)
           }
else if viewRouter.currentPage == "chatFirebase" {
    //ChatFirebaseView(viewRouter: viewRouter)
    //CloudMessaging(viewRouter: viewRouter)
}
 */
