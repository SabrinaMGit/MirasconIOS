//
//  Color.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct ColorUI {
    var startColor: Color
    var endColor: Color
    var labelColor: Color
    let blueRectangle: Color
    var pictureHolderColor: Color
    var btnColor: Color
    var grey: Color
    var darkerBlue: Color
    var darkerRed: Color
    var endRed: Color
    var blue: Color
    var darkerBlue2: Color
    var facebookColor: Color
    var mailColor: Color
    var phoneColor: Color
    var orange: Color
    var fillForm_orange: Color

  init() {
    startColor = Color(hex: "#19334f")
    endColor = Color(hex: "#102234")
    labelColor = Color(hex: "#d40b0b")
    blueRectangle = Color("#1b325e")
    pictureHolderColor = Color(hex: "#19334f")
    btnColor = Color(hex: "#1b325e")
    grey = Color(hex:"#b5b6b7")
    darkerBlue = Color(hex: "#112336")
    darkerRed = Color(hex: "#b00202")
    endRed = Color(hex: "#4f0101")
    blue = Color(hex: "#4184f0")
    darkerBlue2 = Color(hex: "#2b63bd")
    facebookColor = Color(hex: "#4885ed") //<- google. facebook Color: #29487d
    mailColor = Color(hex: "#db3232")
    phoneColor = Color(hex: "#0d7a1e")
    orange = Color(hex: "#FFA500")
    fillForm_orange = Color(hex: "#f15b24")
    
  }
}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
