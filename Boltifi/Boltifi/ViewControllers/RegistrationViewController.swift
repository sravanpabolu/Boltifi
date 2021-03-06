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
    @IBOutlet weak var btnGlobalMenu: UIButton!
    @IBOutlet weak var underlineView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    //MARK: - Button action methods
    @IBAction func btnSenderTapped(sender: AnyObject) {
        
        if(!self.validateTextFields()) {
            return
        }

        self.showActivityIndicator(self.view, message: MSG_REGISTRATION)
        
        let registrationWebService: WebServiceManager = WebServiceManager()
        registrationWebService.registerUser(
            name: self.txtName.text!,
            email: self.txtEmail.text!,
            mobileNumber: self.txtMobile.text!,
            password: self.txtPassword.text!,
            userType: "Sender",
            webServiceCallBack: { (result, error) -> () in
                
                if error == nil {
                    self.navigateToNextScreen()
                } else {
                    self.showAlertWithText(alertTitle: ALERT_ERROR_TITLE, alertText: "Error: \(error)")
                }
                
                self.hideActivityIndicator(self.view)
            }
        )
    }
    
    func navigateToNextScreen() {
        self.hideActivityIndicator(self.view)
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_HOME_VIEW_CONTROLLER) as! HomeViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnDriverTapped(sender: AnyObject) {
        if(!self.validateTextFields()) {
            return
        }
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_LOGIN_VIEW_CONTROLLER) as! LoginViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnGlobalMenuTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    
    //MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.view.backgroundColor = UIColor.whiteColor()
        self.applyStyles()
    }
    
    //MARK: - Private Methods
    func applyStyles() {
        styleObj.applyStyle(CPStylist.MyStylesheet.ButtonStyle, view: self.btnDriver)
        styleObj.applyStyle(CPStylist.MyStylesheet.ButtonStyle, view: self.btnSender)
        styleObj.applyStyle(CPStylist.MyStylesheet.ContentViewStyle, view: contentView)
        self.underlineView.backgroundColor = UNDERLINE_COLOR
    }
    
    //MARK: - TextField Delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField == self.txtEmail) {
            if(Utils.isValidEmail(textField.text!)) {
                DLog("Valid Email") ;
            } else {
                DLog("Invalid Email") ;
            }
        }
    }
    
    func validateTextFields() -> Bool {
        //Check for empty string 
        if (self.txtName.text!.isEmpty ||
            self.txtPassword.text!.isEmpty ||
            self.txtEmail.text!.isEmpty ||
            self.txtConfirmPassword.text!.isEmpty ||
            self.txtMobile.text!.isEmpty
            ) {
                self.showAlertWithText(alertTitle: ALERT_TITLE, alertText: ERROR_MANDATORY_EMPTY_FIELD)
                return false
        }
        
        if (self.txtPassword.text != self.txtConfirmPassword.text) {
            self.showAlertWithText(alertTitle: ALERT_TITLE, alertText: ERROR_PASSWORDS_NO_MATCH)
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