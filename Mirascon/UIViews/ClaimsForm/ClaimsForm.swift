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
                    NavigationBarWithItemUI(viewModel: viewRouter, viewRouterName: stringsClass.view_profil, image: stringsClass.edit_img)
                    Walkthrough(image: "selectInfo")
                List{
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
                        LabelTextField(label: stringsClass.firstName_name, labelColor: Color.white, data: firstNameSaved  ?? stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.lastName_name, labelColor: Color.white, data: lastNameSaved ?? stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.licencePlate_name, labelColor: Color.white, data: lpSaved ?? stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.phoneNumber_name, labelColor: Color.white, data: phoneSaved ?? stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.email_name, labelColor: Color.white, data: mailSaved ?? stringsClass.emptyText, dataColor: Color.white)
                        
                    }
                    .padding(.top, 20)
                    //.listRowInsets(EdgeInsets())
                   
                    /*HStack {
                        Spacer()
                        VStack{
                            Button(action: {
                                self.viewRouter.currentPage = self.stringsClass.view_claimReason
                            }) {
                                Text(stringsClass.continue_name)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                                
                            }.buttonStyle(GradientBackgroundStyle())
                            /*.alert(isPresented: $showingAlert) {
                             Alert(title: Text("Some fields are empty"), message: Text("Fill out all fields"), dismissButton: .default(Text("Got it!")))
                             }*/
                        }
                        Spacer()
                    }*/
                    
                }
                     ContinueBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_claimReason)
                    backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsCenter)
            }
        }
    }
}

/*
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
}*/

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

struct LabelTextField : View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    var label: String
    var labelColor: Color
    var data: String
    var dataColor: Color
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(labelColor)
                .multilineTextAlignment(.leading)
                .font(.headline)
            Text(data)
                .foregroundColor(dataColor)
                .multilineTextAlignment(.leading)
                .font(.body)
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

