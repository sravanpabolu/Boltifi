//
//  MapViewController.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit


class MapViewController : BaseViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    var locationMarker: GMSMarker!
    var seenError : Bool = false
    var locationFixAchieved : Bool = true
    var locationStatus : NSString = "Not Started"
    
    //MARK: - btn action methods
    
    @IBAction func smallBtnTapped(sender: AnyObject) {
    }
    
    @IBAction func mediumBtnTapped(sender: AnyObject) {
    }
    
    @IBAction func largeBtnTapped(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
//        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
//        }
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 0.0)
        mapView.camera = camera
        mapView.delegate = self
        
//        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)
        
        let coordinate = CLLocationCoordinate2D(latitude: 48.857165, longitude: 2.354613)
        
//        self.viewMap.camera = GMSCameraPosition.cameraWithTarget(coordinate, zoom: 14.0)
        
        self.setupLocationMarker(coordinate)
        
    }
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        application.setStatusBarHidden(true, withAnimation: .None)
        initializeLocationManager()
        return true
    }
    
    func initializeLocationManager() {
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        if (locationFixAchieved == false) {
            locationFixAchieved = true
            var locationArray = locations as NSArray
            var locationObj = locationArray.lastObject as! CLLocation
            var coord = locationObj.coordinate
            
            println(coord.latitude)
            println(coord.longitude)
//        }
    }
    
    // MARK: CLLocationManagerDelegate method implementation
    
    // authorization status
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            var shouldIAllow = false
            
            switch status {
            case CLAuthorizationStatus.Restricted:
                locationStatus = "Restricted Access to location"
            case CLAuthorizationStatus.Denied:
                locationStatus = "User denied access to location"
            case CLAuthorizationStatus.NotDetermined:
                locationStatus = "Status not determined"
            default:
                locationStatus = "Allowed to location Access"
                shouldIAllow = true
            }
            NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
            if (shouldIAllow == true) {
                NSLog("Location to Allowed")
                // Start location services
                locationManager.startUpdatingLocation()
            } else {
                NSLog("Denied access: \(locationStatus)")
            }
    }
    
    
    // MARK: Custom method implementation
    
//    func showAlertWithMessage(message: String) {
//        let alertController = UIAlertController(title: "GMapsDemo", message: message, preferredStyle: UIAlertControllerStyle.Alert)
//        
//        let closeAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
//            
//        }
//        
//        alertController.addAction(closeAction)
//        
//        presentViewController(alertController, animated: true, completion: nil)
//    }
    
    
    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
        if self.locationMarker != nil {
            self.locationMarker.map = nil
        }
        
        self.locationMarker = GMSMarker(position: coordinate)
        self.locationMarker.map = mapView
        
        self.locationMarker.title = PICK_UP_LOCATION
        self.locationMarker.appearAnimation = kGMSMarkerAnimationPop
        self.locationMarker.icon = GMSMarker.markerImageWithColor(UIColor.redColor())
        self.locationMarker.opacity = 0.75
        
        self.locationMarker.flat = true
        self.locationMarker.snippet = "The best place on earth."
    }
    
    
    
}