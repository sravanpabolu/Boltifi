//
//  ContactUsViewController.swift
//  Boltifi
//
//  Created by Sravan on 07/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class ContactUsViewController:BaseViewController {
    
    @IBOutlet weak var btnGlobalMenu: UIButton!
    @IBAction func globalMenuBtnTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}