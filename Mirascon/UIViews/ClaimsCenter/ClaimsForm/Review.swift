//
//  Review.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import MessageUI
import UIKit

struct Review: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    let ggleMaps = GoogleMapsView(ViewRouter())
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    let defaults = UserDefaults.standard
    
    @State public var firstNameSaved = UserDefaults.standard.string(forKey: "firstName")
    @State public var lastNameSaved = UserDefaults.standard.string(forKey: "lastName")
    @State public var lpSaved = UserDefaults.standard.string(forKey: "lp")
    @State public var phoneSaved = UserDefaults.standard.string(forKey: "phone")
    @State public var mailSaved = UserDefaults.standard.string(forKey: "mail")
    
    @State public var addressSaved = UserDefaults.standard.string(forKey: "address")
    @State public var citySaved = UserDefaults.standard.string(forKey: "city")
    @State public var stateSaved = UserDefaults.standard.string(forKey: "state")
    @State public var zipCodeSaved = UserDefaults.standard.string(forKey: "zipCode")
    
    @State var boolPInfo = UserDefaults.standard.bool(forKey: "fillForm")
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    @State var ProfilIsPresent: Bool = false
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack{
                NavigationBarImageUI().padding(.bottom,20)
                 WalkThroughBtn(viewRouter: viewRouter, isSelectedForm: false, isCompletedForm: true, isSelectedCar: false, isCompletedCar: true, isSelectedCam: false, isCompletedCam: false, isSelectedMaps: false, isCompletedMaps: false, isSelectedSbm: true, isCompletedSbm: false)
                
                List{
                    ZStack(alignment: .leading){
                        RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                        
                        Text("Are all the data complete? Confirm your entries and send us your damage report.")
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
                    // .padding(.horizontal,12)
                    //Personal Information View
                    Button(action: {
                        self.viewRouter.currentPage = self.stringsClass.view_claimsForm
                    }){
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                Text("Personal Information:")
                                    .font(.headline)
                                    .foregroundColor(colorClass.startColor)
                                    .padding()
                                    .multilineTextAlignment(.leading)
                                
                                LabelTextField(label: stringsClass.firstName_name, labelColor: colorClass.startColor, data: firstNameSaved  ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.lastName_name, labelColor: colorClass.startColor, data: lastNameSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.licencePlate_name, labelColor: colorClass.startColor, data: lpSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                 LabelTextField(label: stringsClass.email_name, labelColor: colorClass.startColor, data: mailSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.phoneNumber_name, labelColor: colorClass.startColor, data: phoneSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                        
                            }.padding(.bottom,10)
                            Spacer()
                            Image("pencil-black").resizable().frame(width: 20, height: 20)
                        }
                        .frame( width: screenWidth-30) .background(Color.white) .cornerRadius(5) .clipped().shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 5)
                    }
                    //-------
                    //ClaimReasonView
                    Button(action: {
                        self.viewRouter.currentPage = self.stringsClass.view_claimReason
                    }){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Accident Information:")
                                    .font(.headline)
                                    .foregroundColor(colorClass.startColor)
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text("The reason for my damage report is: ")
                                        .foregroundColor(colorClass.startColor)
                                        .multilineTextAlignment(.leading)
                                        .font(.body)
                                    Text("A disabled vehicle.")
                                        .foregroundColor(colorClass.startColor)
                                        .multilineTextAlignment(.leading)
                                        .font(.body)
                                }
                                .padding(.horizontal, 15)
                            
                            }.padding(.bottom,5)
                            Spacer()
                            Image("pencil-black").resizable().frame(width: 20, height: 20)
                        }
                        .frame( width: screenWidth-30) .background(Color.white) .cornerRadius(5) .clipped().shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 5)
                    }
                    //googleMapsView
                    Button(action: {
                        self.viewRouter.currentPage = self.stringsClass.view_googleMaps
                    }){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Location Information:")
                                    .font(.headline)
                                    .foregroundColor(colorClass.startColor)
                                    .padding()
                                LabelTextField(label: stringsClass.forkey_street, labelColor: colorClass.startColor, data: addressSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.forkey_city, labelColor: colorClass.startColor, data: citySaved  ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.forkey_state, labelColor: colorClass.startColor, data: stateSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                            }.padding(.bottom,10)
                            Spacer()
                            Image("pencil-black").resizable().frame(width: 20, height: 20)
                        }
                        .frame( width: screenWidth-30) .background(Color.white) .cornerRadius(5) .clipped().shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 5)
                    }
                }
                //ContinueBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_googleMaps)
                Button(action: {
                    //self.showCaptureImageView.toggle()
                    MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                }) {
                    Text(stringsClass.send_txt)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }.buttonStyle(GradientBackgroundStyle(color: colorClass.btnColor))
                    //            .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                }
                .alert(isPresented: self.$alertNoMail) {
                    Alert(title: Text(stringsClass.no_mail_setup_txt))
                }
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_googleMaps)
            }
        }
    }
}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        Review(ViewRouter())
    }
}

//Sie werden in Kürze benachrichtigt. Weiteres Verfahren nach abschicken
//Sind alle Daten vollständig?
//Emergency center wurde kontaktiert, wir kümmern sich um weiteres.
