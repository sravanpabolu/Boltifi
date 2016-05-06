//
//  LoginViewController.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var vwUserCredentials: UIView!
    
    let styleObj = CPStylist()
    
    @IBAction func loginBtnTapped(sender: AnyObject) {
        
        if (txtPassword.text == nil || txtEmailAddress.text == nil ||
            txtPassword.text!.isEmpty || txtEmailAddress.text!.isEmpty
            ) {
                print(ERROR_MANDATORY_EMPTY_FIELD)
                self.showAlertWithText(ERROR_MANDATORY_EMPTY_FIELD)
            return
        }
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_HOME_VIEW_CONTROLLER) as! HomeViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - TextField Delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vwUserCredentials.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.vwUserCredentials.layer.borderWidth = 1
        self.vwUserCredentials.layer.cornerRadius = 10
        
        styleObj.applyStyle(CPStylist.MyStylesheet.UserNameViewStyle, view:self.txtEmailAddress) //for image on the left side
        styleObj.applyStyle(CPStylist.MyStylesheet.PasswordViewStyle, view:self.txtPassword) //for image on the left side
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: self.txtEmailAddress) //for underline
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
