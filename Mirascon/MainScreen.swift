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
    let url = URL(string: "https://www.hackingwithswift.com")
    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    RadialGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Image("MirasconLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200.0,height:100)
                        HStack {
                            Image("what_can_we_do_for_you_Label")
                            Spacer()
                        }
                        
                        VStack {
                   
                                HStack{
                                    Button(action: {
                                        print("emergency tapped!")
                                        self.viewRouter.currentPage = "emergency"
                                    }) {
                                        MainViewRow(image:"emergency", name:"Emergency Call")
                                    }
                                    Button(action: {
                                        print("roadsideAssistance tapped!")
                                        self.viewRouter.currentPage = "roadside"
                                    }) {
                                        MainViewRow(image: "RoadsideAssistance", name: "Roadside Assistance")
                                    }
                                }
                                HStack{
                                    Button(action: {
                                        print("claimsCenter tapped!")
                                        self.viewRouter.currentPage = "claimsCenter"
                                    }) {
                                        MainViewRow(image: "ClaimsCenter", name:"Claims Center")
                                    }
                                    Button(action: {
                                        print("products tapped!")
                                        self.viewRouter.currentPage = "products"
                                    }) {
                                        MainViewRow(image: "Products", name: "Products")
                                    }
                                }
                            
                            HStack {
                                Button(action: {
                                    print("back tapped!")
                                    self.viewRouter.currentPage = "launch"
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
                .frame(width: 200.0,height:200)
                .foregroundColor(Color.white)
            Text("\(name)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
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
  

/*
 VStack{
 Image("emergency")
 .resizable()
 .scaledToFit()
 .frame(width: 200.0,height:200)
 .foregroundColor(Color.white)
 Text("Emergency Call")
 .font(.title)
 .fontWeight(.bold)
 .foregroundColor(Color.white)
 .multilineTextAlignment(.center)
 .lineLimit(2)
 .padding()
 .frame(width: 200.0, height: 100.0)
 }
 VStack{
 Image("RoadsideAssistance")
 .resizable()
 .scaledToFit()
 .frame(width: 200.0,height:200)
 .foregroundColor(Color.white)
 Text("Roadside Assistance")
 .font(.title)
 .fontWeight(.bold)
 .foregroundColor(Color.white)
 .multilineTextAlignment(.center)
 .lineLimit(2)
 
 HStack {
 
 VStack{
 Image("ClaimsCenter")
 .resizable()
 .scaledToFit()
 .frame(width: 200.0,height:200)
 .foregroundColor(Color.white)
 Text("Claims Center")
 .font(.title)
 .fontWeight(.bold)
 .foregroundColor(Color.white)
 .multilineTextAlignment(.center)
 }
 VStack{
 Image("Products")
 .resizable()
 .scaledToFit()
 .frame(width: 200.0,height:200)
 .foregroundColor(Color.white)
 Text("Products")
 .font(.title)
 .fontWeight(.bold)
 .foregroundColor(Color.white)
 .multilineTextAlignment(.center)
 }
 }
 }*/

