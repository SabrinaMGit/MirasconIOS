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
                    //NavigationBarWithItemUI(viewModel: viewRouter, viewRouterName: stringsClass.view_profil, image: stringsClass.edit_img)
                    NavigationBarImageUI().padding(.bottom,20)
                    ZStack{
                    Walkthrough(image: "selectInfo").padding(.horizontal,10)
                        HStack{
                            Button(action: {self.viewRouter.currentPage = self.stringsClass.view_claimsForm}) {Text("")}.frame(width: 50, height: 50)//.background(Color.white)
                            Button(action: {self.viewRouter.currentPage = self.stringsClass.view_claimReason}) {Text("")}.frame(width: 20, height: 20)
                            Button(action: {self.viewRouter.currentPage = self.stringsClass.view_camera}) {Text("")}.frame(width: 20, height: 20)
                            Button(action: {self.viewRouter.currentPage = self.stringsClass.view_googleMaps}) {Text("")}.frame(width: 20, height: 20)
                            Button(action: {self.viewRouter.currentPage = self.stringsClass.view_review}) {Text("")}.frame(width: 20, height: 20)
                            }
                    }
                    List{
                    ZStack(alignment: .leading){
                        RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                        
                        Text("Is your personal data correct? You can complete and change the data in the profile.")
                            //.background(Color.white)
                            //.cornerRadius(dimensClass.cg_4)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .padding(dimensClass.cg_8)
                            .font(.subheadline)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        //.padding(.top, dimensClass.cg_20)
                    }.frame( height: dimensClass.cg_70).cornerRadius(5)
                      //  .padding(.horizontal,12)
               
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
                    HStack{
                    VStack(alignment: .leading) {
                        LabelTextField(label: stringsClass.firstName_name, labelColor: Color.black, data: stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.lastName_name, labelColor: Color.black, data: stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.licencePlate_name, labelColor: Color.black, data: stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.phoneNumber_name, labelColor: Color.black, data: stringsClass.emptyText, dataColor: Color.white)
                        LabelTextField(label: stringsClass.email_name, labelColor: Color.black, data: stringsClass.emptyText, dataColor: Color.white)
                        
                    }
                    }.frame( width: screenWidth-30) .background(Color.white) .cornerRadius(5) .clipped().shadow(color: Color.black, radius: 5, x: 0, y: 5)
                    .padding(.top, 10)
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
                    NextBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_claimReason, btn_name: stringsClass.proceed_name)
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

