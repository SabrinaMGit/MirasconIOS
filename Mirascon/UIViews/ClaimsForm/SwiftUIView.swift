//
//  SwiftUIView.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
       Button(action: {
            print("Button was tapped")
        }) {
          
        Image("Unselected_Green_View")
                   .resizable()
                   .scaledToFit()
        }.buttonStyle(PlainButtonStyle())
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
