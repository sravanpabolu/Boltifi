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
        let distanceRequest = WebServiceManager()
        
        //TODO: Add validations to text fields
        
        distanceRequest.distanceBetweenAreas(self.txtPickupLocation.text!, toArea: self.txtDropLocation.text!)
        
//        self.showAlertWithTextButtons(ALERT_FARE_ESTIMATE_TEXT, okBtnText: ALERT_BUTTON_OK, cancelBtnText: ALERT_BUTTON_CANCEL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

