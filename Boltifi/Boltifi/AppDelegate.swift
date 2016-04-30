//
//  AppDelegate.swift
//  Boltifi
//
//  Created by Sravan on 29/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if(!(NSUserDefaults.standardUserDefaults().boolForKey(KEY_APP_LAUNCH_FIRST_TIME))) {
            //Set first time launch
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: KEY_APP_LAUNCH_FIRST_TIME)
            NSUserDefaults.standardUserDefaults().synchronize()
           
            //Show Registration Screen
            // Access the storyboard and fetch an instance of the view controller
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            var viewController: RegistrationViewController = storyboard.instantiateViewControllerWithIdentifier("RegistrationViewController") as! RegistrationViewController

            // Then push that view controller onto the navigation stack
            var rootViewController = self.window!.rootViewController as! UINavigationController
            rootViewController.pushViewController(viewController, animated: true)
        } else {
            //Show Login Screen
            // Access the storyboard and fetch an instance of the view controller
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            var viewController: LoginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            
            // Then push that view controller onto the navigation stack
            var rootViewController = self.window!.rootViewController as! UINavigationController
            rootViewController.pushViewController(viewController, animated: true)
        }
        
        
        //For Google Maps
        GMSServices.provideAPIKey(GOOGLE_MAPS_API_KEY)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

