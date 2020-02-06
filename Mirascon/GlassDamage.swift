//
//  GlassDamage.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct GlassDamage: View {
    @State var when: String = ""
    @State var wheree: String = ""
    @State var what: String = ""
    let blueRectangle = Color(hex: "#1b325e")
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let pictureHolderColor = Color(hex: "#19334f")
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
                Text(" INSTRUCTION WHAT TO MAKE PHOTOS FROM \n - CAR \n - SCENE \n - OTHER")
                    .frame(minWidth: 390, idealWidth: 390, maxWidth: 390, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(4)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack{
                HStack {
                    Text("When?:")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                TextField("", text: $when)
                    .padding(8)
                    .background(blueRectangle)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke( lineWidth: 0)
                )
                HStack {
                    Text("Where?:")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                TextField("", text: $wheree)
                    .padding(8)
                    .background(blueRectangle)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke( lineWidth: 0)
                )
                HStack {
                    Text("What?:")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                TextField("", text: $what)
                    .padding(8)
                    .background(blueRectangle)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke( lineWidth: 0)
                )
                }.padding()
                Spacer()
                HStack{
                    Image("")
                        .frame(width: 200.0,height:200)
                        .background(pictureHolderColor)
                    Image("")
                        .frame(width: 200.0,height:200)
                        .background(pictureHolderColor)
                }
                Button(action: {
                    print("send tapped!")
                }) {
                    Text("SEND")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                }.buttonStyle(GradientBackgroundStyle())
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

struct GlassDamage_Previews: PreviewProvider {
    static var previews: some View {
        GlassDamage(ViewRouter())
    }
}
