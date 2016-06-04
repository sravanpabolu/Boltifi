//
//  FareEstimateViewController.swift
//  Boltifi
//
//  Created by Sravan on 01/05/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation

class FareEstimateViewController: BaseViewController {
    
    @IBOutlet weak var btnEstimateFare: UIButton!
    @IBOutlet weak var btnGlobalMenu: UIButton!
    @IBOutlet weak var txtDropLocation: UITextField!
    @IBOutlet weak var txtPickupLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Styling
        self.applyStyles()
    }
    
    //MARK: - Private Methods
    func applyStyles() {
        //TODO: Apply styles for text fields
        styleObj.applyStyle(CPStylist.MyStylesheet.ButtonStyle, view: self.btnEstimateFare)
    }
    
    //MARK: - Button Action Methods
    @IBAction func btnGlobalMenuTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    @IBAction func btnEstimateFareTapped(sender: AnyObject) {
        if(!self.validateTextFields()) {
            return
        }

        let distanceRequest = WebServiceManager()
        
        //TODO: Add validations to text fields
        
        self.showActivityIndicator(self.view, message: MSG_LOADING)
        distanceRequest.distanceBetweenAreas(
            fromArea: self.txtPickupLocation.text!,
            toArea: self.txtDropLocation.text!,
            webServiceCallBack: { (result, error) -> () in
                
                if error == nil {
                    let status = result!["status"] as! NSString
                    if status.isEqualToString(RESP_ZERO_RESULTS) {
                        self.showAlertWithText(alertTitle: ALERT_TITLE, alertText: ALERT_NO_RESULTS)
                    } else if status.isEqualToString(RESP_OK) {
                        if let routes = result!["routes"] as? [NSDictionary] {
                            if let lines = routes[0]["overview_polyline"] as? NSDictionary {
                                if let points = lines["points"] as? String {
                                    let path = GMSPath(fromEncodedPath: points)
                                    let distance = GMSGeometryLength(path)
                                    self.showAlertWithCalculatedDistance(distance)
                                }
                            }
                        }
                    } else {
                        self.showAlertWithText(alertTitle: ALERT_ERROR_TITLE, alertText: MSG_TRY_AGAIN)
                    }
                } else {
                    //To remove optional() from logs, we need to use this if let
                    if let errorDescription = String?(error!) {
                        self.showAlertWithText(alertTitle: ALERT_ERROR_TITLE, alertText: "Error: \(errorDescription)")
                    }
                }
                
                self.hideActivityIndicator(self.view)
        }
        )
    }
    
    func showAlertWithCalculatedDistance(calculatedDistance: Double) {
        self.hideActivityIndicator(self.view)
        let alertText = "Distance: \(calculatedDistance).\n" + ALERT_FARE_ESTIMATE_TEXT + ALERT_CONTINUE_TEXT
        self.showAlertWithTextButtons(alertText, okBtnText: ALERT_BUTTON_OK, cancelBtnText: ALERT_BUTTON_CANCEL)
    }
    
    func validateTextFields() -> Bool {
        //Check for empty string
        if (self.txtPickupLocation.text!.isEmpty || self.txtDropLocation.text!.isEmpty
            ) {
                self.showAlertWithText(alertTitle: ALERT_TITLE, alertText: ERROR_MANDATORY_EMPTY_FIELD)
                return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

