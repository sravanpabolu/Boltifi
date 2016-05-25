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
    let manager = AFHTTPSessionManager()
    let httpObj = HTTPHelper()
    
    //MARK: Methods
    func registerUser(
        name: String,
        email: String,
        mobileNumber: String,
        password: String,
        userType: String
        ) {
//            let REGISTRATION_URL    = "method=REG&name=Ravi&emailId=ravinder@gmail.com&mobileNumber=886678&password=password&userType=Sender"
            let _serviceType    = "method=REG"
            let _name           = "&name=" + name
            let _email          = "&emailId=" + email
            let _mobile         = "&mobileNumber=" + mobileNumber
            let _password       = "&password=" + password
            let _userType       = "&userType=" + userType
            
//            "http://52.39.228.252:8080/BoltifiUser/UserManagement?method="
            
            var registrationURL = BASE_URL + _serviceType + _name + _email + _mobile + _password + _userType
            
            registrationURL = "http://52.39.228.252:8080/BoltifiUser/UserManagement?method=REG&name=Tuesday&emailId=tuesday@boltifi.com&mobileNumber=8888999900&password=tuesday&userType=Sender"
            
            print("Registration URL : \(registrationURL)")
            
            manager.responseSerializer.acceptableContentTypes = NSSet(object: "application/json") as? Set<String>
            
//            manager.GET(registrationURL,
//                parameters: nil,
//                progress: nil,
//                success: { (task, responseObject) -> Void in
//                    print("Registration Success. Response: \(responseObject)")
//                },
//                failure: { (task, error) -> Void in
//                    print("Registration Error, Error: \(error.localizedDescription)");
//                }
//            )
            
            let registrationRequest = NSMutableURLRequest(URL: NSURL(string: registrationURL)!)
//            let loginRequest = NSMutableURLRequest(URL: NSURL(string: loginURL)!)
            httpObj.httpGet(registrationRequest) {
                (dictResult, error) -> Void in
                if(error == nil){
                    // self.resultDict = dictResult.copy() as NSDictionary
                    
                    print("dictResult \(dictResult)")
                    //                self.gasStationTable.reloadData()
                    
                    
                }
            }
    }
    
    func loginUser ( userEmail: String, password: String) {
        
        //method=LOGIN&emailId=ravinder@gmail.com&password=password"
        let _serviceType    = "method=LOGIN"
        let _userEmail      = "&emailId=" + userEmail
        let _password       = "&password=" + password
        
        var loginURL = BASE_URL + _serviceType + _userEmail + _password
        
        
        manager.responseSerializer.acceptableContentTypes = NSSet(object: "application/json") as? Set<String>
        
        loginURL = "http://52.39.228.252:8080/BoltifiUser/UserManagement?method=LOGIN&emailId=ravinder@gmail.com&password=password"
        
//        loginURL = "https://www.google.co.in/#q=sample+get+request"
        
        print("Login URL \(loginURL)")
        
//        manager.GET(loginURL,
//            parameters: nil,
//            progress: nil,
//            success: { (task, responseObject) -> Void in
//                print("Login Success. Response: \(responseObject)")
//            },
//            failure: { (task, error) -> Void in
//                print("Login Error, Error: \(error.localizedDescription)");
//        })
        
        let loginRequest = NSMutableURLRequest(URL: NSURL(string: loginURL)!)
        
//        manager.dataTaskWithRequest(loginRequest,
//            completionHandler: {(data, response, error) in
////                if (error == nil) {
////                    var strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
////                    //                    let dictResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: NSError) as AnyObject?
////                    //                    let dictResult:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,
////                    //                        options: NSJSONReadingOptions.MutableContainers)
////                    
////                    callback(strData!, nil)
////                }
////                else {
////                    
////                    callback("", error!.localizedDescription)
////                    
////                }
//                
//                
//                                if(error != nil) {
//                                    print("Error: \(error?.localizedDescription)")
//                                }
////                                if(data != nil) {
//                                    print("Data: \(data)")
////                                }
//                                if(response != nil) {
//                                    print("response: \(response)")
//                                }
//                
//                
//            }
//        );
        
        
        
//        var request = NSMutableURLRequest(URL: NSURL(string: "https://maps.googleapis.com/maps/api/place/search/json?location=13.204492,77.707691&radius=5000000&types=gas_station&sensor=true&key=AIzaSyDwMdrTpADuV_Bd2_af-2fw8Ox9bNQhmdg")!)
        
        
        httpObj.httpGet(loginRequest) {
            (dictResult, error) -> Void in
            if(error == nil){
                // self.resultDict = dictResult.copy() as NSDictionary
                
                print("dictResult \(dictResult)")
//                self.gasStationTable.reloadData()
                
                
            }
        }
    }
    
    func distanceBetweenAreas(fromArea: String, toArea: String) {
        let distanceURL = "http://maps.googleapis.com/maps/api/directions/json?origin=Dilsuk%20nagar,%20Hyderabad&destination=Madhapur,%20Hyderabad&sensor=false"
//        var distanceRequest = NSMutableURLRequest(URL: NSURL(string: distanceURL)!)
        
        
//        let distanceData = NSData(contentsOfURL: NSURL(string: distanceURL)!)
//        var error: NSError?
//        let dictionary: Dictionary<NSObject, AnyObject> = NSJSONSerialization.JSONObjectWithData(distanceData!, options: NSJSONReadingOptions.MutableContainers) as! Dictionary<NSObject, AnyObject>
        
//        NSJSONSerialization.JSONObjectWithData(distanceData, options: NSJSONReadingOptions.MutableContainers)
        
        
        
//        httpObj.httpGet(distanceRequest) { (dictResult, error) -> Void in
//            if(error == nil) {
//                print("distance between areas response : \(dictResult)")
//            }
//            
//            if(dictResult as! NSObject != []) {
//                var routes = dictResult[0] ["routes"]
//                
//            }
//        }
        
        self.calculateDistance(url: distanceURL) { (distance) -> Void in
            print("Distance: \(distance)");
        }
    }
    
    func calculateDistance(url urlString: String, completion: (distance: Double?) -> Void) {
        
//        let service = "https://maps.googleapis.com/maps/api/directions/json"
//        let originLat = origin.coordinate.latitude
//        let originLong = origin.coordinate.longitude
//        let destLat = destination.coordinate.latitude
//        let destLong = destination.coordinate.longitude
//        let urlString = "\(service)?origin=\(originLat),\(originLong)&destination=\(destLat),\(destLong)&mode=driving&units=metric&sensor=true&key=<YOUR_KEY>"
        let directionsURL = NSURL(string: urlString)
        
        let request = NSMutableURLRequest(URL: directionsURL!)
        
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

//        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
//        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        

        
        manager.GET(urlString, parameters: nil, progress:nil, success: { (dataTask, responseObject) -> Void in
            print("Reponse Object: \(responseObject)")
            
            if let result = responseObject as? NSDictionary {
                if let routes = result["routes"] as? [NSDictionary] {
                    if let lines = routes[0]["overview_polyline"] as? NSDictionary {
                        if let points = lines["points"] as? String {
                            let path = GMSPath(fromEncodedPath: points)
                            let distance = GMSGeometryLength(path)
                            print("wow \(distance / 1000) KM")
                            
                        }
                    }
                }
            }

            }, failure: { (dataTask, error) -> Void in
                print("Error: \(error.localizedDescription)")
        })

        
//        let operation = AFHTTPRequestOperation(request: request)
//        operation.responseSerializer = AFJSONResponseSerializer()
        
//        operation.setCompletionBlockWithSuccess({ (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
//            
//            if let result = responseObject as? NSDictionary {
//                if let routes = result["routes"] as? [NSDictionary] {
//                    if let lines = routes[0]["overview_polyline"] as? NSDictionary {
//                        if let points = lines["points"] as? String {
//                            let path = GMSPath(fromEncodedPath: points)
//                            let distance = GMSGeometryLength(path)
//                            print("wow \(distance / 1000) KM")
//                            
//                        }
//                    }
//                }
//            }
//            }) { (operation: AFHTTPRequestOperation!, error: NSError!)  -> Void in
//                print("\(error)")
//        }
//        
//        operation.start()
        
    }
}