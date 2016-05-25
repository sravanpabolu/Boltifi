//
//  LoginViewController.swift
//  Boltifi
//
//  Created by Sravan on 30/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : BaseViewController{
    
    //MARK:- Properties
    
    //UIViews
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var underlineImage: UIImageView!
    @IBOutlet weak var underline1: UIImageView!
    
    //UITextFields
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    
    //UIButtons
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var btnGlobalMenu: UIButton!
    
   // @IBOutlet weak var vwUserCredentials: UIView!
    
    
    
   //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
    }
    override func viewWillAppear(animated: Bool) {
        
        //Styling
        self.applyStyles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Button Actions
    @IBAction func btnGlobalMenuTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    @IBAction func loginBtnTapped(sender: AnyObject) {
        
//        if (txtPassword.text == nil || txtEmailAddress.text == nil ||
//            txtPassword.text!.isEmpty || txtEmailAddress.text!.isEmpty
//            ) {
//                print(ERROR_MANDATORY_EMPTY_FIELD)
//                self.showAlertWithText(ERROR_MANDATORY_EMPTY_FIELD)
//                return
//        }

        let webService: WebServiceManager = WebServiceManager()
        webService.loginUser(self.txtEmailAddress.text!, password: self.txtPassword.text!)
        
//        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_HOME_VIEW_CONTROLLER) as! HomeViewController
//        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    @IBAction func signUp(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_REGISTRATION_VIEW_CONTROLLER) as! RegistrationViewController
        self.navigationController?.pushViewController(controller, animated: true )
    }
    
    // MARK:- TextField Delegates
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:- Private Methods
    
    func applyStyles()
    {
        
        styleObj.applyStyle(CPStylist.MyStylesheet.EmailPaddingStyle, view:self.txtEmailAddress) //for image on the left side
        styleObj.applyStyle(CPStylist.MyStylesheet.PasswordPaddingStyle, view:self.txtPassword) //for image on the left side
//        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: self.txtEmailAddress) //for underline
        
        
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: txtEmailAddress)
        styleObj.applyStyle(CPStylist.MyStylesheet.EmailPaddingStyle, view: txtEmailAddress)
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: txtPassword)
        styleObj.applyStyle(CPStylist.MyStylesheet.PasswordPaddingStyle, view: txtPassword)
        styleObj.applyStyle(CPStylist.MyStylesheet.ContentViewStyle, view: contentView)
        styleObj.applyStyle(CPStylist.MyStylesheet.ButtonStyle, view: signInButton)

        
        underlineImage.backgroundColor = UNDERLINE_COLOR
        underline1.backgroundColor = UNDERLINE_COLOR
//        signUpButton.setTitleColor(UIColor(rgb: 0x4A4A4A), forState: UIControlState.Normal)
//        forgotPasswordButton.setTitleColor(UIColor(rgb: 0x4A4A4A), forState: UIControlState.Normal)
//        signInButton.backgroundColor = UIColor.orangeColor()
//
    }
   
    
}




    
    





