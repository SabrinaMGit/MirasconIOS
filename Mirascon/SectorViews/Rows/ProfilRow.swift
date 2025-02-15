//
//  ProfilRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 17.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct ProfilRow: View {
    
    let stringsClass = strings()
    
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
                    Mirascon.alert(title: "" + self.stringsClass.change_txt + " " + self.stringsClass.firstName_name + "",message: "" + self.stringsClass.enter_a_new_txt + " " + self.stringsClass.firstName_name + "", placeholder: self.stringsClass.placeholder_fn, savedKey: self.stringsClass.forkey_firstname)
                    
                case 2:
                    Mirascon.alert(title: "" + self.stringsClass.change_txt + " " + self.stringsClass.lastName_name + "",message: "" + self.stringsClass.enter_a_new_txt + " " + self.stringsClass.lastName_name + "", placeholder: self.stringsClass.placeholder_ln, savedKey: self.stringsClass.forkey_lastname)
                    
                case 3:
                    Mirascon.alert(title: "" + self.stringsClass.change_txt + " " + self.stringsClass.licencePlate_name + "",message: "" + self.stringsClass.enter_a_new_txt + " " + self.stringsClass.licencePlate_name + "", placeholder: self.stringsClass.placeholder_lp, savedKey: self.stringsClass.forkey_lp)
                    
                case 4:
                    Mirascon.alert(title: "" + self.stringsClass.change_txt + " " + self.stringsClass.phoneNumber_name + "",message: "" + self.stringsClass.enter_a_new_txt + " " + self.stringsClass.phoneNumber_name + "", placeholder: self.stringsClass.placeholder_pn, savedKey: self.stringsClass.forkey_phone)
                    
                case 5:
                    Mirascon.alert(title: "" + self.stringsClass.change_txt + " " + self.stringsClass.email_name + "",message: "" + self.stringsClass.enter_a_new_txt + " " + self.stringsClass.email_name + "", placeholder: self.stringsClass.placeholder_eml, savedKey: self.stringsClass.forkey_mail)
                default:
                    print(self.stringsClass.default_txt)
                }
            }) {
                Image(self.stringsClass.pencil_img)
                    .foregroundColor(Color.white)
                Text(self.stringsClass.edit_txt)
                    .foregroundColor(Color.white)
            }
        }
    }
}


private func alert(title: String, message: String, placeholder: String, savedKey: String, inputKeyboardType:UIKeyboardType = UIKeyboardType.default) {
    
    let stringsClass = strings()
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField() { textField in
        textField.placeholder = placeholder
        textField.text = ""
    }
    //alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
    alert.addAction((UIAlertAction(title: stringsClass.cancel_txt, style: .default, handler: nil)))
    alert.addAction(UIAlertAction(title: stringsClass.save_txt, style: .default, handler: {action in
        print(stringsClass.saved_in_userdefaults_msg)
        let textField = alert.textFields![0]
        print("" + stringsClass.debug_txt + " \(String(describing: textField.text))")
        let text: String = textField.text!
        print("" + stringsClass.debug_txt + "  \(String(describing: text))")
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
