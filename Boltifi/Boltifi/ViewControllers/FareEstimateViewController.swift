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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Button Action Methods
    @IBAction func btnGlobalMenuTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    @IBAction func btnEstimateFareTapped(sender: AnyObject) {
        self.showAlertWithTextButtons(ALERT_FARE_ESTIMATE_TEXT, okBtnText: ALERT_BUTTON_OK, cancelBtnText: ALERT_BUTTON_CANCEL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

