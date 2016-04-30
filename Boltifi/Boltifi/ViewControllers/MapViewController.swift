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
    
    var originMarker: GMSMarker!
    
    var destinationMarker: GMSMarker!
    
    var routePolyline: GMSPolyline!
    
    var markersArray: Array<GMSMarker> = []
    
    var waypointsArray: Array<String> = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 8.0)
        mapView.camera = camera
        mapView.delegate = self
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as! CLLocation
            mapView.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            mapView.settings.myLocationButton = true
            
            didFindMyLocation = true
        }
    }

    // MARK: CLLocationManagerDelegate method implementation
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.myLocationEnabled = true
        }
    }
    
    
    // MARK: Custom method implementation
    
    func showAlertWithMessage(message: String) {
        let alertController = UIAlertController(title: "GMapsDemo", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let closeAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        alertController.addAction(closeAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
        if locationMarker != nil {
            locationMarker.map = nil
        }
        
        locationMarker = GMSMarker(position: coordinate)
        locationMarker.map = mapView
        
        locationMarker.title = "nirosha"
        locationMarker.appearAnimation = kGMSMarkerAnimationPop
        locationMarker.icon = GMSMarker.markerImageWithColor(UIColor.blueColor())
        locationMarker.opacity = 0.75
        
        locationMarker.flat = true
        locationMarker.snippet = "The best place on earth."
    }
    


}