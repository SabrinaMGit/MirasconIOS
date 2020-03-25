//
//  Profil.swift
//  Mirascon
//
//  Created by Dev-Notebook on 08.03.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct Profil: View {
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let labelColor = Color(hex: "#d40b0b")
    let cForm = ClaimsForm(ViewRouter())
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("MirasconLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:40)
                    .padding()
                HStack {
                    Text("")
                    Divider()
                    Text("Profil")
                        .frame(height: 40)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        //.fontWeight(.medium)
                        .cornerRadius(4)
                    Spacer()
                }.background(labelColor)
                    .frame(height: 40)
                Spacer()
                Image("account_circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70.0, height: 70.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                Spacer()
                List {
                    ProfilRow(category:"First Name", customer_details: "\(cForm.firstNameSaved!)", whichEntry: 1)
                    ProfilRow(category:"Last Name", customer_details: "\(cForm.lastNameSaved!)", whichEntry: 2)
                    ProfilRow(category:"License Plate", customer_details: "\(cForm.lpSaved!)", whichEntry: 3)
                    ProfilRow(category:"Phone", customer_details: "\(cForm.phoneSaved!)", whichEntry: 4)
                    ProfilRow(category:"EMail", customer_details: "\(cForm.mailSaved!)", whichEntry: 5)
                }.foregroundColor(Color.white)
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

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil(ViewRouter())
    }
}


struct ProfilRow: View {
    @State private var showingAlert = false
    var category: String
    var customer_details: String
    var whichEntry: Int
    @State private var alertInput = ""
    @State private var isShowingAlert = false
    var body: some View {
        HStack {
            VStack(alignment: .leading){
            Text("\(category)")
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding(.trailing)
            Text("\(customer_details)")
                .foregroundColor(Color.white)
                 .font(.headline)
                .padding(.trailing)
                Spacer()
            }
            Spacer()
            Button(action: {
                
                switch self.whichEntry {
                case 1:
                    print("First Name")
                    Mirascon.alert(title: "Change First Name",message: "Enter a new first name", placeholder: "First Name", savedKey: "firstName")
                    
                case 2:
                    print("You just released iTunes Live From SoHo")
                    Mirascon.alert(title: "Change Last Name",message: "Enter a new Last name", placeholder: "Last Name", savedKey: "lastName")
                    
                case 3:
                    print("You just released Speak Now World Tour")
                    Mirascon.alert(title: "Change License Plate",message: "Enter a new License Plate", placeholder: "License Plate", savedKey: "lp")
                    
                case 4:
                    print("You just released Speak Now World Tour")
                    Mirascon.alert(title: "Change License Plate",message: "Enter a new License Plate", placeholder: "License Plate", savedKey: "lp")
                    
                case 5:
                    print("You just released Speak Now World Tour")
                    Mirascon.alert(title: "Change License Plate",message: "Enter a new License Plate", placeholder: "License Plate", savedKey: "lp")
                default:
                    print("Have you done something new?")
                }
            }) {
                Image("pencil")
                    .foregroundColor(Color.white)
                Text("Edit")
                    .foregroundColor(Color.white)
            }
        }
    }
}
private func alert(title: String, message: String, placeholder: String, savedKey: String,inputKeyboardType:UIKeyboardType = UIKeyboardType.default) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField() { textField in
        textField.placeholder = placeholder
        textField.text = ""
    }
    //alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
    alert.addAction((UIAlertAction(title: "Cancel", style: .default, handler: nil)))
    alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {action in
        print("Saved new entry in UserDefaults")
        let textField = alert.textFields![0]
        print("Text field: \(String(describing: textField.text))")
        let text: String = textField.text!
        print("Text field: \(String(describing: text))")
        UserDefaults.standard.set(text, forKey: savedKey)
    }))
    showAlert(alert: alert)
    //self.present(alert, animated: true, completion: nil)
}

func showAlert(alert: UIAlertController) {
    if let controller = topMostViewController() {
        controller.present(alert, animated: true)
    }
}

private func keyWindow() -> UIWindow? {
    return UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .compactMap {$0 as? UIWindowScene}
        .first?.windows.filter {$0.isKeyWindow}.first
}

private func topMostViewController() -> UIViewController? {
    guard let rootController = keyWindow()?.rootViewController else {
        return nil
    }
    return topMostViewController(for: rootController)
}

private func topMostViewController(for controller: UIViewController) -> UIViewController {
    if let presentedController = controller.presentedViewController {
        return topMostViewController(for: presentedController)
    } else if let navigationController = controller as? UINavigationController {
        guard let topController = navigationController.topViewController else {
            return navigationController
        }
        return topMostViewController(for: topController)
    } else if let tabController = controller as? UITabBarController {
        guard let topController = tabController.selectedViewController else {
            return tabController
        }
        return topMostViewController(for: topController)
    }
    return controller
}
