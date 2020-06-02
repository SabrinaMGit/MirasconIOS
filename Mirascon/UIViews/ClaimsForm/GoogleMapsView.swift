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
    
    @State public var manuallyLocation = false
    @State var street: String = ""
    @State var city: String = ""
    @State var state: String = ""
    
    @State private var showingAlert = false
    let defaults = UserDefaults.standard
    
    @State public var streetSaved = UserDefaults.standard.string(forKey: "street")
    @State public var citySaved = UserDefaults.standard.string(forKey: "city")
    @State public var stateSaved = UserDefaults.standard.string(forKey: "state")
    
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradientUI()
                VStack {
                    NavigationBarImageUI().padding(.bottom,20)
                    Walkthrough(image: "WalkthroughMap").padding(.horizontal,10)
                    
                    List{
                        ZStack(alignment: .leading){
                            RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                            
                            Text("Use the location button in the map view or enter your location manually.")
                                //.background(Color.white)
                                //.cornerRadius(dimensClass.cg_4)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                                .padding(dimensClass.cg_8)
                                .font(.subheadline)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                            //.padding(.top, dimensClass.cg_20)
                        }.frame( height: dimensClass.cg_40).cornerRadius(5)
                           // .padding(.horizontal,12)
                        GoogleMap()
                            .frame(height: dimensClass.cg_200)
    
                        Toggle(isOn: $manuallyLocation) {
                            Text("Enter manually your location below.")
                                .foregroundColor(Color.white)
                        }
                        
                        if manuallyLocation {
                            LabelTextFields(label: "City:", labelColor: Color.white, datas: $city, textFieldBorderColor: Color.white )
                            LabelTextFields(label: "Street:", labelColor: Color.white, datas: $street, textFieldBorderColor: Color.white )
                            LabelTextFields(label: stringsClass.forkey_state, labelColor: Color.white, datas: $state, textFieldBorderColor: Color.white )
                        }
                        
                    }
                    .listRowInsets(EdgeInsets())
                    Button(action: {
                        if self.manuallyLocation {
                            if self.street != self.stringsClass.emptyText && self.city != self.stringsClass.emptyText && self.state != self.stringsClass.emptyText {
                                
                                self.streetSaved = self.street
                                self.citySaved = self.city
                                self.stateSaved = self.state
                                
                                UserDefaults.standard.set(self.street, forKey: self.stringsClass.forkey_street)
                                UserDefaults.standard.set(self.city, forKey: self.stringsClass.forkey_city)
                                UserDefaults.standard.set(self.state, forKey: self.stringsClass.forkey_state)
                                
                                self.viewRouter.currentPage = self.stringsClass.view_review
                            } else{
                                self.showingAlert = true
                            }
                        } else{
                            //set manuelly Location in UserDefaults
                            self.viewRouter.currentPage = self.stringsClass.view_review
                        }
                    }) {
                        Text(stringsClass.proceed_name)
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
