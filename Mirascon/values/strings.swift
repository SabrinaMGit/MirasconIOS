//
//  strings.swift
//  Mirascon
//
//  Created by Dev-Notebook on 08.04.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import Foundation

import SwiftUI

struct strings {
    
    //**MainScreen**
    let labelNameM: String
    let emergency_img: String
    let emergency_name: String
    
    let roadsideAssistance_img: String
    let roadsideAssistance_name: String
    
    let claimsCenter_img: String
    let claimsCenter_name: String
    
    let products_img: String
    
    let back_btn_img: String
    
    let chat_img: String
    
    //**EmergencyUI**
    let view_label_description: String
    
    //telefon number's
    let tel: String
    let police_number: String
    let fireDepartment_number: String
    let mirascon_number: String
    //img's and button name's
    let emergencyService_name: String
    let phoneCall_img: String
    let police_img: String
    let police_description: String
    let firedepartment_img: String
    let firedepartment_description: String
    let mirasconStar_img: String
    let mirasconStar_description: String
    
    //view's
    let view_mainview: String
    let view_profil: String
    let view_claimsForm: String
    let view_camera: String
    let view_googleMaps: String
    let view_glassDamage: String
    let view_claimsCenter: String
    
    //**RoadsideAssistance**
    let roadsideNmb: String
    let carclaimsNmb: String
    let labelNameR: String
    let description: String
    
    let roadside_img: String
    let carClaims_img: String
    let carClaims_description: String
    
    //**ClaimsCenter**
    let emptyText: String
    let fillForm_img: String
    let fillForm_description: String
    let camera_description: String
    let cellphone_img: String
    let cellphone_decription: String
    let glassDamage_img: String
    let glassDamage_description: String
    
    let edit_img: String
    
    //**ClaimsForm**
    let descriptionC: String
    let firstName_name: String
    let lastName_name: String
    let licencePlate_name: String
    let phoneNumber_name: String
    let email_name: String
    let continue_name: String
    
    let forkey_firstname: String
    let forkey_lastname: String
    let forkey_lp: String
    let forkey_phone: String
    let forkey_mail: String
    let forkey_firstLaunchIsDone: String
    let forkey_firstLaunch: String
    
    init() {
        
        //**MainScreen**
        labelNameM = "WHAT CAN WE DO FOR YOU?"
        emergency_img = "emergency"
        emergency_name = "Emergency Call"
        roadsideAssistance_img = "RoadsideAssistance"
        roadsideAssistance_name = "Roadside Assistance"
        claimsCenter_img = "ClaimsCenter"
        claimsCenter_name = "Claims Center"
        products_img = "Products"
        back_btn_img = "btnBack"
        chat_img = "chat_smaller_icon"
        
        //**EmergencyUI**
        view_label_description = "If you need help, quickly call the emergency contacts"
        tel = "tel://"
        police_number = "110"
        fireDepartment_number = "112"
        mirascon_number = ""
        emergencyService_name = "EMERGENCY SERVICE"
        phoneCall_img = "PhoneCall"
        police_img = "Police"
        police_description = "POLICE 110                   "
        firedepartment_img = "FireDepartment"
        firedepartment_description = "FIRE DEPARTMENT 112"
        mirasconStar_img = "MirasconStar"
        mirasconStar_description = "0800 MIRASCON         "
        
        //**ViewManager**
        view_mainview = "mainView"
        view_profil = "profil"
        view_claimsForm = "claimsForm"
        view_camera = "camera"
        view_googleMaps = "googleMaps"
        view_glassDamage = "glassDamage"
        view_claimsCenter = "claimsCenter"
        
        //**RoadsideAssistance
        roadsideNmb = ""
        carclaimsNmb = ""
        labelNameR = "ROADSIDE ASSISTANCE"
        description = "If you need help, call the roadside assistance contacts"
        roadside_img = "RoadsideAssistance"
        carClaims_img = "CarClaims"
        carClaims_description = "0800 CARCLAIMS         "
        
        //**ClaimsCenter**
        emptyText = ""
        fillForm_img = "fillForm"
        fillForm_description = "FILL OUT THE CLAIMS FORM"
        camera_description = "PHOTOS CAMERA UPLOAD      "
        cellphone_img = "cellphone_information"
        cellphone_decription = "OTHER INFO MP / POLICE        "
        glassDamage_img = "ic_glassdamage"
        glassDamage_description = "GLASS DAMAGE                       "
        edit_img = "account-edit-outline"
        
        //**ClaimsForm**
        descriptionC = "Online report is fast and easy! You can report accidents, vehicle damgage,  roadside service and more!"
        firstName_name = "First Name:"
        lastName_name = "Last Name:"
        licencePlate_name = "Licence Plate:"
        phoneNumber_name = "Phone Number:"
        email_name = "EMail:"
        continue_name = "CONTINUE"
        forkey_firstname = "firstName"
        forkey_lastname = "lastName"
        forkey_lp = "lp"
        forkey_phone = "phone"
        forkey_mail = "mail"
        forkey_firstLaunchIsDone = "com.any-suggestion.FirstLaunch.WasLaunchedBefore"
        forkey_firstLaunch = "firstLaunch"
        
        
    }
}
