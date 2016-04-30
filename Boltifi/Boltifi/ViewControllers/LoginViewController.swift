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
    
    @IBAction func loginBtnTapped(sender: AnyObject) {
        
        if (txtPassword.text == nil || txtEmailAddress.text == nil ||
            txtPassword.text.isEmpty || txtEmailAddress.text.isEmpty
            ) {
                println(ERROR_MANDATORY_EMPTY_FIELD)
            return
        }
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewController") as! MapViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - TextField Delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
