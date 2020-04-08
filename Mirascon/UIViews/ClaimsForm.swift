//
//  ClaimsForm.swift
//  Mirascon
//
//  Created by Dev-Notebook on 28.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimsForm: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
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
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack {
                LogoBar()
                Text(stringsClass.description)
                    .background(Color.white)
                    .cornerRadius(dimensClass.cg_4)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                VStack {
                                    Text(stringsClass.firstName_name)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                            ZStack(alignment: .leading) {
                                
                                TextField(stringsClass.emptyText, text: $firstName)
                                    .padding(dimensClass.cg_8)
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                                        .stroke( lineWidth: dimensClass.cg_0))
                                if firstName.isEmpty { Text("\(firstNameSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(stringsClass.lastName_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading) {
                                TextField(stringsClass.emptyText, text: $lastName)
                                    .padding(dimensClass.cg_8)
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                                        .stroke( lineWidth: dimensClass.cg_0))
                                if lastName.isEmpty { Text("\(lastNameSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(stringsClass.licencePlate_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                                TextField(stringsClass.emptyText, text: $lp)
                                    .padding(dimensClass.cg_8)
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius:  dimensClass.cg_10, style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius:  dimensClass.cg_10, style: .continuous)
                                        .stroke( lineWidth:  dimensClass.cg_0))
                                if lp.isEmpty { Text("\(lpSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(stringsClass.phoneNumber_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                                TextField(stringsClass.emptyText, text: $phone)
                                    .padding(dimensClass.cg_8)
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                                        .stroke( lineWidth: dimensClass.cg_0))
                                if phone.isEmpty { Text("\(phoneSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(stringsClass.email_name)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                                TextField(stringsClass.emptyText, text: $email)
                                    .padding(dimensClass.cg_8)
                                    .background(colorClass.blueRectangle)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                                    .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                                        .stroke( lineWidth: dimensClass.cg_0))
                                if email.isEmpty { Text("\(mailSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                }.padding()
                VStack{
                    
                    Button(action: {
                        
                        if self.firstName != self.stringsClass.emptyText && self.lastName != self.stringsClass.emptyText && self.lp != self.stringsClass.emptyText && self.phone != self.stringsClass.emptyText && self.email != self.stringsClass.emptyText{
                            self.firstNameSaved = self.firstName
                            self.lastNameSaved = self.lastName
                            self.lpSaved = self.lp
                            self.phoneSaved = self.phone
                            self.mailSaved = self.email
                            
                            UserDefaults.standard.set(self.firstName, forKey: self.stringsClass.forkey_firstname)
                            UserDefaults.standard.set(self.lastName, forKey: self.stringsClass.forkey_lastname)
                            UserDefaults.standard.set(self.lp, forKey: self.stringsClass.forkey_lp)
                            UserDefaults.standard.set(self.phone, forKey: self.stringsClass.forkey_phone)
                            UserDefaults.standard.set(self.email, forKey: self.stringsClass.forkey_mail)
                            
                            UserDefaults.standard.set(self.firstLaunchIsDone, forKey: self.stringsClass.forkey_firstLaunchIsDone)
                            if self.firstLaunch.isFirstLaunch {
                                self.viewRouter.currentPage = self.stringsClass.view_mainview
                                self.changeViewToGoogleAfterFirstLaunchCheck = true
                            }
                        } else{
                            self.showingAlert = true
                        }
                        if self.firstLaunchApp {
                            self.viewRouter.currentPage = self.stringsClass.view_googleMaps
                        }
                        if self.changeViewToGoogleAfterFirstLaunchCheck {
                            self.firstLaunchApp = self.firstLaunchIsDone
                            UserDefaults.standard.set(self.firstLaunchIsDone, forKey: self.stringsClass.forkey_firstLaunch)
                        }
                        
                    }) {
                        Text(stringsClass.continue_name)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                    }.buttonStyle(GradientBackgroundStyle())
                    /*.alert(isPresented: $showingAlert) {
                     Alert(title: Text("Some fields are empty"), message: Text("Fill out all fields"), dismissButton: .default(Text("Got it!")))
                     }*/
                    Spacer()
                    
                    Button(action: {
                        self.viewRouter.currentPage = self.stringsClass.view_claimsCenter
                    }) {
                        Image(stringsClass.back_btn_img)
                            .foregroundColor(Color.white)
                        
                    }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, dimensClass.cg_10)
                        .background(colorClass.endColor)
                        .cornerRadius(dimensClass.cg_10)
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
    let dimensClass = dimens()
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                .frame(minWidth: dimensClass.cg_0, maxWidth: dimensClass.cg_100)
                .padding()
                .padding(.horizontal, dimensClass.cg_20)
                .background(colorClass.btnColor)
                .cornerRadius(dimensClass.cg_10)
                .scaleEffect(configuration.isPressed ? dimensClass.cg_scaleEffect_0_9 : dimensClass.cg_scaleEffect_1)
            
        }
    }
}

struct claimsFormRow: View {
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    /*let firstName_name = "First Name:"
    let emptyText = ""
    let lastName_name = "Last Name:"
    let licencePlate_name = "Licence Plate:"
    let phoneNumber_name = "Phone Number:"
    let email_name = "EMail:"
 */
    
    @State var lp: String = ""
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    
    var body: some View{
        VStack {
            HStack {
                Text(stringsClass.licencePlate_name)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            ZStack(alignment: .leading){
                TextField(stringsClass.emptyText, text: $lp)
                    .padding(dimensClass.cg_8)
                    .background(colorClass.blueRectangle)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius:  dimensClass.cg_10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius:  dimensClass.cg_10, style: .continuous)
                        .stroke( lineWidth:  dimensClass.cg_0))
                if lp.isEmpty { Text("\(lpSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
            }
        }
    }
}





