//
//  CreateAccount.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct CreateAccount: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
         
         self.viewRouter = viewRouter
         UITableView.appearance().backgroundColor = .clear
         UITableViewCell.appearance().backgroundColor = .clear
         
     }
    
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    
    var body: some View {
        ZStack{

            Image("roadway_signIn_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
            
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                LogoBar()
              Spacer()
                List{
                    HStack {
                        Spacer()
                        LoginRow(image: "email_img", name: "Sign Up With EMail", color: colorClass.darkerRed, viewModel: viewRouter, viewRouterName: stringsClass.view_signUpView, sheetView: "signup")
                        Spacer()
                    }
                    
                    LabelledDivider(label: "or")
                    
                    HStack {
                        Spacer()
                        LoginRow(image: "PhoneCall", name: "Sign In With Phone", color: colorClass.phoneColor, viewModel: viewRouter, viewRouterName: stringsClass.view_phoneAuth, sheetView: "phone")
                        Spacer()
                    }
                }.frame(height: 200)
              Spacer()
            Button(action: { self.viewRouter.currentPage = self.stringsClass.view_mainview}) {
                HStack{
                    Text("Only for debug:")
                        .foregroundColor(colorClass.blue)
                        .fontWeight(.light)
                        .font(.body)
                    Text("Click me!")
                        .foregroundColor(colorClass.blue)
                        .fontWeight(.light)
                        .font(.body)
                }
            }
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
                }
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_loginUI).padding(.bottom,10)
            }
        }
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount(ViewRouter())
    }
}
