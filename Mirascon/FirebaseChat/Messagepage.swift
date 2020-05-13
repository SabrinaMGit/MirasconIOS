//
//  MessagePage.swift
//  Mirascon
//
//  Created by Dev-Notebook on 08.02.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
/*import Combine

struct Messagepage: View {
    @ObservedObject var message = DataFire()
    var name = ""
    
    @Binding var image : Data
    
    @State var write = ""
    var body: some View {
        VStack {
            List(message.chat) { i in
                if i.name == self.name {
                    ListMessage(msg: i.msg, Message: true, user: i.name, image: i.$image)
                } else {
                    ListMessage(msg: i.msg, Message: false, user: i.name, image: i.$image)
                }
                
            }.navigationBarTitle("Chats", displayMode: .inline)
            
            HStack {
                TextField("message...",text: self.$write).padding(10)
                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                .cornerRadius(25)
                
                Button(action: {
                    if self.write.count > 0 {
                        self.message.addInfo(msg: self.write, user: self.name, image: self.image)
                        self.write = ""
                    } else {
                        
                    }
                }) {
                    Image(systemName: "paperplane.fill").font(.system(size: 20))
                        .foregroundColor((self.write.count > 0) ? Color.blue : Color.gray)
                        .rotationEffect(.degrees(50))
                    
                }
            }.padding()
        }
    }
}
*/
