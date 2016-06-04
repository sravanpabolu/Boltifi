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
    
    func httpGet(request: NSMutableURLRequest!, callback: (AnyObject,
        AnyObject?) -> Void) {
            DLog("Request URL: \(request.URL)");
            let configuration =
            NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: configuration,
                delegate: self,
                delegateQueue:NSOperationQueue.mainQueue())
            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                if (error == nil) {
                    let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    DLog("respose: \(response)")
                    callback(strData!, nil)
                }
                else {
                    DLog("Error: \(error)")
                    callback("", error!.localizedDescription)
                    
                }
            });
            
            task.resume()
    }
}
