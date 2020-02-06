//
//  ClaimsForm.swift
//  Mirascon
//
//  Created by Dev-Notebook on 28.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ClaimsForm: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var lp: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    let blueRectangle = Color(hex: "#1b325e")
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
     @State private var showingAlert = false
    let defaults = UserDefaults.standard
    
   @State private var firstNameSaved = UserDefaults.standard.string(forKey: "firstName")
    @State private var lastNameSaved = UserDefaults.standard.string(forKey: "lastName")
    @State private var lpSaved = UserDefaults.standard.string(forKey: "lp")
    @State private var phoneSaved = UserDefaults.standard.string(forKey: "phone")
    @State private var mailSaved = UserDefaults.standard.string(forKey: "mail")
    
    @ObservedObject var viewRouter: ViewRouter
      init(_ viewRouter: ViewRouter){
          self.viewRouter = viewRouter
      }
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("MirasconLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:100)
                Text("Online report is fast and easy! You can report accidents, vehicle damgage,  roadside service and more!")
                    .background(Color.white)
                    .cornerRadius(4)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                VStack {
                                    Text("First Name:")
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                            ZStack(alignment: .leading) {
                                
                            TextField("", text: $firstName)
                               .padding(8)
                                .background(blueRectangle)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke( lineWidth: 0))
                                if firstName.isEmpty { Text("\(firstNameSaved ?? "")").foregroundColor(.white) }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text("Last Name:")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                             ZStack(alignment: .leading) {
                            TextField("", text: $lastName)
                                .padding(8)
                                .background(blueRectangle)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke( lineWidth: 0))
                            if lastName.isEmpty { Text("\(lastNameSaved ?? "")").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text("Licence Plate:")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                            TextField("", text: $lp)
                                .padding(8)
                                .background(blueRectangle)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke( lineWidth: 0))
                            if lp.isEmpty { Text("\(lpSaved ?? "")").foregroundColor(.white) }
                        }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text("Phone Number:")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                            TextField("", text: $phone)
                                .padding(8)
                                .background(blueRectangle)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke( lineWidth: 0))
                            if phone.isEmpty { Text("\(phoneSaved ?? "")").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text("EMail:")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            ZStack(alignment: .leading){
                            TextField("", text: $email)
                                .padding(8)
                                .background(blueRectangle)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke( lineWidth: 0))
                            if email.isEmpty { Text("\(mailSaved ?? "")").foregroundColor(.white) }
                            }}
                        Spacer()
                    }
                }.padding()
                VStack{
                    
                    Button(action: {
                        print("continue tapped!")
                        self.firstNameSaved = self.firstName
                        self.lastNameSaved = self.lastName
                        self.lpSaved = self.lp
                        self.phoneSaved = self.phone
                        self.mailSaved = self.email
                        UserDefaults.standard.set(self.firstName, forKey: "firstName")
                        UserDefaults.standard.set(self.lastName, forKey: "lastName")
                        UserDefaults.standard.set(self.lp, forKey: "lp")
                        UserDefaults.standard.set(self.phone, forKey: "phone")
                        UserDefaults.standard.set(self.email, forKey: "mail")
                        self.viewRouter.currentPage = "mainView"
                        
                        if self.firstName != "" && self.lastName != "" && self.lp != "" && self.phone != "" && self.email != ""{
                            //let defaults = UserDefaults.standard
                        //defaults.set(25, forKey: "Age")
                           
                            
                        //let arrayCustomData = [self.firstName,self.lastName,self.lp,self.phone,self.email ]
                        //defaults.set(arrayCustomData, forKey: "SavedArrayData")
                        
                        } else{
                             self.showingAlert = true
                        }
                    }) {
                        Text("CONTINUE")
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                    }.buttonStyle(GradientBackgroundStyle())
                    /*.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Some fields are empty"), message: Text("Fill out all fields"), dismissButton: .default(Text("Got it!")))
                    }*/
                    Spacer()
                    
                    Button(action: {
                        print("back tapped!")
                        self.viewRouter.currentPage = "claimsCenter"
                    }) {
                        Image("btnBack")
                            .foregroundColor(Color.white)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(endColor)
                        .cornerRadius(10)
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
    let btnColor = Color(hex: "#1b325e")
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                .frame(minWidth: 0, maxWidth: 100)
                .padding()
                .padding(.horizontal, 20)
                .background(btnColor)
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            
        }
    }
}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

let gray0 = Color(hex: "3f")
let gray1 = Color(hex: "#69")
let gray2 = Color(hex: "#6911")
let gray3 = Color(hex: "fff")
let red = Color(hex: "#FF000044s")
let green = Color(hex: "#00FF00")
let blue0 = Color(hex: "0000FF")
let blue1 = Color(hex: "0000F")




