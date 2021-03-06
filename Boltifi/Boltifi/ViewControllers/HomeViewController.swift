//
//  HomeViewController.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController : BaseViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var btnGlobalMenu: UIButton!
    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    var locationMarker: GMSMarker!
    var seenError : Bool = false
    var locationFixAchieved : Bool = true
    var locationStatus : NSString = "Not Started"
    
    //MARK: - btn action methods
    @IBAction func globalMenuBtnTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    @IBAction func btnUserHeaderTapped(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_CREDITCARD_VIEW_CONTROLLER) as! CreditCardViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        var sliderImage:UIImage
        if self.slider.value < 1 {
            sliderImage = UIImage(named: "bike")!
        } else if self.slider.value > 1 && self.slider.value < 2 {
            sliderImage = UIImage(named: "van")!
        } else {
            sliderImage = UIImage(named: "truck")!
        }
        
//        DLog("\(sender.frame)")
//        let thumbImageWidth:CGFloat = 64
//        let thumbImageCenter:CGFloat = self.xPositionFromSliderValue(self.slider) - (thumbImageWidth/2)        
//        let center = self.xPositionFromSliderValue(self.slider)
//        DLog("\(self.slider.value) ==== \(center) ==== \(thumbImageCenter)"  )
        
        self.slider.setThumbImage(sliderImage, forState: UIControlState.Normal)
    }
    
    func xPositionFromSliderValue(aSlider:UISlider) -> CGFloat {
        let sliderRange:CGFloat = aSlider.frame.size.width - aSlider.currentThumbImage!.size.width;
        let sliderOrigin:CGFloat = aSlider.frame.origin.x + (aSlider.currentThumbImage!.size.width / 2.0);
        
        let sliderValueToPixels:CGFloat = (CGFloat((aSlider.value - aSlider.minimumValue)/(aSlider.maximumValue - aSlider.minimumValue)) * sliderRange) + sliderOrigin;
        
        return sliderValueToPixels;
    }
    
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let SLIDER_BG_IMAGE = "grayhorizontallinebg" //"horizontal_double_line" 
        
        //Setup Slider
        self.slider.minimumValue = 0
        self.slider.maximumValue = 2
        self.slider.value = 0 //Default value
        self.slider.setThumbImage(UIImage(named: "bike"), forState: UIControlState.Normal)
        self.slider.setMinimumTrackImage(UIImage(named: SLIDER_BG_IMAGE), forState: UIControlState.Normal)
        self.slider.setMaximumTrackImage(UIImage(named: SLIDER_BG_IMAGE), forState: UIControlState.Normal)
        

        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
//        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
//        }
        
//        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 0.0)
//        self.mapView.camera = camera
        self.mapView.delegate = self

        self.mapView.myLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        
//        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)
        
        let coordinate = CLLocationCoordinate2D(latitude: 48.857165, longitude: 2.354613)
        
        self.mapView.camera = GMSCameraPosition.cameraWithTarget(coordinate, zoom: 14.0)
        
        self.setupLocationMarker(coordinate)
        
    }
    
    
    
    
    //TODO: Verify these methods
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
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if (locationFixAchieved == false) {
            locationFixAchieved = true
            let locationArray = locations as NSArray
            let locationObj = locationArray.lastObject as! CLLocation
            var coord = locationObj.coordinate
            
//            DLogln(coord.latitude)
//            DLogln(coord.longitude)
//        }
    }
    
    // MARK: - CLLocationManagerDelegate method implementation
    
    // authorization status
    func locationManager(manager: CLLocationManager,
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
                NSLog("\(__FUNCTION__) Location to Allowed")
                // Start location services
                locationManager.startUpdatingLocation()
            } else {
                NSLog("\(__FUNCTION__) Denied access: \(locationStatus)")
            }
    }
    
    
    // MARK: - Custom method implementation
    
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
        self.locationMarker.icon = GMSMarker.markerImageWithColor(UIColor.orangeColor())
        self.locationMarker.appearAnimation = kGMSMarkerAnimationPop
        self.locationMarker.icon = GMSMarker.markerImageWithColor(UIColor.redColor())
        self.locationMarker.opacity = 0.75
        
        self.locationMarker.flat = true
//        self.locationMarker.snippet = "The best place on earth."
    }

    func didTapMyLocationButtonForMapView(mapView: GMSMapView!) -> Bool {
        DLog("Current location button : \(__FUNCTION__)")
        return true
    }
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        DLog(__FUNCTION__)
        self.showFareEstimateView()
    }
    
    func showFareEstimateView() {
        DLog(__FUNCTION__)
//        self.buttonsView.hidden = true
//        self.fareEstimateView.hidden = false

        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_FARE_ESTIMATE_VIEW_CONTROLLER) as? FareEstimateViewController
        self.navigationController?.pushViewController(controller!, animated: true)

    }
    
//    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
//        DLogln(__FUNCTION__)
//        
////        self.locationMarker = GMSMarker(position: coordinate)
////        marker.map = mapView
//        
//        
//        
//        marker.title = PICK_UP_LOCATION
//        marker.appearAnimation = kGMSMarkerAnimationPop
//        marker.icon = GMSMarker.markerImageWithColor(UIColor.redColor())
//        marker.opacity = 0.75
//        
//        marker.flat = true
//        marker.snippet = "The best place on earth."
//        
//        return true
//    }
    
    func mapView(mapView: GMSMapView!, didTapOverlay overlay: GMSOverlay!) {
        DLog(__FUNCTION__)
    }
    
//    func mapView(mapView: GMSMapView!, markerInfoContents marker: GMSMarker!) -> UIView! {
//        DLogln(__FUNCTION__)
//    }
//    
//    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
//        DLogln(__FUNCTION__)
//    }
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        DLog(__FUNCTION__)
    }

}