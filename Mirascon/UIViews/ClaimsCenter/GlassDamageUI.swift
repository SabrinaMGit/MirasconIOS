//
//  GlassDamageUI.swift
//  Mirascon
//
//  Created by Dev-Notebook on 01.07.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct GlassDamageUI: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
     @ObservedObject var viewRouter: ViewRouter
       
       init(_ viewRouter: ViewRouter){
           self.viewRouter = viewRouter
           UITableView.appearance().backgroundColor = .clear
           UITableViewCell.appearance().backgroundColor = .clear
       }
    var reason = ["Windshield", "Side or rear glass", "Both of the above"]

    @State private var selectedReason = 0
    var body: some View {
         ZStack{
                   RadialGradientUI()
                   VStack{
                       NavigationBarImageUI().padding(.bottom,20)
                    
                       ZStack(alignment: .leading){
                           RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                           
                           Text("What is the cause of your accident?")
                               //.background(Color.white)
                               //.cornerRadius(dimensClass.cg_4)
                               .multilineTextAlignment(.leading)
                               .foregroundColor(Color.white)
                               .padding(dimensClass.cg_8)
                               .font(.subheadline)
                               .lineLimit(nil)
                               .fixedSize(horizontal: false, vertical: true)
                           //.padding(.top, dimensClass.cg_20)
                       }.frame( height: dimensClass.cg_40).cornerRadius(5).padding(.horizontal,20)
                          // .padding(.horizontal,12)
                   
                           ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_glassDamage, image: "CarClaims", name: "Collision")
                           ButtonRow(viewModel: viewRouter, viewRouterName: stringsClass.view_glassDamage, image: "ic_glassdamage", name: "Breakdown")
                    
                        //Text("Select which glass parts were damaged:").foregroundColor(colorClass.darkerBlue).font(.system(size: 21)).fontWeight(.bold)
                        ZStack(alignment: .leading){
                            RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                            
                            Text("Select which glass parts were damaged:")
                                //.background(Color.white)
                                //.cornerRadius(dimensClass.cg_4)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                                .padding(dimensClass.cg_8)
                                .font(.subheadline)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                            //.padding(.top, dimensClass.cg_20)
                        }.frame( height: dimensClass.cg_40).cornerRadius(5).padding(.horizontal,20)
                        
                        RadioButtonGroup(items: reason, selectedId: self.reason[0]) { selected in
                                   print("Selected is: \(selected)")
                        }.padding(.leading,screenWidth/5)

                    
                    NextBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_glassDamage, btn_name: stringsClass.send_txt)
                       backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsCenter)
                   }
               }
    }
}

struct GlassDamageUI_Previews: PreviewProvider {
    static var previews: some View {
        GlassDamageUI(ViewRouter())
    }
}
/*
 Picker(selection: $selectedReason, label: Text("")) {
                    ForEach(0 ..< reason.count) {
                        Text(self.reason[$0]).foregroundColor(.white)
                        }
                    }.pickerStyle(RadioGroupPickerStyle())
                        Text("Your favorite framework: \(reason[selectedReason])")
 */


struct ColorInvert: ViewModifier {

    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        Group {
            if colorScheme == .dark {
                content.colorInvert()
            } else {
                content
            }
        }
    }
}

struct RadioButton: View {

    @Environment(\.colorScheme) var colorScheme

    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat

    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.white,
        textSize: CGFloat = 19
        ) {
        self.id = id
        self.size = size
        self.color = color
        self.textSize = textSize
        self.selectedID = selectedID
        self.callback = callback
    }

    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image( self.selectedID == self.id ? "radiobox-marked" : "radiobox-blank")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .modifier(ColorInvert())
                Text(id)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}

struct RadioButtonGroup: View {

    let items : [String]

    @State var selectedId: String = ""

    let callback: (String) -> ()

    var body: some View {
        VStack {
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

