//
//  SignInView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 13.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

/*struct actIndSignin: UIViewRepresentable {
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
}*/


struct SignInView: View {
    
    
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
    
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    let loginUI = LoginUI(ViewRouter())
    
    var onDismiss: () -> ()
    
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
            Image("roadway_signIn_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
            
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                NavigationBarImageUI()
                Spacer()
                VStack{
                    Text("Sign In").font(.title).fontWeight(.bold).foregroundColor(Color.white).padding(.bottom, 20)
                //Text("Email").font(.title).fontWeight(.thin).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading).foregroundColor(Color.white)
                LabelTextFields(label: stringsClass.email_name, labelColor: Color.white, datas: $emailAddress, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                
                VStack(alignment: .leading) {
                    
                    Text("Password:")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                    
                    SecureField(stringsClass.emptyText, text: $password)
                        .padding(dimensClass.cg_3)
                        .background(colorClass.startColor)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous)
                            .stroke( lineWidth: dimensClass.cg_0))
                        .border(didTap ? colorClass.darkerRed : Color.gray, width: CGFloat(dimensClass.cg_2))
                        .cornerRadius(5)
                    // if password.isEmpty { Text("\(stringsClass.emptyText )").foregroundColor(.white) }
                }
                .padding(.horizontal, 15)
                }.padding(.bottom, 10)
              
                Button(action: {
                    
                    if self.emailAddress != self.stringsClass.emptyText && self.password != self.stringsClass.emptyText{
                        self.shouldAnimate = true
                        self.SignInAuth(email:self.emailAddress, password:self.password)
                        self.loginUI.signInIsPresent = false
                        
                    } else {
                        self.alertIdentifier = AlertIdentifier(id: .first)
                    }
                    
                }
                ) {
                    Text("Sign In")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }.buttonStyle(GradientBackgroundStyle(color: colorClass.blue))
                  
                
                Spacer()
                
                Button(action: {
                    
                    Auth.auth().sendPasswordReset(withEmail: self.emailAddress) { error in
                        
                        if let error = error {
                            self.errorText = error.localizedDescription
                            return
                        }
                        
                        self.alertIdentifier = AlertIdentifier(id: .third)
                        
                    }
                    
                    
                }
                ) {
                    Text("Forgot Password")
                }.padding(.bottom,20)
                
                
               // Text(errorText).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                
                actIndSignin(shouldAnimate: self.$shouldAnimate)
                
                
                
                if (!verifyEmail) {
                    
                    Button(action: {
                        
                        Auth.auth().currentUser?.sendEmailVerification { (error) in
                            if let error = error {
                                self.errorText = error.localizedDescription
                                return
                            }
                            self.alertIdentifier = AlertIdentifier(id: .second)
                        }
                    }) {
                        
                        Text("Send Verify Email Again")
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.top).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).background(Color.white)
            
           // .alert(isPresented: $showEmailAlert, content: { self.verifyEmailAlert })
            
           //.alert(isPresented: $showPasswordAlert, content: { self.passwordResetAlert })
        
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
            self.onDismiss()
            self.presentationMode.wrappedValue.dismiss()
            self.shouldAnimate = false
            
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        SignInView(onDismiss: {print("hi")})
        
    }
}


/*TextField("Enter an email", text: $emailAddress).textContentType(.emailAddress).foregroundColor(Color.gray)
               
               Text("Password").font(.title).fontWeight(.thin)
               .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading).foregroundColor(Color.white)
               
               
               SecureField("Enter a password", text: $password).foregroundColor(Color.gray)
*/
