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
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
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
            VStack{
                LogoBar()
            List{
                Text(stringsClass.description)
                    .background(Color.white)
                    .cornerRadius(dimensClass.cg_4)
                    .multilineTextAlignment(.leading)
                VStack(alignment: .leading) {
                    LabelTextField(label: stringsClass.firstName_name, data: $firstName, savedData: firstNameSaved ?? stringsClass.emptyText)
                    LabelTextField(label: stringsClass.lastName_name, data: $lastName, savedData: lastNameSaved ?? stringsClass.emptyText)
                    LabelTextField(label: stringsClass.licencePlate_name, data: $lp, savedData: lpSaved ?? stringsClass.emptyText)
                    LabelTextField(label: stringsClass.phoneNumber_name, data: $phone, savedData: phoneSaved ?? stringsClass.emptyText)
                    LabelTextField(label: stringsClass.email_name, data: $email, savedData: mailSaved ?? stringsClass.emptyText)
                    LabelTextField(label: stringsClass.email_name, data: $email, savedData: mailSaved ?? stringsClass.emptyText)
                    
                }
                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
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
    
    @State var lp: String = ""
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    
    var body: some View{
        VStack {
            HStack {
                Text(stringsClass.licencePlate_name)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
               // Spacer()
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

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct LabelTextField : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    let claimsForm = ClaimsForm(ViewRouter())
    
    var label: String
    @Binding var data: String
    var savedData: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .font(.headline)
            
            TextField(stringsClass.emptyText, text: $data)
            .padding(dimensClass.cg_3)
            .background(colorClass.btnColor)
            .foregroundColor(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                .stroke( lineWidth: dimensClass.cg_0))
            if data.isEmpty { Text("\(savedData )").foregroundColor(.white) }
            }
            .padding(.horizontal, 15)
    }
}


/*
                  Text(stringsClass.firstName_name)
                  .foregroundColor(Color.white)
                  .multilineTextAlignment(.leading)
                  */
                 /*
                 TextField(stringsClass.emptyText, text: $firstName)
                     .padding(dimensClass.cg_8)
                     .background(colorClass.blueRectangle)
                     .foregroundColor(Color.white)
                     .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous))
                     .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_10, style: .continuous)
                         .stroke( lineWidth: dimensClass.cg_0))
                 if firstName.isEmpty { Text("\(firstNameSaved ?? stringsClass.emptyText)").foregroundColor(.white) }
                 */


struct ClaimsForm_Previews: PreviewProvider {
    static var previews: some View {
        ClaimsForm(ViewRouter())
    }
}





