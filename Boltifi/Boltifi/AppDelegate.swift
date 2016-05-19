//
//  AppDelegate.swift
//  Boltifi
//
//  Created by Sravan on 29/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SWRevealViewControllerDelegate {

    var window: UIWindow?
    var viewController = SWRevealViewController()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let window:UIWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window = window
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var frontVC:UIViewController
        
        if(!(NSUserDefaults.standardUserDefaults().boolForKey(KEY_APP_LAUNCH_FIRST_TIME))) {
            //Set first time launch
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: KEY_APP_LAUNCH_FIRST_TIME)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            //Show Registration Screen
            frontVC = storyboard.instantiateViewControllerWithIdentifier(IDENTIFIER_REGISTRATION_VIEW_CONTROLLER) as! RegistrationViewController
        } else {
            //Show Login Screen
            frontVC = storyboard.instantiateViewControllerWithIdentifier(IDENTIFIER_LOGIN_VIEW_CONTROLLER) as! LoginViewController
        }

        //TODO: Remove the following line
//        frontVC = storyboard.instantiateViewControllerWithIdentifier(IDENTIFIER_CONTACT_US_VIEW_CONTROLLER)
        let rearVC = storyboard.instantiateViewControllerWithIdentifier(IDENTIFIER_GLOBAL_MENU_TABLE_VIEW_CONTROLLER)
        
        let frontNavigationController   = UINavigationController(rootViewController: frontVC)
        let rearNavigationController    = UINavigationController(rootViewController: rearVC)
        
        let mainRevealController = SWRevealViewController(rearViewController: rearNavigationController,
            frontViewController: frontNavigationController)
        mainRevealController.rightViewController = rearVC
        
        mainRevealController.delegate = self
        
        self.viewController = mainRevealController;
        self.window!.rootViewController = self.viewController;
        self.window?.makeKeyAndVisible()

        
        
//        if(!(NSUserDefaults.standardUserDefaults().boolForKey(KEY_APP_LAUNCH_FIRST_TIME))) {
//            //Set first time launch
//            NSUserDefaults.standardUserDefaults().setBool(true, forKey: KEY_APP_LAUNCH_FIRST_TIME)
//            NSUserDefaults.standardUserDefaults().synchronize()
//           
//            //Show Registration Screen
//            // Access the storyboard and fetch an instance of the view controller
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController: RegistrationViewController = storyboard.instantiateViewControllerWithIdentifier("RegistrationViewController") as! RegistrationViewController
//
//            // Then push that view controller onto the navigation stack
//            let rootViewController = self.window!.rootViewController as! UINavigationController
//            rootViewController.pushViewController(viewController, animated: true)
//        } else {
//            //Show Login Screen
//            // Access the storyboard and fetch an instance of the view controller
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController: LoginViewController = storyboard.instantiateViewControllerWithIdentifier(IDENTIFIER_LOGIN_VIEW_CONTROLLER) as! LoginViewController
////              let viewController: CreditCardViewController = storyboard.instantiateViewControllerWithIdentifier(IDENTIFIER_CREDIT_CARD) as! CreditCardViewController
//            
//            // Then push that view controller onto the navigation stack
//            let rootViewController = self.window!.rootViewController as! UINavigationController
//            rootViewController.pushViewController(viewController, animated: true)
//        }
        
        
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

