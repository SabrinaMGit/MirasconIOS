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
    
    //mirasconLogo
    var mirasconLogo_img: String
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
    let view_saveData: String
    let view_camera: String
    let view_googleMaps: String
    let view_glassDamage: String
    let view_claimsCenter: String
    let view_pagerview: String
    let view_claimReason: String
    let view_review: String
    let view_loginUI: String
    let view_phoneAuth: String
    let view_mailUI: String
    let view_agb: String
    let view_signInView: String
    let view_signUpView: String
    let view_createAccount:String
    let view_fPassword: String
    
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
    let googlemaps_img: String
    let descriptionC: String
    let firstName_name: String
    let lastName_name: String
    let licencePlate_name: String
    let phoneNumber_name: String
    let email_name: String
    let continue_name: String
    let proceed_name: String
    let next_name: String
    
    let forkey_firstname: String
    let forkey_lastname: String
    let forkey_lp: String
    let forkey_phone: String
    let forkey_mail: String
    let forkey_firstLaunchIsDone: String
    let forkey_firstLaunch: String
    let forkey_street: String
    let forkey_city: String
    let forkey_state: String
    
    //**UploadPhto**
    let introduction_photos: String
    let gesture_tap_img: String
    let send_txt: String
    let no_mail_setup_txt: String
    
    //**GlassDamage**
    let when_txt: String
    var where_txt: String
    let what_txt: String
    
    //**Profil**
    let profil_txt: String
    let account_circle_img: String
    
    var change_txt: String
    let enter_a_new_txt: String
    let placeholder_fn: String
    let placeholder_ln: String
    let placeholder_lp: String
    let placeholder_pn: String
    let placeholder_eml: String
    let default_txt: String
    let pencil_img: String
    let edit_txt: String
    
    let cancel_txt: String
    let save_txt: String
    let saved_in_userdefaults_msg: String
    let debug_txt: String
    
    //**GoogleMaps**
    let arrow_right_img: String
    
    init() {
        mirasconLogo_img = "MirasconLogo"
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
        mirascon_number = "+49 22192548878"
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
        view_saveData = "saveData"
        view_camera = "camera"
        view_googleMaps = "googleMaps"
        view_glassDamage = "glassDamage"
        view_claimsCenter = "claimsCenter"
        view_pagerview = "pagerView"
        view_claimReason = "claimReason"
        view_review = "review"
        view_loginUI = "LoginUI"
        view_phoneAuth = "PhoneAuth"
        view_mailUI = "MailUI"
        view_agb = "AGB"
        view_signInView = "SignIn"
        view_signUpView = "SignUp"
        view_createAccount = "CreateAccount"
        view_fPassword = "fPassword"
        
        //**RoadsideAssistance
        roadsideNmb = "+49 22192548879"
        carclaimsNmb = "+49 22192548879"
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
        googlemaps_img = "googlemaps"
        descriptionC = "Online report is fast and easy! You can report accidents, vehicle damgage,  roadside service and more!"
        firstName_name = "First Name:"
        lastName_name = "Last Name:"
        licencePlate_name = "Licence Plate:"
        phoneNumber_name = "Phone Number:"
        email_name = "Mail:"
        continue_name = "Submit"
        forkey_firstname = "firstName"
        forkey_lastname = "lastName"
        forkey_lp = "lp"
        forkey_phone = "phone"
        forkey_mail = "mail"
        forkey_firstLaunchIsDone = "com.any-suggestion.FirstLaunch.WasLaunchedBefore"
        forkey_firstLaunch = "firstLaunch"
        forkey_street = "Street:"
        forkey_city = "City:"
        forkey_state = "Postcode:"
        proceed_name = "proceed"
        next_name = "NEXT"
        
        //**Uploadphoto**
        introduction_photos = " INSTRUCTION WHAT TO MAKE PHOTOS FROM \n - CAR \n - SCENE \n - OTHER"
        gesture_tap_img = "gesture-tap"
        send_txt = "SEND"
        no_mail_setup_txt = "NO MAIL SETUP"
        
        when_txt = "When?:"
        where_txt = "Where?:"
        what_txt = "What?:"
        
        //**Profil**
        profil_txt = "Profil"
        account_circle_img = "account_circle"
        
        change_txt = "Change"
        enter_a_new_txt = "Enter a new"
        placeholder_fn = "First Name"
        placeholder_ln = "Last Name"
        placeholder_lp = "License Plate"
        placeholder_pn = "Phone Number"
        placeholder_eml = "Email"
        default_txt = "Something happend wrong"
        pencil_img = "pencil"
        edit_txt = "Edit"
        
        cancel_txt = "Cancel"
        save_txt = "Save"
        saved_in_userdefaults_msg = "Saved new entry in UserDefaults"
        debug_txt = "Debug: "
        
        arrow_right_img = "arrow-right"
        
    }
}
