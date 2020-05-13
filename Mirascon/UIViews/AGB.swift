//
//  AGB.swift
//  Mirascon
//
//  Created by Dev-Notebook on 10.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct AGB: View {
    var body: some View {
         WebView(request: URLRequest(url: URL(string: "https://www.mirascon.com/privacy-statement/")!))
    }
}

struct AGB_Previews: PreviewProvider {
    static var previews: some View {
        AGB()
    }
}
