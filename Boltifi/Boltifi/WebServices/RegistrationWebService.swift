//
//  RegistrationWebService.swift
//  Boltifi
//
//  Created by Sravan on 24/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import AFNetworking

class RegistrationWebService: NSObject {
    
    func registerUser(
        name: String,
        email: String,
        mobileNumber: String,
        password: String,
        userType: String
        ) {
            
            let manager = AFHTTPSessionManager()
            
//            let REGISTRATION_URL    = "method=REG&name=Ravi&emailId=ravinder@gmail.com&mobileNumber=886678&password=password&userType=Sender"
            let _serviceType    = "method=REG"
            let _name           = "&name=" + name
            let _email          = "&emailId=" + email
            let _mobile         = "&mobileNumber=" + mobileNumber
            let _password       = "&password=" + password
            let _userType       = "&userType=" + userType
            
//            "http://52.39.228.252:8080/BoltifiUser/UserManagement?method="
            
            let registrationURL = BASE_URL + _serviceType + _name + _email + _mobile + _password + _userType
            
            print("Registration URL : \(registrationURL)")
            
            manager.responseSerializer.acceptableContentTypes = NSSet(object: "text/plain") as? Set<String> 
            
            manager.GET(registrationURL,
                parameters: nil,
                progress: nil,
                success: { (task, responseObject) -> Void in
                    print("Registration Success. Response: \(responseObject)")
                },
                failure: { (task, error) -> Void in
                    print("Registration Error, Error: \(error.localizedDescription)");
                }
            )
            
//            manager.GET(REGISTRATION_URL,
//                parameters: nil,
//                progress: nil,
//                success: {
//                    (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
//                    println("success")
//                    
//                }, failure: {
//                    (task: NSURLSessionDataTask!, error: NSError!) in
//                    println("error")
//            }
//            )

            
        
//        method=REG&name=Ravi&emailId=ravinder@gmail.com&mobileNumber=886678&password=password&userType=Sender
    }
}