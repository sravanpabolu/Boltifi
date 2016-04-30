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
        if(!self.validateTextFields()) {
            return
        }
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewController") as! MapViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnDriverTapped(sender: AnyObject) {
        if(!self.validateTextFields()) {
            return
        }
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    //MARK: - TextField Delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField == self.txtEmail) {
            if(Utils.isValidEmail(textField.text)) {
                println("Valid Email") ;
            } else {
                println("Invalid Email") ;
            }
        }
    }
    
    func validateTextFields() -> Bool {
        //Check for empty string 
        if (self.txtName.text.isEmpty ||
            self.txtPassword.text.isEmpty ||
            self.txtEmail.text.isEmpty ||
            self.txtConfirmPassword.text.isEmpty ||
            self.txtMobile.text.isEmpty
            ) {
                println(ERROR_MANDATORY_EMPTY_FIELD)
                self.showAlertWithText(ERROR_MANDATORY_EMPTY_FIELD)
                return false
        }
        
        if (self.txtPassword.text != self.txtConfirmPassword.text) {
            println(ERROR_PASSWORDS_NO_MATCH)
            self.showAlertWithText(ERROR_PASSWORDS_NO_MATCH)
            return false
        }
        
        return true
    }
    

    
    
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}