//
//  LoginViewController.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : BaseViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    
    @IBAction func loginBtnTapped(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewController") as! MapViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
