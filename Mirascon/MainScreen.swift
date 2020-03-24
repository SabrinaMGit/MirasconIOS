//
//  MainScreen.swift
//  Mirascon
//
//  Created by Dev-Notebook on 30.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    
    let startColor = Color(hex: "#19334f")
    let endColor = Color(hex: "#102234")
    let labelColor = Color(hex: "#d40b0b")
    let url = URL(string: "https://www.mirascon.com")
    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
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
                    .frame(width: 200.0,height:100, alignment: .center)
                HStack {
                    HStack {
                        Spacer()
                        VStack(alignment: .leading){
                        //HStack (spacing: 20) {
                            //Text("")
                            Text("WHAT CAN WE DO FOR YOU?")
                                .frame(height: 40)
                                .foregroundColor(Color.white)
                                .font(.headline)
                                //.fontWeight(.medium)
                                .cornerRadius(4)
                         //   Spacer()
                        //}.background(labelColor)
                            
                            //.padding(10)
                        }
                        Spacer()
                    }.background(labelColor).frame(width: 350,height: 40, alignment: .leading)
                    Spacer()
                }
                    //.padding(.trailing)
                VStack {
                    HStack{
                        Button(action: {
                            print("emergency tapped!")
                            self.viewRouter.currentPage = "emergency"
                        }) {
                            MainViewRow(image:"emergency", name:"Emergency Call")
                        }.buttonStyle(btnStyle())
                        Button(action: {
                            print("roadsideAssistance tapped!")
                            self.viewRouter.currentPage = "roadside"
                        }) {
                            MainViewRow(image: "RoadsideAssistance", name: "Roadside Assistance")
                        }.buttonStyle(btnStyle())
                    }
                    HStack{
                        Button(action: {
                            print("claimsCenter tapped!")
                            self.viewRouter.currentPage = "claimsCenter"
                        }) {
                            MainViewRow(image: "ClaimsCenter", name:"Claims Center")
                        }.buttonStyle(btnStyle())
                        Button(action: {
                            print("products tapped!")
                            self.viewRouter.currentPage = "products"
                        }) {
                            MainViewRow(image: "Products", name: "Products")
                        }.buttonStyle(btnStyle())
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            print("exit tapped!")
                            exit(0);
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
            HStack{
                Spacer()
                Button(action: {
                    print("chat Firebase tapped!")
                    //self.viewRouter.currentPage = "chatFirebase"
                }) {
                    Image("chat_smaller_icon")
                        .foregroundColor(Color.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(5)
                    .mask(Circle())
                }
            }
        }
        
    }

}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(ViewRouter())
    }
}

struct MainViewRow: View {
    var image: String
    var name: String
    
    var body: some View {
        VStack{
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .frame(width: 190.0,height:190)
                .foregroundColor(Color.white)
            Text("\(name)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}

struct btnStyle: ButtonStyle {
    let btnColor = Color(hex: "#1b325e")
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            
        }
    }
}

import WebKit

struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

