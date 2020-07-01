//
//  WalkThroughRow.swift
//  Mirascon
//
//  Created by Dev-Notebook on 29.06.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

struct WalkThroughBtn: View {
    let dimensClass = dimens()
    let stringsClass = strings()
    let colorClass = ColorUI()
    @ObservedObject var viewRouter: ViewRouter
    
 
    var isSelectedForm: Bool
    var isCompletedForm: Bool
    var isSelectedCar: Bool
    var isCompletedCar: Bool
    var isSelectedCam: Bool
    var isCompletedCam: Bool
    var isSelectedMaps: Bool
    var isCompletedMaps: Bool
    var isSelectedSbm: Bool
    var isCompletedSbm: Bool
    
    var body: some View {
        
        ZStack{
            //Horizontal Line
            VStack{
                colorClass.fillForm_orange.frame(width: screenWidth-40, height:CGFloat(1) / UIScreen.main.scale)
            }
            HStack{
                Button(action: {self.viewRouter.currentPage = self.stringsClass.view_claimsForm}) {
                    ZStack{
                        Image(isSelectedForm ? isCompletedForm ? "Selected_Green_View": "Selected_Red_View" : isCompletedForm ? "Unselected_Green_View" : "Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("fillForm")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action:
                    {self.viewRouter.currentPage = self.stringsClass.view_claimReason
                }) {
                    ZStack{
                        Image(isSelectedCar ? isCompletedCar ? "Selected_Green_View": "Selected_Red_View" : isCompletedCar ? "Unselected_Green_View" : "Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("car-info")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {
                   self.viewRouter.currentPage = self.stringsClass.view_camera
                }
                ) {
                    ZStack{
                        Image(isSelectedCam ? isCompletedCam ? "Selected_Green_View": "Selected_Red_View" : isCompletedCam ? "Unselected_Green_View" : "Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {self.viewRouter.currentPage = self.stringsClass.view_googleMaps}) {
                    ZStack{
                        Image(isSelectedMaps ? isCompletedMaps ? "Selected_Green_View": "Selected_Red_View" : isCompletedMaps ? "Unselected_Green_View" : "Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270,height: CGFloat(dimensClass.cg_60))
                        Image("googlemaps")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {self.viewRouter.currentPage = self.stringsClass.view_review}) {
                    ZStack{
                        Image(isSelectedSbm ? isCompletedSbm ? "Selected_Green_View": "Selected_Red_View" : isCompletedSbm ? "Unselected_Green_View" : "Unselected_Red_View") .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth-270, height: CGFloat(dimensClass.cg_60))
                        Image("email-send-outline")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat(dimensClass.cg_30),height: CGFloat(dimensClass.cg_30))
                    }
                }.buttonStyle(PlainButtonStyle())
            }//.frame(width: screenWidth)
        }
    }
}

/*struct WalkThroughBtn_Previews: PreviewProvider {
    static var previews: some View {
        WalkThroughBtn(viewRouter: ViewRouter())
    }
}


 /**/*/
