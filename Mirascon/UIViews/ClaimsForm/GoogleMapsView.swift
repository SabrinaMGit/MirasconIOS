//
//  GoogleMapsV.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.02.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//
import SwiftUI


struct GoogleMapsView: View {
    //@ObservedObject var viewModel = ContentViewModel()
    
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    @State public var atHome = false
    @State public var manuellyLocation = false
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    
    @State private var showingAlert = false
    let defaults = UserDefaults.standard
    
    @State public var addressSaved = UserDefaults.standard.string(forKey: "address")
    @State public var citySaved = UserDefaults.standard.string(forKey: "city")
    @State public var stateSaved = UserDefaults.standard.string(forKey: "state")
    @State public var zipCodeSaved = UserDefaults.standard.string(forKey: "zipCode")
    
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradientUI()
                VStack {
                    NavigationBarWithItemUI(viewModel: viewRouter, viewRouterName: stringsClass.view_profil, image: stringsClass.edit_img)
                    Walkthrough(image: "WalkthroughMap")
                    
                    List{
                        GoogleMap()
                            .frame(height: dimensClass.cg_200)
                  
                        Toggle(isOn: $atHome) {
                            Text("Is this vehicle at home?")
                                .foregroundColor(Color.white)
                        }
                        Toggle(isOn: $manuellyLocation) {
                            Text("Manuelly enter your location.")
                                .foregroundColor(Color.white)
                        }
                        if manuellyLocation {
                            LabelTextFields(label: "Address:", labelColor: Color.white, datas: $address, textFieldBorderColor: Color.white )
                            LabelTextFields(label: "City:", labelColor: Color.white, datas: $city, textFieldBorderColor: Color.white )
                            LabelTextFields(label: "State:", labelColor: Color.white, datas: $state, textFieldBorderColor: Color.white )
                            LabelTextFields(label: "ZIP Code::", labelColor: Color.white, datas: $zipCode, textFieldBorderColor: Color.white )
                        }
                 
                    }
                    .listRowInsets(EdgeInsets())
                    Button(action: {
                        if self.atHome {
                            //set UserDefaults
                        }
                        if self.manuellyLocation {
                            if self.address != self.stringsClass.emptyText && self.city != self.stringsClass.emptyText && self.state != self.stringsClass.emptyText && self.zipCode != self.stringsClass.emptyText {
                                
                                self.addressSaved = self.address
                                self.citySaved = self.city
                                self.stateSaved = self.state
                                self.zipCodeSaved = self.zipCode
                                
                                UserDefaults.standard.set(self.address, forKey: self.stringsClass.forkey_address)
                                UserDefaults.standard.set(self.city, forKey: self.stringsClass.forkey_city)
                                UserDefaults.standard.set(self.state, forKey: self.stringsClass.forkey_state)
                                UserDefaults.standard.set(self.zipCode, forKey: self.stringsClass.forkey_zipCode)
                                
                                self.viewRouter.currentPage = self.stringsClass.view_review
                            } else{
                                self.showingAlert = true
                            }
                        } else{
                        //set manuelly Location in UserDefaults
                        self.viewRouter.currentPage = self.stringsClass.view_review
                        }
                    }) {
                        Text(stringsClass.continue_name)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                    }.buttonStyle(GradientBackgroundStyle(color: colorClass.btnColor))
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Notice!"), message: Text("Fill out all fields in the address rows"), dismissButton: .default(Text("Got it!")))}
                    
                    backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_camera)
                }//.edgesIgnoringSafeArea(.vertical)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView(ViewRouter())
    }
}
/*
 Button(action: {
 self.viewRouter.currentPage = self.stringsClass.view_camera
 }) {
 Image(stringsClass.arrow_right_img)
 .foregroundColor(Color.white)
 
 }.frame(minWidth: dimensClass.cg_0, maxWidth: .infinity)
 .padding()
 .padding(.horizontal, dimensClass.cg_10)
 .background(colorClass.endColor)
 .cornerRadius(dimensClass.cg_10)
 */
