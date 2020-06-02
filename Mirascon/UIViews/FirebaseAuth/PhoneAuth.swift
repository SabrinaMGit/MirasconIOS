//
//  PhoneAuth.swift
//  Mirascon
//
//  Created by Dev-Notebook on 13.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct PhoneAuth : View {
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
           self.viewRouter = viewRouter
       }
    
     let stringsClass = strings()
    //@State var showScnd = false
    
    //var firstPages = FirstPage(viewRouter: ViewRouter())
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    // @State var verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
    var body: some View {
        
        VStack{
            
            if status{
                
                //ContentView(viewRouter)
                SaveUserData(viewRouter)
            }
            else{
                NavigationView{
                    FirstPage(value: CGFloat())
                }
            }
            
        }.onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                
                self.status = status
                //self.viewRouter.currentPage = self.stringsClass.view_saveData
                //UIApplication.shared.keyWindow!.rootViewController = UIHostingController(rootView: SaveUserData(self.viewRouter))
            }
        }
        
    }
    
}

struct PhoneAuth_Previews: PreviewProvider {
     
    static var previews: some View {
        PhoneAuth(ViewRouter())
    }
}

struct FirstPage: View {
      
    let stringsClass = strings()
    let colorClass = ColorUI()
    let dimensClass = dimens()
    // var phoneAuth = PhoneAuth(ViewRouter())
    
    @State var ccode = ""
    @State var no = ""
    @State var show = false
    @State var msg = ""
    @State var alert = false
    @State var verificationID = ""
    
    //@Binding var text: Binding<String>
    @State private var text = ""
    var onDismissKeyboard: (() -> Void)?
    @State var value: CGFloat
    @ObservedObject var keyboard = KeyboardResponder()
    @State private var showingSheet = false
    
    //@State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body : some View{
        ZStack{
            Image("phoneBackg_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                
                Text("Verify Your Number").font(.title).fontWeight(.heavy).foregroundColor(Color.white)
                
                Text("Please Enter Your Number To Verify")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 12)
                Text("Your Account")
                    .font(.body)
                    .foregroundColor(.gray)
                
                HStack{
                    Spacer()
                    TextField("+49", text: $ccode)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                        .frame(width: 45)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField("Number", text: $no)
                        .keyboardType(.numberPad) //.numbersAndPunctuation
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .id(1)
                    
                    /*TextFieldRepresentable(
                        text: $text
                        , dismissKeyboardCallback: self.onDismissKeyboard
                    )*/
                    Spacer()
                    
                } .padding(.top, 15).padding(.bottom,10)
                
                NavigationLink(destination: ScndPage(show: $show, verificationID: $verificationID ), isActive: $show) {
                    
                    
                    Button(action: {
                        UIApplication.shared.endEditing() // Call to dismiss keyboard
                        self.showingSheet.toggle()
                        PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate: nil) { (verificationID, err) in
                            if err != nil{
                                print("Error!!")
                                self.msg = (err?.localizedDescription)!
                                self.alert.toggle()
                                self.showingSheet.toggle()
                                return
                            }
                            print("Success!!")
                           // UIApplication.shared.keyWindow!.rootViewController = UIHostingController(rootView: ScndPage(viewRouter: self.viewRouter, show: self.$show, verificationID: self.$verificationID ))
                            self.verificationID = verificationID!
                            self.show.toggle()
                            self.showingSheet.toggle()
                            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                            
                        }
                    }) {
                        
                        Text("Send").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                        
                    }.foregroundColor(.white).background(colorClass.blue).cornerRadius(10).padding(.bottom, 60)
                }
                
               // backBtn_view(viewRouter: ViewRouter(), viewRouterName: stringsClass.view_loginUI)
                
            }.padding(.horizontal, 45).padding(.bottom,65)
                .alert(isPresented: $alert) {
                    
                    Alert(title: Text("An error has occurred!"), message: Text(self.msg), dismissButton: .default(Text("Got it!")))
            }
            if showingSheet == true{
                VStack {
                 ActivityIndicator()
                   .frame(width: 60, height: 60)
                }.foregroundColor(colorClass.orange)
            }
        }
        .padding(.bottom, keyboard.currentHeight)
    }
}

 //UIApplication.shared.endEditing() // Call to dismiss keyboard
 extension UIApplication {
 func endEditing() {
 sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
 }
 }


struct ScndPage : View {
    let stringsClass = strings()
    let colorClass = ColorUI()
    let dimensClass = dimens()
    //var firstPage = FirstPage(viewRouter: ViewRouter())
    
    @State var verificationCode = ""
    @Binding var show : Bool
    @Binding var verificationID : String
    //let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
    @State var msg = ""
    @State var alert = false
    @ObservedObject var keyboard = KeyboardResponder()
    
    var body : some View{
        
        ZStack(alignment: .topLeading) {
            
            Image("phoneBackg_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: screenWidth, height:screenHeight)
            
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650).edgesIgnoringSafeArea(.all)
            
            GeometryReader{_ in
                
                VStack(alignment: .center, spacing: 20){
                    
                    Text("Verification Code").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white)
                    
                    Text("Please Enter The Verification Code")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                    
                    TextField("Code", text: self.$verificationCode)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 15)
                    
                    
                    Button(action: {
                        UIApplication.shared.endEditing() // Call to dismiss keyboard
                        let credential =  PhoneAuthProvider.provider().credential(withVerificationID: self.verificationID, verificationCode: self.verificationCode)
                        
                        Auth.auth().signIn(with: credential) { (res, err) in
                            
                            if err != nil{
                                
                                self.msg = (err?.localizedDescription)!
                                self.alert.toggle()
                                return
                            }
                            //self.viewRouter.currentPage = self.stringsClass.view_saveData
                            UserDefaults.standard.set(true, forKey: "status")
                            
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                            
                        }
                        
                    }) {
                        
                        Text("Verify").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                        
                    }.foregroundColor(.white).background(self.colorClass.blue).cornerRadius(10).padding(.bottom, 60)
                    
                }
                
            }
            .padding(.bottom, keyboard.currentHeight)
        }
        .padding(.horizontal, 45).padding(.bottom,95)
        .alert(isPresented: $alert) {
            
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}
