//
//  RegistrationViewController.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController : BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnSender: UIButton!
    @IBOutlet weak var btnDriver: UIButton!
    
    //MARK: - Button action methods
    @IBAction func btnSenderTapped(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewController") as! MapViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnDriverTapped(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("loginViewController") as! LoginViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - TextField Delegate methods
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField == self.txtEmail) {
            if(Utils.isValidEmail(textField.text)) {
                println("Valid Email") ;
            } else {
                println("Invalid Email") ;
            }
        }
    }
    
    
    
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}