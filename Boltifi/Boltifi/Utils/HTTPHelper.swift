//
//  HTTPHelper.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import UIKit

class HTTPHelper: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    
    typealias CallbackBlock = (result: String, error: String?) -> ()
    var callback: CallbackBlock = {
        (resultString, error) -> Void in
        if error == nil {
            print(resultString)
        } else {
            print(error)
        }
    }
    
    func httpGet(request: NSMutableURLRequest!, callback: (AnyObject,
        AnyObject?) -> Void) {
            var configuration =
            NSURLSessionConfiguration.defaultSessionConfiguration()
            var session = NSURLSession(configuration: configuration,
                delegate: self,
                delegateQueue:NSOperationQueue.mainQueue())
//            var task = session.dataTaskWithRequest(request) {
//                (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//                if (error == nil) {
//                    var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
//                    let dictResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as AnyObject?
//                    
//                    callback(dictResult!, nil)
//                }
//                else {
//                    
//                    callback("", error.localizedDescription)
//
//                }
//            }

            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                if (error == nil) {
                    var strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                    let dictResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: NSError) as AnyObject?
//                    let dictResult:AnyObject = NSJSONSerialization.JSONObjectWithData(data!,
//                        options: NSJSONReadingOptions.MutableContainers)
                    
                    callback(strData!, nil)
                }
                else {
                    
                    callback("", error!.localizedDescription)
                    
                }

//                
//                if(error != nil) {
//                    print("Error: \(error?.localizedDescription)")
//                }
////                if(data != nil) {
////                    print("Data: \(data)")
////                }
//                if(response != nil) {
//                    print("response: \(response)")
//                }
                
                
            });
            
            task.resume()
    }
    
//    func httpPost(request: NSMutableURLRequest,dictParams: NSDictionary!,callback:(AnyObject, AnyObject?)->Void){
//        
//        
//        request.HTTPMethod = "POST"
//        var err: NSError?
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dictParams, options: nil, error: &err)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        var configuration =
//        NSURLSessionConfiguration.defaultSessionConfiguration()
//        var session = NSURLSession(configuration: configuration,
//            delegate: self,
//            delegateQueue:NSOperationQueue.mainQueue())
//        var task = session.dataTaskWithRequest(request){
//            (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//            if (error == nil) {
//                var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
//                let dictResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as AnyObject?
//                
//                callback(dictResult!, nil)
//            }
//            else {
//                
//                var dict :  AnyObject = error.localizedDescription
//                
//                callback("", error.localizedDescription)
//            }
//
//        }
//        task.resume()
//    }
    
    
//    func URLSession(session: NSURLSession,
//        didReceiveChallenge challenge:
//        NSURLAuthenticationChallenge,
//        completionHandler:
//        (NSURLSessionAuthChallengeDisposition,
//        NSURLCredential!) -> Void) {
//            completionHandler(
//                NSURLSessionAuthChallengeDisposition.UseCredential,
//                NSURLCredential(forTrust:
//                    challenge.protectionSpace.serverTrust))
//    }
//    
//    func URLSession(session: NSURLSession,
//        task: NSURLSessionTask,
//        willPerformHTTPRedirection response:
//        NSHTTPURLResponse,
//        newRequest request: NSURLRequest,
//        completionHandler: (NSURLRequest!) -> Void) {
//            var newRequest : NSURLRequest? = request
//            print(newRequest?.description);
//            completionHandler(newRequest)
//    }
}
