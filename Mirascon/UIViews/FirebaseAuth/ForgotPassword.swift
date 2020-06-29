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
    @State private var didTap: Bool = false
    @State private var alertIdentifier: AlertIdentifier?
    
    var passwordResetAlert: Alert {
         Alert(title: Text("Reset your password"), message: Text("Please click the link in the password reset email sent to you"), dismissButton: .default(Text("Dismiss")){
             
             self.emailAddress = ""
             self.errorText = ""
             
             })
     }
    
    var body: some View {
        ZStack{
            Image("roadway_signIn_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
            
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                .edgesIgnoringSafeArea(.all)
            VStack{
                LogoBar()
                Spacer()
                Image("lock").resizable().scaledToFit().frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                Text("Forgot Password? ").fontWeight(.bold).foregroundColor(.white).font(.largeTitle)
                Text("We just need your registered email address to send you a new password").foregroundColor(.gray).multilineTextAlignment(.center).padding(.top,20).padding(.bottom,30)
                
                TextField("email", text: $emailAddress)

                    .foregroundColor(.white)

                    .padding(2)

                    .background(

                        RoundedRectangle(cornerRadius: 10)

                            .foregroundColor(colorClass.endColor.opacity(0.8))

                            .background(RoundedRectangle(cornerRadius: 8)

                                .stroke(didTap ? colorClass.darkerRed : Color.gray, lineWidth: 2)))

                  .padding(.horizontal,10)
                    .padding(.bottom,30)

                Button(action: {
                    if self.emailAddress != self.stringsClass.emptyText{
                    Auth.auth().sendPasswordReset(withEmail: self.emailAddress) { error in
                        
                        if let error = error {
                            self.errorText = error.localizedDescription
                            return
                        }
                        
                       self.alertIdentifier = AlertIdentifier(id: .first)
                        
                    }
                    } else{
                        //self.alertIdentifier = AlertIdentifier(id: .first)
                        self.didTap = true
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
                VStack{
                Text("DON'T HAVE AN ACCOUNT?")
                .fontWeight(.bold)
                   .foregroundColor(Color.gray)
                
                Button(action: {
                    self.viewRouter.currentPage = self.stringsClass.view_createAccount
                  }
                  ) {
                      Text("REGISTER")
                        .fontWeight(.heavy)
                          .foregroundColor(Color.white)
                      
                  }
                }.padding(.top,10)
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_loginUI).padding(.bottom,10)
            }
        }
        .alert(item: $alertIdentifier) { alert in
                    return self.passwordResetAlert
        }
    }
    
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(ViewRouter())
    }
}
