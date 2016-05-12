//
//  SeeHowItWorksViewController.swift
//  Boltifi
//
//  Created by Sravan on 07/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class SeeHowItWorksViewController:BaseViewController {
    
    @IBOutlet weak var btnGlobalMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - btn action methods
    @IBAction func globalMenuBtnTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
}