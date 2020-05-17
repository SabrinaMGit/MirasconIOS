//
//  LogOutBtn.swift
//  Mirascon
//
//  Created by Dev-Notebook on 17.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
import Firebase

struct LogOutBtn: View {
    @State var viewState = CGSize.zero
    @State var MainviewState =  CGSize.zero
    var body: some View {
        Button(action: {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
            self.MainviewState = CGSize(width: screenWidth, height: 0)
            self.viewState = CGSize(width: 0, height: 0)
            
        }, label: {
            Text("Sign Out")
                .foregroundColor(Color.white)
                .padding()
        })
            .background(Color.green)
            .cornerRadius(5)
    }
}


struct LogOutBtn_Previews: PreviewProvider {
    static var previews: some View {
        LogOutBtn()
    }
}
