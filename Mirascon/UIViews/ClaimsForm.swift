//
//  ClaimsForm.swift
//  Mirascon
//
//  Created by Dev-Notebook on 28.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimsForm: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var lp: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var changeViewToGoogleAfterFirstLaunchCheck: Bool = false
    @State var firstLaunchIsDone: Bool = true
    
    let colorClass = ColorUI()
    
    @State private var showingAlert = false
    
    let defaults = UserDefaults.standard
    
    @State public var firstNameSaved = UserDefaults.standard.string(forKey: "firstName")
    @State public var lastNameSaved = UserDefaults.standard.string(forKey: "lastName")
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    @State public var phoneSaved = UserDefaults.standard.string(forKey: "phone")
    @State public var mailSaved = UserDefaults.standard.string(forKey: "mail")
    @State public var firstLaunchApp = UserDefaults.standard.bool(forKey: "firstLaunch")
    
    let status = UserDefaults.standard.bool(forKey: "firstLaunc")
    let firstLaunch = FirstLaunch(userDefaults: .standard, key: "com.any-suggestion.FirstLaunch.WasLaunchedBefore")
    
    let description = "Online report is fast and easy! You can report accidents, vehicle damgage,  roadside service and more!"
    let firstName_name = "First Name:"
    let emptyText = ""
    let lastName_name = "Last Name:"
    let licencePlate_name = "Licence Plate:"
    let phoneNumber_name = "Phone Number:"
    let email_name = "EMail:"
    let continue_name = "CONTINUE"
    let back_btn_img = "btnBack"
    
    let forkey_firstname = "firstName"
    let forkey_lastname = "lastName"
    let forkey_lp = "lp"
    let forkey_phone = "phone"
    let forkey_mail = "mail"
    let forkey_firstLaunchIsDone = "com.any-suggestion.FirstLaunch.WasLaunchedBefore"
    let forkey_firstLaunch = "firstLaunch"
    
    let view_mainView = "mainView"
    let view_googleMaps = "googleMaps"
    let view_claimsCenter = "claimsCenter"
    
    let width = 390
      let minWidth = 0
      let width_370 = 370.0
      let height = 100
      let cornerRadius_4 = 4
      let cornerRadius_1 = 1
      let borderWidth = 2
      let cg_10 = 10
    let cg_8 = 8
    let cg_0 = 0
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack {
                LogoBar()
                Text(description)
                    .background(Color.white)
                    .cornerRadius(CGFloat(cornerRadius_4))
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                VStack {
                                    Text(firstName_name)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                            ZStack(alignment: .leading) {
                                
                                TextField(emptyText, text: $firstName)
                                    .padding(CGFloat(cg_8))
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous)
                                        .stroke( lineWidth: CGFloat(cg_0)))
                                if firstName.isEmpty { Text("\(firstNameSaved ?? emptyText)").foregroundColor(.white) }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(lastName_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading) {
                                TextField(emptyText, text: $lastName)
                                    .padding(CGFloat(cg_8))
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous)
                                        .stroke( lineWidth: CGFloat(cg_0)))
                                if lastName.isEmpty { Text("\(lastNameSaved ?? emptyText)").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(licencePlate_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                                TextField(emptyText, text: $lp)
                                    .padding(CGFloat(cg_8))
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius:  CGFloat(cg_10), style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius:  CGFloat(cg_10), style: .continuous)
                                        .stroke( lineWidth:  CGFloat(cg_0)))
                                if lp.isEmpty { Text("\(lpSaved ?? emptyText)").foregroundColor(.white) }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(phoneNumber_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                                TextField(emptyText, text: $phone)
                                    .padding(CGFloat(cg_8))
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous)
                                        .stroke( lineWidth: CGFloat(cg_0)))
                                if phone.isEmpty { Text("\(phoneSaved ?? emptyText)").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(email_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                                TextField(emptyText, text: $email)
                                    .padding(CGFloat(cg_8))
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: CGFloat(cg_10), style: .continuous)
                                        .stroke( lineWidth: CGFloat(cg_0)))
                                if email.isEmpty { Text("\(mailSaved ?? emptyText)").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                }.padding()
                VStack{
                    
                    Button(action: {
                        
                        if self.firstName != self.emptyText && self.lastName != self.emptyText && self.lp != self.emptyText && self.phone != self.emptyText && self.email != self.emptyText{
                            self.firstNameSaved = self.firstName
                            self.lastNameSaved = self.lastName
                            self.lpSaved = self.lp
                            self.phoneSaved = self.phone
                            self.mailSaved = self.email
                            
                            UserDefaults.standard.set(self.firstName, forKey: self.forkey_firstname)
                            UserDefaults.standard.set(self.lastName, forKey: self.forkey_lastname)
                            UserDefaults.standard.set(self.lp, forKey: self.forkey_lp)
                            UserDefaults.standard.set(self.phone, forKey: self.forkey_phone)
                            UserDefaults.standard.set(self.email, forKey: self.forkey_mail)
                            
                            UserDefaults.standard.set(self.firstLaunchIsDone, forKey: self.forkey_firstLaunchIsDone)
                            if self.firstLaunch.isFirstLaunch {
                                self.viewRouter.currentPage = self.view_mainView
                                self.changeViewToGoogleAfterFirstLaunchCheck = true
                            }
                        } else{
                            self.showingAlert = true
                        }
                        if self.firstLaunchApp {
                            self.viewRouter.currentPage = self.view_googleMaps
                        }
                        if self.changeViewToGoogleAfterFirstLaunchCheck {
                            self.firstLaunchApp = self.firstLaunchIsDone
                            UserDefaults.standard.set(self.firstLaunchIsDone, forKey: self.forkey_firstLaunch)
                        }
                        
                    }) {
                        Text(continue_name)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                    }.buttonStyle(GradientBackgroundStyle())
                    /*.alert(isPresented: $showingAlert) {
                     Alert(title: Text("Some fields are empty"), message: Text("Fill out all fields"), dismissButton: .default(Text("Got it!")))
                     }*/
                    Spacer()
                    
                    Button(action: {
                        self.viewRouter.currentPage = self.view_claimsCenter
                    }) {
                        Image(back_btn_img)
                            .foregroundColor(Color.white)
                        
                    }.frame(minWidth: CGFloat(cg_0), maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, CGFloat(cg_10))
                        .background(colorClass.endColor)
                        .cornerRadius(CGFloat(cg_10))
                }
            }
        }
    }
}

struct ClaimsForm_Previews: PreviewProvider {
    static var previews: some View {
        ClaimsForm(ViewRouter())
    }
}
struct GradientBackgroundStyle: ButtonStyle {
    
    let colorClass = ColorUI()
    let cg_0 = 0
    let cg_100 = 100
    let cg_20 = 20
    let cg_10 = 10
    let cg_0_9 = 0.9
    let cg_1_0 = 1.0
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                .frame(minWidth: CGFloat(cg_0), maxWidth: CGFloat(cg_100))
                .padding()
                .padding(.horizontal, CGFloat(cg_20))
                .background(colorClass.btnColor)
                .cornerRadius(CGFloat(cg_10))
                .scaleEffect(configuration.isPressed ? CGFloat(cg_0_9) : CGFloat(cg_1_0))
            
        }
    }
}

struct claimsFormRow: View {
    
    let colorClass = ColorUI()
    
    let firstName_name = "First Name:"
    let emptyText = ""
    let lastName_name = "Last Name:"
    let licencePlate_name = "Licence Plate:"
    let phoneNumber_name = "Phone Number:"
    let email_name = "EMail:"
    
    let cg_10 = 10
    let cg_8 = 8
    let cg_0 = 0
    
    @State var lp: String = ""
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    
    var body: some View{
        VStack {
            HStack {
                Text(licencePlate_name)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            ZStack(alignment: .leading){
                TextField(emptyText, text: $lp)
                    .padding(CGFloat(cg_8))
                    .background(colorClass.blueRectangle)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius:  CGFloat(cg_10), style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius:  CGFloat(cg_10), style: .continuous)
                        .stroke( lineWidth:  CGFloat(cg_0)))
                if lp.isEmpty { Text("\(lpSaved ?? emptyText)").foregroundColor(.white) }
            }
        }
    }
}





