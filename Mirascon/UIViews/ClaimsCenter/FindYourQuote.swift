//
//  FindYourQuote.swift
//  Mirascon
//
//  Created by Dev-Notebook on 01.07.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct FindYourQuote: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    @State var email: String = ""
    @State var lastname: String = ""
    @State var zipcode: String = ""
    @State private var didTap: Bool = false
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack{
                NavigationBarImageUI().padding(.bottom,20)
           
                ZStack(alignment: .leading){
                    RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                    
                    Text("Find Your Quote")
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
                Spacer()
                LabelTextFields(label: stringsClass.email_name, labelColor: Color.white, datas: $email, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray, placeholderName: stringsClass.emptyText).keyboardType(.emailAddress)
                VStack(alignment: .leading){
                    Text("Date of Birth:").foregroundColor(.white).padding(.leading,15)
                HStack{
                    LabelTextFields(label: "", labelColor: Color.white, datas: $lastname, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray, placeholderName: "MM").keyboardType(.emailAddress)
                    Text("/").foregroundColor(.white)
                    LabelTextFields(label: "", labelColor: Color.white, datas: $lastname, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray, placeholderName: "DD").keyboardType(.emailAddress)
                     Text("/").foregroundColor(.white)
                    LabelTextFields(label: "", labelColor: Color.white, datas: $lastname, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray, placeholderName: "YYYY").keyboardType(.emailAddress)
                }
                }
                LabelTextFields(label: stringsClass.lastName_name, labelColor: Color.white, datas: $lastname, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray, placeholderName: stringsClass.emptyText).keyboardType(.emailAddress)
                LabelTextFields(label: stringsClass.zipcode, labelColor: Color.white, datas: $zipcode, textFieldBorderColor: didTap ? colorClass.darkerRed : Color.gray, placeholderName: stringsClass.emptyText).keyboardType(.emailAddress)
            
            Spacer()
            NextBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_findQuote, btn_name: stringsClass.send_txt)
             backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimsCenter)
         }
        }
    }
}



struct FindYourQuote_Previews: PreviewProvider {
    static var previews: some View {
        FindYourQuote(ViewRouter())
    }
}
