//
//  CreditCardViewController.swift
//  Boltifi
//
//  Created by Sravan on 07/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import UIKit

class CreditCardViewController: BaseViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    //MARK:- Properties
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var nameOnCreditCard: UITextField!
    @IBOutlet weak var underlineImage: UIImageView!
    @IBOutlet weak var btnGlobalMenu: UIButton!
    
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //Styling
        self.applyStyles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button Action Methods
    @IBAction func btnGlobalMenuTapped(sender: AnyObject) {
        self.setUpGlobalMenu(self.btnGlobalMenu)
    }
    
    // MARK:- TextField Delegates
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:- Actions
    @IBAction func back(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func save(sender: AnyObject) {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_LOGIN_VIEW_CONTROLLER) as! LoginViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func skip(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_LOGIN_VIEW_CONTROLLER) as! LoginViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    //MARK:- Private Methods
    func applyStyles() {
        //Styling
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: creditCard)
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: year)
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: month)
        styleObj.applyStyle(CPStylist.MyStylesheet.TextFieldStyle, view: nameOnCreditCard)
        
        styleObj.applyStyle(CPStylist.MyStylesheet.ContentViewStyle, view: contentView)
        
        btnSkip.setTitleColor(UIColor(rgb: 0x4A4A4A), forState: UIControlState.Normal)
        termsButton.setTitleColor(UIColor(rgb: 0x8AC98F), forState: UIControlState.Normal)
        
        btnSave.layer.cornerRadius = 5
        btnSkip.layer.cornerRadius = 5
        
        underlineImage.backgroundColor = UNDERLINE_COLOR
        
        btnSave.backgroundColor = UIColor.orangeColor()
        
    }
    
    
    
    
}
