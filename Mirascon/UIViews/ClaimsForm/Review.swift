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
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
       @State var isShowingMailView = false
       @State var alertNoMail = false
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack{
                NavigationBarWithItemUI(viewModel: viewRouter, viewRouterName: stringsClass.view_profil, image: stringsClass.edit_img)
                Walkthrough(image: "WalkthroughMail")
                List{
                    VStack(alignment: .leading) {
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                Text("Personal Information")
                                    .font(.title)
                                    .foregroundColor(colorClass.startColor)
                                    .padding()
                                
                                LabelTextField(label: stringsClass.firstName_name, labelColor: colorClass.startColor, data: firstNameSaved  ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.lastName_name, labelColor: colorClass.startColor, data: lastNameSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.licencePlate_name, labelColor: colorClass.startColor, data: lpSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.phoneNumber_name, labelColor: colorClass.startColor, data: phoneSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
 
                                
                            }
                            Spacer()
                            Image("chevron-right")
                        }
                        .frame(minWidth: dimensClass.cg_0, idealWidth: dimensClass.cg_450, maxWidth: dimensClass.cg_500, minHeight: dimensClass.cg_0, idealHeight: dimensClass.cg_300, maxHeight: dimensClass.cg_450, alignment: .leading)
                        .background(colorClass.grey)
                        .padding(.bottom, 20)
                        
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Accident Information")
                                    .font(.title)
                                    .foregroundColor(colorClass.startColor)
                                    .padding()
                                LabelTextField(label: stringsClass.forkey_street, labelColor: colorClass.startColor, data: addressSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.forkey_city, labelColor: colorClass.startColor, data: citySaved  ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                                LabelTextField(label: stringsClass.forkey_state, labelColor: colorClass.startColor, data: stateSaved ?? stringsClass.emptyText, dataColor: colorClass.startColor)
                            }
                            Spacer()
                            Image("chevron-right")
                        }
                        .frame(minWidth: dimensClass.cg_0, idealWidth: dimensClass.cg_350, maxWidth: dimensClass.cg_450, minHeight: dimensClass.cg_0, idealHeight: dimensClass.cg_300, maxHeight: dimensClass.cg_450, alignment: .leading)
                        .background(colorClass.grey)
                        .padding(.bottom, 20)
                        
                    }
                    .padding(.top, 20)
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
