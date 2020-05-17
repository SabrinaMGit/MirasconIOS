//
//  SignOutView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 13.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct actIndSignup: UIViewRepresentable {
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
struct SignUpView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var lp: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var didTap: Bool = false
    
    @State private var alertIdentifier: AlertIdentifier?
    
    let defaults = UserDefaults.standard
    
    @State public var firstNameSaved = UserDefaults.standard.string(forKey: "firstName")
    @State public var lastNameSaved = UserDefaults.standard.string(forKey: "lastName")
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    @State public var phoneSaved = UserDefaults.standard.string(forKey: "phone")
    @State public var mailSaved = UserDefaults.standard.string(forKey: "mail")
    @State public var passwordSaved = UserDefaults.standard.string(forKey: "password")
    
    //---------------
    @Environment(\.presentationMode) var presentationMode
    @State var emailAddress: String = ""
    
    @State var agreeCheck: Bool = false
    @State var errorText: String = ""
    //@State private var showAlert = false
    @State private var shouldAnimate = false
    
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    
    var alert: Alert {
        
        Alert(title: Text("Verify your Email ID"), message: Text("Please click the link in the verification email sent to you"), dismissButton: .default(Text("Dismiss")){
            
            self.presentationMode.wrappedValue.dismiss()
            self.emailAddress = ""
            self.password = ""
            self.agreeCheck = false
            self.errorText = ""
            
            })
    }
    
    var body: some View {
        
        ZStack{
            RadialGradientUI()
            VStack{
                NavigationBarImageUI()
                List{
                    ZStack(alignment: .center){
                        RadialGradient(gradient: Gradient(colors: [Color.white, Color.white]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_250)
                        
                        Text("Save your data securely in your profile so that you can quickly send us a damage report in the event of an accident. You can change your details in your profile at any time.")
                            //.background(Color.white)
                            //.cornerRadius(dimensClass.cg_4)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                            .padding(dimensClass.cg_8)
                            .font(.subheadline)
                        //.padding(.top, dimensClass.cg_20)
                    }.frame( height: dimensClass.cg_130)
                        .cornerRadius(10)
                    
                    
                    VStack(alignment: .leading) {
                        
                        LabelTextFields(label: stringsClass.firstName_name, labelColor: Color.white, datas: $firstName, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                        
                        LabelTextFields(label: stringsClass.lastName_name, labelColor: Color.white, datas: $lastName, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                        
                        LabelTextFields(label: stringsClass.licencePlate_name, labelColor: Color.white, datas: $lp, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                        
                        LabelTextFields(label: stringsClass.phoneNumber_name, labelColor: Color.white, datas: $phone, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                        
                        LabelTextFields(label: stringsClass.email_name, labelColor: Color.white, datas: $email, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray)
                        
                        VStack(alignment: .leading) {
                            Text("Password")
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
                        
                        
                        actIndSignup(shouldAnimate: self.$shouldAnimate)
                        
                    }
                }.padding(.top, dimensClass.cg_20)
                    .listRowInsets(EdgeInsets())
                
                Toggle(isOn: $agreeCheck)
                {
                    Text("Agree to the Terms and Condition").fontWeight(.thin).foregroundColor(Color.white)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading).padding(.horizontal,5)
                
                Button(action: {
                    
                    if self.firstName != self.stringsClass.emptyText && self.lastName != self.stringsClass.emptyText && self.lp != self.stringsClass.emptyText && self.phone != self.stringsClass.emptyText && self.email != self.stringsClass.emptyText && self.password != self.stringsClass.emptyText
                    {
                        self.firstNameSaved = self.firstName
                        self.lastNameSaved = self.lastName
                        self.lpSaved = self.lp
                        self.phoneSaved = self.phone
                        self.mailSaved = self.email
                        self.passwordSaved = self.password
                        
                        UserDefaults.standard.set(self.firstName, forKey: self.stringsClass.forkey_firstname)
                        UserDefaults.standard.set(self.lastName, forKey: self.stringsClass.forkey_lastname)
                        UserDefaults.standard.set(self.lp, forKey: self.stringsClass.forkey_lp)
                        UserDefaults.standard.set(self.phone, forKey: self.stringsClass.forkey_phone)
                        UserDefaults.standard.set(self.email, forKey: self.stringsClass.forkey_mail)
                        
                        if(self.agreeCheck){
                            print("Printing outputs" + self.email, self.password  )
                            self.shouldAnimate = true
                            self.MailVerificationAuthView(email:self.email, password:self.password)
                            self.alertIdentifier = AlertIdentifier(id: .forth)
                            self.viewRouter.currentPage = self.stringsClass.view_loginUI
                        }
                        else{
                            //self.errorText = "Please Agree to the Terms and Condition"
                            self.alertIdentifier = AlertIdentifier(id: .second)
                        }
                        //self.showingAlert = true
                        
                    } else{
                        self.alertIdentifier = AlertIdentifier(id: .first)
                        self.didTap = true
                    }
                    
                }) {
                    
                    Text("Sign Up")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }.buttonStyle(GradientBackgroundStyle(color: colorClass.blue))
                    .alert(item: $alertIdentifier) { alert in
                        switch alert.id {
                        case .first:
                            return Alert(title: Text("There was a problem with your submission!").fontWeight(.bold), message: Text("Please complete all requiered fields."), dismissButton: .default(Text("Got it!")))
                        
                        case .second:
                            return Alert(title: Text("Privacy Policy!").fontWeight(.bold), message: Text("Please Agree to the Terms and Condition."), dismissButton: .default(Text("Got it!")))
                        case .third:
                            return self.alert
                        case .forth:
                            return Alert(title: Text("Success!").fontWeight(.bold), message: Text("Please verify your email."), dismissButton: .default(Text("Got it!")))
                        }
                }
                
                
                //Text(errorText).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                
                
                //Spacer()
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_loginUI)
            }
            //.padding(10)
            
        }.edgesIgnoringSafeArea(.top).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).background(Color.white)
        
        
        //.alert(isPresented: $showAlert, content: { self.alert })
        
    }
    
    
    func MailVerificationAuthView(email: String, password: String) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
                
                let errorText: String  = error?.localizedDescription ?? "unknown error"
                self.errorText = errorText
                
                return
            }
            
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                if let error = error {
                    self.errorText = error.localizedDescription
                    return
                }
                self.alertIdentifier = AlertIdentifier(id: .third)
                
                self.shouldAnimate = false
                
            }
            
            print("\(user.email!) created")
            
        }
        
        
    }
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(ViewRouter())
    }
}


//hs

// VStack(spacing: 10) {

/*
 Text("Email").font(.title).fontWeight(.thin).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
 
 TextField("user@mail.com", text: $emailAddress).textContentType(.emailAddress)
 
 Text("Password").font(.title).fontWeight(.thin)
 .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
 */

