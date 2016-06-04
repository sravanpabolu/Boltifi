//
//  WebServiceManager.swift
//  Boltifi
//
//  Created by Sravan on 24/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import AFNetworking

class WebServiceManager: NSObject {
    
    //MARK: Objects
    let httpSessionManager = AFHTTPSessionManager()
    let httpObj = HTTPHelper()
    
    //MARK: CallBack Block
    typealias webServiceStringResponseCallBack = (result: String?, error: String?) -> ()
    typealias webServiceResponseCallBack = (result: NSDictionary?, error: String?) -> ()
    
    //MARK: Methods
    func registerUser(
        name name: String,
        email: String,
        mobileNumber: String,
        password: String,
        userType: String,
        //TODO: Change to WebServiceResponse, after json is implemented
//        webServiceCallBack: WebServiceResponse
        webServiceCallBack: webServiceStringResponseCallBack
        ) {
            let _serviceType    = "method=REG"
            let _name           = "&name=" + name
            let _email          = "&emailId=" + email
            let _mobile         = "&mobileNumber=" + mobileNumber
            let _password       = "&password=" + password
            let _userType       = "&userType=" + userType
            
            var registrationURL = BASE_URL + _serviceType + _name + _email + _mobile + _password + _userType
            
            registrationURL = "http://52.39.228.252:8080/BoltifiUser/UserManagement?method=REG&name=Tuesday&emailId=tuesday@boltifi.com&mobileNumber=8888999900&password=tuesday&userType=Sender"
            let registrationRequest = NSMutableURLRequest(URL: NSURL(string: registrationURL)!)
            httpObj.httpGet(registrationRequest) {
                (dictResult, error) -> Void in
                if (error == nil) {
                    webServiceCallBack(result: dictResult as? String, error: nil)
                }
                else {
                    webServiceCallBack(result: nil, error: error as? String)
                }
            }
    }
    
    func loginUser ( userEmail: String, password: String, webServiceCallBack: webServiceStringResponseCallBack) {
        let _serviceType    = "method=LOGIN"
        let _userEmail      = "&emailId=" + userEmail
        let _password       = "&password=" + password
        
        var loginURL = BASE_URL + _serviceType + _userEmail + _password
        loginURL = "http://52.39.228.252:8080/BoltifiUser/UserManagement?method=LOGIN&emailId=ravinder@gmail.com&password=password"
        
        let loginRequest = NSMutableURLRequest(URL: NSURL(string: loginURL)!)
        httpObj.httpGet(loginRequest) {
            (dictResult, error) -> Void in
            if (error == nil) {
                webServiceCallBack(result: dictResult as? String, error: nil)
            }
            else {
                webServiceCallBack(result: nil, error: error as? String)
            }
        }
    }
    
    
    func distanceBetweenAreas(fromArea fromArea: String, toArea: String, webServiceCallBack: webServiceResponseCallBack) {
        
        let distanceUrl = "http://maps.googleapis.com/maps/api/directions/json?origin=Dilsuk%20nagar,%20Hyderabad&destination=Madhapur,%20Hyderabad&sensor=false"

        httpSessionManager.GET(
            distanceUrl,
            parameters: nil,
            progress: nil,
            success: { (dataTask, responseObject) -> Void in
                let response = responseObject as! NSDictionary
                webServiceCallBack(result: response, error: nil)
            }, failure: { (dataTask, error) -> Void in
                webServiceCallBack(result: nil, error: error.localizedDescription)
            }
        )
    }
    
    //TODO: Not required
//    func calculateDistance(url urlString: String, completion: (distance: Double?) -> Void) -> String {
//        
////        let service = "https://maps.googleapis.com/maps/api/directions/json"
////        let originLat = origin.coordinate.latitude
////        let originLong = origin.coordinate.longitude
////        let destLat = destination.coordinate.latitude
////        let destLong = destination.coordinate.longitude
////        let urlString = "\(service)?origin=\(originLat),\(originLong)&destination=\(destLat),\(destLong)&mode=driving&units=metric&sensor=true&key=<YOUR_KEY>"
//        let directionsURL = NSURL(string: urlString)
//        
//        let request = NSMutableURLRequest(URL: directionsURL!)
//        
//        request.HTTPMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        var response: String = ""
//
//        httpSessionManager.GET(urlString, parameters: nil, progress:nil, success: { (dataTask, responseObject) -> Void in
//            DLog("Reponse Object: \(responseObject)")
//            
//            if let result = responseObject as? NSDictionary {
//                
//                let status = result["status"] as! NSString
//                
//                if status.isEqualToString(RESP_ZERO_RESULTS) {
//                    response = RESP_ZERO_RESULTS
//                } else if status.isEqualToString(RESP_OK) {
//                    if let routes = result["routes"] as? [NSDictionary] {
//                        if let lines = routes[0]["overview_polyline"] as? NSDictionary {
//                            if let points = lines["points"] as? String {
//                                let path = GMSPath(fromEncodedPath: points)
//                                let distance = GMSGeometryLength(path)
//                                DLog("wow \(distance / 1000) KM")
//                                
//                                response = String(format:"%f", (distance / 1000))
//                            }
//                        }
//                    }
//                } else {
//                    DLog("Some error in executing the distance request")
//                    response = "Some Error in executing the distance request"
//                }
//            }
//            
//            }, failure: { (dataTask, error) -> Void in
//                DLog("Error: \(error.localizedDescription)")
//                response = String(format: "Error: \(error.localizedDescription)")
//        })
//        
//        return response
//    }
}