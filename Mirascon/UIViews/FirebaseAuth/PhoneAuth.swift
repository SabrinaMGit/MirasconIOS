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
                    FirstPage()
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
    
    //@ObjectBinding var text: Binding<String>
    @State private var text = ""
    var onDismissKeyboard: (() -> Void)?
    
    //@State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body : some View{
        ZStack{
            Image("phoneBackg_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: 400.0, height:650)
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
                        //self.viewRouter.currentPage = "ScndPage"
                        PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate: nil) { (verificationID, err) in
                            //self.phoneAuth.showScnd = true
                            //self.viewRouter.currentPage = "ScndPage"
                            if err != nil{
                                print("Error!!")
                                self.msg = (err?.localizedDescription)!
                                self.alert.toggle()
                                //self.phoneAuth.showScnd = true
                                return
                            }
                            print("Success!!")
                           // UIApplication.shared.keyWindow!.rootViewController = UIHostingController(rootView: ScndPage(viewRouter: self.viewRouter, show: self.$show, verificationID: self.$verificationID ))
                            self.verificationID = verificationID!
                            self.show.toggle()
                            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                            //self.phoneAuth.showScnd = true
                            //self.viewRouter.currentPage = "ScndPage"
                            //self.viewRouter.currentPage = self.stringsClass.view_saveData
                            
                        }
                        //self.viewRouter.currentPage = "ScndPage"
                    }) {
                        
                        Text("Send").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                        
                    }.foregroundColor(.white).background(colorClass.blue).cornerRadius(10).padding(.bottom, 60)
                }
                
               // backBtn_view(viewRouter: ViewRouter(), viewRouterName: stringsClass.view_loginUI)
                
            }.padding(.horizontal, 45).padding(.bottom,65)
                .alert(isPresented: $alert) {
                    
                    Alert(title: Text("An error has occurred!"), message: Text(self.msg), dismissButton: .default(Text("Got it!")))
            }
        }
    }
    func addDoneButtonOnNumpad(textField: UITextField) {

      let keypadToolbar: UIToolbar = UIToolbar()

      // add a done button to the numberpad
      keypadToolbar.items=[
        UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder)),
        UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
      ]
      keypadToolbar.sizeToFit()
      // add a toolbar with a done button above the number pad
      textField.inputAccessoryView = keypadToolbar
    }
}
/*
 UIApplication.shared.endEditing() // Call to dismiss keyboard
 extension UIApplication {
 func endEditing() {
 sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
 }
 }*/


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
    
    var body : some View{
        
        ZStack(alignment: .topLeading) {
            
            Image("phoneBackg_img")
                .resizable() .aspectRatio(contentMode: .fill) .edgesIgnoringSafeArea(.top) .frame(width: 400.0, height:650)
            
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor.opacity(0.9), colorClass.endColor.opacity(0.8)]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650).edgesIgnoringSafeArea(.all)
            
            GeometryReader{_ in
                
                VStack(alignment: .center, spacing: 20){
                    
                    Text("Verification Code").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white)
                    
                    Text("Please Enter The Verification Code")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                    
                    TextField("Code", text: self.$verificationCode)
                        .keyboardType(.default)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 15)
                    
                    
                    Button(action: {
                        
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
            
            Button(action: {
                
                self.show.toggle()
                 //self.viewRouter.currentPage = self.stringsClass.view_saveData
                //self.viewRouter.currentPage = self.stringsClass.view_saveData
                
            }) {
                
                Image(systemName: "chevron.left").font(.title)
                
            }.foregroundColor(.orange)
            
        }
        .padding(.horizontal, 45).padding(.bottom,95)
        .alert(isPresented: $alert) {
            
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}


// The UIViewControllerRepresentable, feeding and controlling the UIViewController
struct TextFieldRepresentable
    : UIViewControllerRepresentable {
    
    // the callback
    let dismissKeyboardCallback: (() -> Void)?

    // created in the previous file/gist
    let viewController: TextFieldViewController
    
    init (
        text: Binding<String>
        , dismissKeyboardCallback: (() -> Void)?) {
        
        self.dismissKeyboardCallback = dismissKeyboardCallback
        self.viewController = TextFieldViewController(
            text: text
            , onDismiss: dismissKeyboardCallback
        )
    }
    
    // UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> UIViewController {
        
        return viewController
    }
      
    // UIViewControllerRepresentable
    func updateUIViewController(_ viewController: UIViewController, context: Context) {
    }
    
}

import UIKit
import SwiftUI

class TextFieldViewController
    : UIViewController {
    
    // our custom text field will report changes to the outside
    let text: Binding<String>?
    
    // if the toolbar (see below) is used (Done), the keyboard shall be dismissed
    // and optionally we execute a provided closure
    let onDismiss: (() -> Void)?
    
    init (
        text: Binding<String>
        , onDismiss: (() -> Void)?) {
        
        self.text = text
        self.onDismiss = onDismiss
        
        super.init(
            nibName: "<XIB>"
            , bundle: Bundle.main //Bundle.main?
        )
    }
    
    required init?(coder: NSCoder) {
        self.text = nil
        self.onDismiss = nil
        
        super.init(coder: coder)
    }
    
    // helper function to encapsulate calling the "view" of UIViewController
    fileprivate func getTextField() -> UITextField? {
        return view as? UITextField
    }
    
    override func viewDidLoad() {
        let textField = self.getTextField()
        guard textField != nil else {
            return
        }
        
        // configure a toolbar with a Done button
        let toolbar = UIToolbar()
        toolbar.setItems([
                // just moves the Done item to the right
                UIBarButtonItem(
                    barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace
                    , target: nil
                    , action: nil
                )
                , UIBarButtonItem(
                    title: "Done"
                    , style: UIBarButtonItem.Style.done
                    , target: self
                    , action: #selector(self.onSet)
                )
            ]
            , animated: true
        )
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        textField?.inputAccessoryView = toolbar
    }
    
    @objc private func onSet() {
        let textField = self.getTextField()
        textField?.resignFirstResponder()
        
        self.text?.wrappedValue = textField?.text ?? ""
        self.onDismiss?()
    }
    
}
