//
//  ChatFirebaseView.swift
//  
//
//  Created by Dev-Notebook on 07.02.20.
//

import SwiftUI

struct ChatFirebaseView: View {
   @State var name : String = ""
    @State var show = false
    @State var image : Data = .init(count: 0)
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    if self.image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!).resizable()
                        .frame(width: 55, height: 55)
                    .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    } else {
                        Button(action: {
                            self.show.toggle()
                        }) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 55, height: 55)
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        }
                    }
                    
                    TextField("Username..", text: self.$name).padding(10)
                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                    
                    NavigationLink(destination: Messagepage(name: self.name,image: self.$image)){
                        HStack {
                            Text("Enter").padding(12)
                                .foregroundColor(.white)
                                .background((self.name.count > 0) ? Color.blue : Color.gray)
                            .cornerRadius(8)
                            
                        }
                    }//NvtLink
                }/*VStack*/.background(Color.white)
                .cornerRadius(20)
                    //.shadow(color: .gray, radius: 5, x: 1, y:1)
                .padding()
            }//ZStack
        }//NavigationView
            .sheet(isPresented: self.$show, content: {
                ImagePicker(show: self.$show, image: self.$image)
            })
    }
}

struct ChatFirebaseView_Previews: PreviewProvider {
    static var previews: some View {
        ChatFirebaseView()
    }
}
