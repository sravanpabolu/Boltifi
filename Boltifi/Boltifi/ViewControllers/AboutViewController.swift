//
//  AboutViewController.swift
//  Boltifi
//
//  Created by Sravan on 03/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController:BaseViewController {
    
    @IBOutlet weak var btnGlobalMenu: UIButton!
    @IBAction func globalMenuBtnTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}