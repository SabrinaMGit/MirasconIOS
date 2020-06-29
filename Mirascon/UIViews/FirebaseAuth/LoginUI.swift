//
//  LoginUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 13.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct actIndSignin: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

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
    
    @State private var shouldAnimate = false
    
    @Environment(\.presentationMode) var presentationMode
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var verifyEmail: Bool = true
    @State private var showEmailAlert = false
    @State private var showPasswordAlert = false
    @State var errorText: String = ""
    @State private var didTap: Bool = false
    //@State private var showAlert = false
    @State private var alertIdentifier: AlertIdentifier?
    
    //var onDismiss: () -> ()
    
    var verifyEmailAlert: Alert {
        Alert(title: Text("Verify your Email ID"), message: Text("Please click the link in the verification email sent to you"), dismissButton: .default(Text("Dismiss")){
            
            self.presentationMode.wrappedValue.dismiss()
            self.emailAddress = ""
            self.verifyEmail = true
            self.password = ""
            self.errorText = ""
            
            })
    }
    
    
    var passwordResetAlert: Alert {
        Alert(title: Text("Reset your password"), message: Text("Please click the link in the password reset email sent to you"), dismissButton: .default(Text("Dismiss")){
            
            self.emailAddress = ""
            self.verifyEmail = true
            self.password = ""
            self.errorText = ""
            
            })
    }
    
    var body: some View {
        ZStack{
            
            if Auth.auth().currentUser != nil {
                
                MainScreen(viewRouter)
                //LogOutView()
            } else {
               
                Image("mercedes_img")
                    .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
                
                RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center){
                    
                    //Image("MirasconLogo") .resizable() .scaledToFit() .frame(width: dimensClass.cg_200,height:dimensClass.cg_150)
                    LogoBar()
                    //Spacer()
                    VStack(alignment: .center){
                        
                        Text("I'm already a customer?").font(.headline).fontWeight(.heavy).foregroundColor(Color.white)
                        //Text("Email").font(.title).fontWeight(.thin).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading).foregroundColor(Color.white)
                        //LabelTextFields(label: stringsClass.email_name, labelColor: Color.white, datas: $emailAddress, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                        /*TextField("", text: $emailAddress)
                           .padding(dimensClass.cg_3)
                           .background(colorClass.startColor)
                           .foregroundColor(Color.white)
                           .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous))
                           .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous)
                               .stroke( lineWidth: dimensClass.cg_0))
                           .border(didTap ? colorClass.darkerRed : Color.gray, width: CGFloat(dimensClass.cg_2))
                           .cornerRadius(5)
                        */
                        
                           TextField("email", text: $emailAddress)

                              .foregroundColor(.white)

                              .padding(2)

                              .background(

                                  RoundedRectangle(cornerRadius: 10)

                                      .foregroundColor(colorClass.endColor.opacity(0.8))

                                      .background(RoundedRectangle(cornerRadius: 8)

                                          .stroke(Color.gray, lineWidth: 2)))

                            .padding(.horizontal,10)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)

                             .padding(2)

                             .background(

                                 RoundedRectangle(cornerRadius: 10)

                                     .foregroundColor( colorClass.endColor.opacity(0.8))

                                     .background(RoundedRectangle(cornerRadius: 8)

                                         .stroke(Color.gray, lineWidth: 2)))

                            .padding(.horizontal,10)
                            
                        
                        /*Text("Password:")
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.leading)
                          .font(.headline)
                      
                      SecureField("Password", text: $password)
                          .padding(dimensClass.cg_3)
                          .background(colorClass.startColor)
                          .foregroundColor(Color.white)
                          .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous))
                          .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous)
                              .stroke( lineWidth: dimensClass.cg_0))
                          .border(didTap ? colorClass.darkerRed : Color.gray, width: CGFloat(dimensClass.cg_2))
                          .cornerRadius(5)*/
                        
                        Button(action: {
                                           
                           if self.emailAddress != self.stringsClass.emptyText && self.password != self.stringsClass.emptyText
                           {
                               self.shouldAnimate = true
                               self.SignInAuth(email:self.emailAddress, password:self.password)
                               
                           }
                            else{
                               self.alertIdentifier = AlertIdentifier(id: .first)
                               self.didTap = true
                           }
                            //---------
                            //Check verification
                            /* else if ((Auth.auth().currentUser) == nil){
                                   Auth.auth().currentUser?.sendEmailVerification { (error) in
                                   if let error = error {
                                       self.errorText = error.localizedDescription
                                       return
                                   }
                                   self.alertIdentifier = AlertIdentifier(id: .second)
                               }
                               
                               }*/
                            //--------
                        }
                       
                       ) {
                           Text("Sign In")
                               .fontWeight(.medium)
                               .foregroundColor(Color.white)
                           
                       }
                        .foregroundColor(Color.white)
                        .buttonStyle(GradientBackgroundStyle(color: colorClass.blue))
                        .padding(.bottom,5)
                        .padding(.top,10)
                        
                        Button(action: {
                            self.viewRouter.currentPage = self.stringsClass.view_fPassword
                          
                      }
                      ) {
                          Text("Forgot Password")
                            .foregroundColor(colorClass.blue)
                      }
                    }.padding(.bottom, 20)
                    LabelledDivider(label: "or")
                        //-------
                    VStack(alignment: .leading){
                        Text("I'm not a customer?").font(.headline).fontWeight(.heavy).foregroundColor(Color.white).padding(.bottom, 10)
                        
                    
                        Button(action: {
                             //self.signInIsPresent = true
                            self.viewRouter.currentPage = self.stringsClass.view_createAccount
                         }) {
                             
                             HStack{
                                 Text("Create an account")
                                     .foregroundColor(Color.white) .fontWeight(.bold) .font(.headline)
                                 
                                }  .frame( width: dimensClass.cg_280, height: dimensClass.cg_50)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(colorClass.blue, lineWidth: 2)
                                )
                        }.padding(.bottom, 10)
                        /*
                        LoginRow(image: "email_img", name: "Sign Up With EMail", color: colorClass.darkerRed, viewModel: viewRouter, viewRouterName: stringsClass.view_signUpView, sheetView: "signup")
                        
                        LoginRow(image: "PhoneCall", name: "Sign In With Phone", color: colorClass.phoneColor, viewModel: viewRouter, viewRouterName: stringsClass.view_phoneAuth, sheetView: "phone")*/
                    }
                    
                    
                    actIndSignin(shouldAnimate: self.$shouldAnimate)
                   /*
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
                    */
                    //Is for Sign Up
                   /* VStack{
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
                    }*/
                    backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_pagerview)
                }
            }
        }
        .alert(item: $alertIdentifier) { alert in
                switch alert.id {
                    case .first:
                        return Alert(title: Text("There was a problem with your submission!").fontWeight(.bold), message: Text(errorText), dismissButton: .default(Text("Got it!")))
                case .second:
                    return self.verifyEmailAlert
                case .third:
                    return self.passwordResetAlert
                case .forth:
                    return self.passwordResetAlert
                }
        }
    }
    func SignInAuth(email: String, password: String) {
          
          Auth.auth().signIn(withEmail: email, password: password) { user, error in
              
              if let error = error
              {
                  self.errorText = error.localizedDescription
                  self.shouldAnimate = false
                  
                  return
              }
              
              
              guard user != nil else { return }
              
              
              self.verifyEmail = user?.user.isEmailVerified ?? false
              
              
              if(!self.verifyEmail)
              {
                  self.errorText = "Please verify your email"
                  self.shouldAnimate = false
                  self.alertIdentifier = AlertIdentifier(id: .second)
                  return
              }
              
              self.emailAddress = ""
              self.verifyEmail = true
              self.password = ""
              self.errorText = ""
              //self.onDismiss()
              self.presentationMode.wrappedValue.dismiss()
              self.shouldAnimate = false
              
          }
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI(ViewRouter())
    }
}
//.background(Rectangle().fill(colorClass.endColor))


struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}
