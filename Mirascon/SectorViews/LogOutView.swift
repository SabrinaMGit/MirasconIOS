//
//  LogOutView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 17.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct LogOutView : View {
    @ObservedObject var viewRouter: ViewRouter
    let colorClass = ColorUI()
    let stringsClass = strings()
    
    var body : some View{
        
        VStack{
            
            Button(action: {
                
                try! Auth.auth().signOut()
                
                UserDefaults.standard.set(false, forKey: "status")
                
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
                self.viewRouter.currentPage = self.stringsClass.view_loginUI
            }) {
                
                Text("Logout")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                                
            }.buttonStyle(GradientBackgroundStyle(color: colorClass.blue))
        }
    }
}


struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView(viewRouter: ViewRouter())
    }
}
