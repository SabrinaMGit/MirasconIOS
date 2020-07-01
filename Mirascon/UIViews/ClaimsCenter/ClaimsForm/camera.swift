//
//  camera.swift
//  Mirascon
//
//  Created by Dev-Notebook on 06.05.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
//import CameraView

struct camera: View {
    let colorClass = ColorUI()
    let dimensClass = dimens()
    let stringsClass = strings()
    @ObservedObject var viewRouter: ViewRouter
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var image2: Image? = nil
    @State private var image3: Image? = nil
    @State private var image4: Image? = nil
    
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack{
            RadialGradientUI()
            VStack {
               NavigationBarImageUI().padding(.bottom,20)
                 WalkThroughBtn(viewRouter: viewRouter, isSelectedForm: false, isCompletedForm: true, isSelectedCar: false, isCompletedCar: true, isSelectedCam: true, isCompletedCam: false, isSelectedMaps: false, isCompletedMaps: false, isSelectedSbm: false, isCompletedSbm: false)
                ZStack(alignment: .leading){
                    RadialGradient(gradient: Gradient(colors: [colorClass.blue, colorClass.blue]), center: .center, startRadius: dimensClass.cg_2, endRadius: dimensClass.cg_650)
                    
                    Text("Please take several photos of the accident damage. Please use the 'Take a Picture' button below.")
                        //.background(Color.white)
                        //.cornerRadius(dimensClass.cg_4)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .padding(dimensClass.cg_8)
                        .font(.subheadline)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    //.padding(.top, dimensClass.cg_20)
                }.frame( height: dimensClass.cg_80).cornerRadius(5)
                    .padding(.horizontal,12)
                List{
                    if image != nil{
                        image?.resizable()
                            .scaledToFit()
                    }
                    if image2 != nil{
                        image2?.resizable()
                            .scaledToFit()
                    }
                    if image3 != nil{
                        image3?.resizable()
                            .scaledToFit()
                    }
                    if image4 != nil{
                        image4?.resizable()
                            .scaledToFit()
                    }
                } .frame( width: screenWidth-30) .background(Color.white) .cornerRadius(10) .clipped().shadow(color: Color.black, radius: 5, x: 0, y: 5)
                    .listRowInsets(EdgeInsets())
                HStack{
                    Button("Take a Picture") {
                        self.showImagePicker = true
                    }
                        //.background(Color.blue)
                        .foregroundColor(Color.white)
                        
                        .buttonStyle(GradientBackgroundStyle(color: colorClass.btnColor))
                    Button(stringsClass.proceed_name) {
                        self.viewRouter.currentPage = self.stringsClass.view_googleMaps
                    }.foregroundColor(Color.white)
                        .buttonStyle(GradientBackgroundStyle(color: colorClass.btnColor))
                    //ContinueBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_googleMaps)
                    //ContinueBtn(viewModel: viewRouter, viewRouterName: stringsClass.view_googleMaps)
                }
                
                backBtn_view(viewRouter: viewRouter, viewRouterName: stringsClass.view_claimReason)
            }.sheet(isPresented: self.$showImagePicker) {
                if self.image == nil{
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
                } else if self.image2 == nil{
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image2)
                } else if self.image3 == nil{
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image3)
                } else if self.image4 == nil{
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image4)
                }
            }
        }
    }
}

struct camera_Previews: PreviewProvider {
    static var previews: some View {
        camera(ViewRouter())
    }
}

/*NavigationView {
 VStack {
 CameraView()
 }
 }*/
