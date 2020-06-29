//
//  ForgotPassword.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct ForgotPassword: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
         
         self.viewRouter = viewRouter
         UITableView.appearance().backgroundColor = .clear
         UITableViewCell.appearance().backgroundColor = .clear
         
     }
    
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    
    @State var emailAddress: String = ""
    @State var errorText: String = ""
    
    var body: some View {
        ZStack{
            Image("mercedes_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
            
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                .edgesIgnoringSafeArea(.all)
            VStack{
                LogoBar()
                Spacer()
                
                Text("Forgot Password? ").fontWeight(.bold).foregroundColor(.white).font(.largeTitle)
                Text("We just need your registered email addressto send you password reset")
                Spacer()
                TextField("email", text: $emailAddress)

                    .foregroundColor(.white)

                    .padding(2)

                    .background(

                        RoundedRectangle(cornerRadius: 10)

                            .foregroundColor(colorClass.endColor.opacity(0.8))

                            .background(RoundedRectangle(cornerRadius: 8)

                                .stroke(Color.gray, lineWidth: 2)))

                  .padding(.horizontal,10)
                    .padding(.bottom,40)

                Button(action: {
                                    
                    Auth.auth().sendPasswordReset(withEmail: self.emailAddress) { error in
                        
                        if let error = error {
                            self.errorText = error.localizedDescription
                            return
                        }
                        
                       // self.alertIdentifier = AlertIdentifier(id: .third)
                        
                    }
                }
                ) {
                    Text("Reset Password")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }
                 .foregroundColor(Color.white)
                 .buttonStyle(GradientBackgroundStyle(color: colorClass.blue))
                
               
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_createAccount
                  }
                  ) {
                      Text("DON'T HAVE AN ACCOUNT?")
                       .fontWeight(.bold)
                          .foregroundColor(Color.gray)
                      
                  }
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_loginUI).padding(.bottom,10)
            }
        }
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(ViewRouter())
    }
}
