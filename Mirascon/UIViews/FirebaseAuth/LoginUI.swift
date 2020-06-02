//
//  LoginUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 13.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginUI: View {
    
    init(_ viewRouter: ViewRouter){
        
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
    }
    
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    
    @ObservedObject var viewRouter: ViewRouter
    @State var signInIsPresent: Bool = false
    @State var viewState = CGSize.zero
    @State var MainviewState =  CGSize.zero
    
    var body: some View {
        ZStack{
            
            if Auth.auth().currentUser != nil {
                
                MainScreen(viewRouter)
                //LogOutView()
            } else {
               
                Image("mercedes_img")
                    .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: 400.0,height:650)
                
                RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center){
                    
                    Image("MirasconLogo") .resizable() .scaledToFit() .frame(width: dimensClass.cg_200,height:dimensClass.cg_150) .padding(.top, 30)
                    Spacer()
                    VStack(alignment: .leading){
                        
                        LoginRow(image: "email_img", name: "Sign Up With EMail", color: colorClass.darkerRed, viewModel: viewRouter, viewRouterName: stringsClass.view_signUpView, sheetView: "signup")
                        
                        LoginRow(image: "PhoneCall", name: "Sign In With Phone", color: colorClass.phoneColor, viewModel: viewRouter, viewRouterName: stringsClass.view_phoneAuth, sheetView: "phone")
                    }
                    .padding(.bottom, 50)
                    Button(action: { self.viewRouter.currentPage = self.stringsClass.view_mainview}) {
                        HStack{
                            Text("Only for debug:")
                                .foregroundColor(colorClass.blue)
                                .fontWeight(.medium)
                            Text("Show me the main view. Click me!")
                                .foregroundColor(colorClass.blue)
                                .fontWeight(.medium)
                        }
                    }
                   
                    Button(action: { self.signInIsPresent = true}) {
                        HStack{
                            Text("Already have an account?")
                                .foregroundColor(colorClass.blue)
                                .fontWeight(.medium)
                            Text("Sign In")
                                .foregroundColor(colorClass.blue)
                                .fontWeight(.medium)
                        }
                    }.sheet(isPresented: $signInIsPresent) {
                        
                        SignInView(onDismiss:{
                            
                            self.viewState = CGSize(width: screenWidth, height: 0)
                            self.MainviewState = CGSize(width: 0, height: 0)
                            
                        })}
                    
                    
                    VStack{
                        Text("By creating an account, you agreee to our")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                        Button(action: {
                            //self.viewRouter.currentPage = self.stringsClass.view_agb
                        }) {
                            
                            
                            Text("Terms of Use and Privacy Policy.")
                                .underline()
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                            
                        }
                    }.padding(.horizontal, 5)
                    backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_pagerview)
                }.padding(.bottom, 50)
            }
        }
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI(ViewRouter())
    }
}
//.background(Rectangle().fill(colorClass.endColor))
