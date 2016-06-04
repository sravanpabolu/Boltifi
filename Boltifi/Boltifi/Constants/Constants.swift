//
//  Constants.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

func DLog(message: String) {
    print("\(__FUNCTION__) - \(__LINE__) : \(message)")
}

enum GlobalMenuOptions:Int {
    case Home
    case SeeHowItWorks
    case About
    case ContactUs
    case Logout
}



let GOOGLE_MAPS_API_KEY = "AIzaSyDeQl_MfFQ1a8Ox7NmUhJWzSywNevT2w2w"
let PICK_UP_LOCATION = "SET PICK/DROP POINT"
let DROP_LOCAION = "Set as drop point"

let ERROR_MANDATORY_EMPTY_FIELD = "Please fill all the fields"
let ERROR_PASSWORDS_NO_MATCH = "Oops.., Passwords doesn't match"

let KEY_APP_LAUNCH_FIRST_TIME = "isFirstLaunch"

let IDENTIFIER_HOME_VIEW_CONTROLLER                 = "HomeViewController"
let IDENTIFIER_REGISTRATION_VIEW_CONTROLLER         = "RegistrationViewController"
let IDENTIFIER_LOGIN_VIEW_CONTROLLER                = "LoginViewController"
let IDENTIFIER_FARE_ESTIMATE_VIEW_CONTROLLER        = "FareEstimateViewController"
let IDENTIFIER_TRIP_CONFIRMATION_VIEW_CONTROLLER    = "TripConfirmationViewController"
let IDENTIFIER_SEE_HOW_IT_WORKS_VIEW_CONTROLLER     = "SeeHowItWorksViewController"
let IDENTIFIER_ABOUT_VIEW_CONTROLLER                = "AboutViewController"
let IDENTIFIER_CONTACT_US_VIEW_CONTROLLER           = "ContactUsViewController"
let IDENTIFIER_CREDITCARD_VIEW_CONTROLLER           = "CreditCardViewController"
let IDENTIFIER_GLOBAL_MENU_CUSTOM_CELL              = "GlobalMenuCustomCell"
let IDENTIFIER_GLOBAL_MENU_TABLE_VIEW_CONTROLLER    = "GlobalMenuTableViewController"

//let IDENTIFIER_CREDIT_CARD = "credit"

let ALERT_FARE_DISTANCE_TEXT    = "Distance "
let ALERT_FARE_ESTIMATE_TEXT    = "Estimated Fare is: R 50."
let ALERT_CONTINUE_TEXT         = "Do you want to continue ?"
let ALERT_TITLE                 = "Alert"
let ALERT_BUTTON_OK             = "OK"
let ALERT_BUTTON_CANCEL         = "Cancel"
let ALERT_ERROR_TITLE           = "Error"
let ALERT_NO_RESULTS            = "No results found in the given areas. Please try again."
//let ALERT_BUTTON_YES    = "YES"
//let ALERT_BUTTON_NO     = "NO"

let MSG_LOADING                 = "Loading..."
let MSG_REGISTRATION            = "Registering..."
let MSG_LOGIN                   = "Please wait while we log you in."
let MSG_TRY_AGAIN               = "Some error while executing the request. Please try again."

let NAVIGATION_BAR_COLOR = UIColor(rgb: 0xFDCC42)//F9C143
let UNDERLINE_COLOR = UIColor(rgb: 0xDCDCDC)

//MARK: Webservice urls
let BASE_URL            = "http://52.39.228.252:8080/BoltifiUser/UserManagement?"
//let REGISTRATION_URL    = "method=REG&name=Ravi&emailId=ravinder@gmail.com&mobileNumber=886678&password=password&userType=Sender"
let LOGIN_URL           = "method=LOGIN&emailId=ravinder@gmail.com&password=password"

let RESP_ZERO_RESULTS   = "ZERO_RESULTS"
let RESP_OK             = "OK"
