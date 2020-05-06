//
//  SaveUserData.swift
//  Mirascon
//
//  Created by Dev-Notebook on 05.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct SaveUserData: View {
    
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
                   NavigationBarImageUI()
                List{
                    ZStack(alignment: .center){
                        RadialGradient(gradient: Gradient(colors: [colorClass.darkerRed, colorClass.endRed]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                        
                        Text("Save your data securely in your profile so that you can quickly send us a damage report in the event of an accident. You can change your details in your profile at any time")
                            //.background(Color.white)
                            //.cornerRadius(dimensClass.cg_4)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .padding(dimensClass.cg_8)
                            .font(.subheadline)
                        //.padding(.top, dimensClass.cg_20)
                    }.frame( height: dimensClass.cg_130)
                    /* HStack{
                     Image(stringsClass.fillForm_img)
                     .frame(width: dimensClass.cg_60, height: dimensClass.cg_60)
                     .overlay(
                     Rectangle()
                     .stroke(colorClass.endColor, lineWidth: dimensClass.cg_0))
                     .background(Color.blue)
                     Image(stringsClass.googlemaps_img)
                     .frame(width: dimensClass.cg_60, height: dimensClass.cg_60)
                     .overlay(
                     Rectangle()
                     .stroke(colorClass.endColor, lineWidth: dimensClass.cg_0))
                     .background(Color.green)
                     Image(stringsClass.view_camera)
                     .frame(width: dimensClass.cg_60, height: dimensClass.cg_60)
                     .overlay(
                     Rectangle()
                     .stroke(colorClass.endColor, lineWidth: dimensClass.cg_0))
                     .background(Color.red)
                     }
                     
                     Text(stringsClass.descriptionC)
                     .background(Color.white)
                     .cornerRadius(dimensClass.cg_4)
                     .multilineTextAlignment(.leading)
                     */
                    
                    VStack(alignment: .leading) {
                        LabelTextFields(label: stringsClass.firstName_name, datas: $firstName, savedDatas: firstNameSaved ?? stringsClass.emptyText)
                        LabelTextFields(label: stringsClass.lastName_name, datas: $lastName, savedDatas: lastNameSaved ?? stringsClass.emptyText)
                        LabelTextFields(label: stringsClass.licencePlate_name, datas: $lp, savedDatas: lpSaved ?? stringsClass.emptyText)
                        LabelTextFields(label: stringsClass.phoneNumber_name, datas: $phone, savedDatas: phoneSaved ?? stringsClass.emptyText)
                        LabelTextFields(label: stringsClass.email_name, datas: $email, savedDatas: mailSaved ?? stringsClass.emptyText)
                        
                    }
                    .listRowInsets(EdgeInsets())
                    HStack {
                        Spacer()
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
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Some fields are empty"), message: Text("Fill out all fields"), dismissButton: .default(Text("Got it!")))
                            }
                        }
                        Spacer()
                    }
                    
                }
                //backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsCenter)
            }
        }
    }
}

struct SavedDataFormRow: View {
    
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

struct LabelTextFields : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    let claimsForm = ClaimsForm(ViewRouter())
    
    var label: String
    @Binding var datas: String
    var savedDatas: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .font(.headline)
            
            TextField(stringsClass.emptyText, text: $datas)
                .padding(dimensClass.cg_3)
                .background(colorClass.startColor)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: dimensClass.cg_5, style: .continuous)
                    .stroke( lineWidth: dimensClass.cg_0))
            if datas.isEmpty { Text("\(savedDatas )").foregroundColor(.white) }
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


struct SaveUserData_Previews: PreviewProvider {
    static var previews: some View {
        SaveUserData(ViewRouter())
    }
}



/*Button(action: {
 self.viewRouter.currentPage = self.stringsClass.view_claimsCenter
 }) {
 Image(stringsClass.back_btn_img)
 .foregroundColor(Color.white)
 
 }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
 .padding()
 .padding(.horizontal, dimensClass.cg_10)
 .background(colorClass.endColor)
 .cornerRadius(dimensClass.cg_10)
 */
