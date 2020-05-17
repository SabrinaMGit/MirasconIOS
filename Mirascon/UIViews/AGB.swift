//
//  AGB.swift
//  Mirascon
//
//  Created by Dev-Notebook on 10.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct AGB: View {
    @ObservedObject var viewRouter: ViewRouter
     
     init(_ viewRouter: ViewRouter){
         self.viewRouter = viewRouter
     }
    @State private var image: Image?
    @State private var showingImagePicker = false
    var body: some View {
         //WebView(request: URLRequest(url: URL(string: "https://www.mirascon.com/privacy-statement/")!))
       // if let url = URL(string: "https://www.mirascon.com/privacy-statement/") {
         //   webView.load(URLRequest(url: url))
        //}
       // WebView(url: .publicUrl, viewModel: viewModel).overlay (
       //                    RoundedRectangle(cornerRadius: 4, style: .circular)
        //                       .stroke(Color.gray, lineWidth: 0.5)
         //              ).padding(.leading, 20).padding(.trailing, 20)
        //WebView()
        //ViewController()
        WebViewUI()
    }
}

struct AGB_Previews: PreviewProvider {
    static var previews: some View {
        AGB(ViewRouter())
    }
}
