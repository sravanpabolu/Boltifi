//
//  ViewController.swift
//  Boltifi
//
//  Created by Sravan on 29/04/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import UIKit
import MBProgressHUD

//extension NSObject {
//    class func fromClassName(className : String) -> NSObject {
//        let className = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String + "." + className
//        let aClass = NSClassFromString(className) as! UIViewController.Type
//        return aClass.init()
//    }
//}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class BaseViewController: UIViewController {

    //MARK:- Variables & Constants
    let styleObj = CPStylist()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //For global menu
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Alert Methods
    func showAlertWithText(alertTitle alertTitle: String, alertText: String) {
        let alert = UIAlertController(title: alertTitle, message: alertText, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: ALERT_BUTTON_OK, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertWithTextButtons(alertText: NSString, okBtnText: String, cancelBtnText:String) {
        let alert = UIAlertController(title: ALERT_TITLE, message: alertText as String, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: okBtnText, style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: cancelBtnText, style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: Global Menu Methods
    func setUpGlobalMenu(button: UIButton) {
        if self.revealViewController() != nil {
            self.revealViewController().rightViewRevealOverdraw = 0
            button.addTarget(self.revealViewController(), action: "rightRevealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
    }
    
    //MARK: Activity Indicator Methods
    func showActivityIndicator(contentView: UIView, message: String!) {
        let hud = MBProgressHUD.showHUDAddedTo(contentView, animated: true)
        if(message == nil) {
            hud.labelText = MSG_LOADING
        } else {
            hud.labelText = message
        }
    }
    
    func hideActivityIndicator(contentView: UIView) {
        MBProgressHUD.hideAllHUDsForView(contentView, animated: true)
    }
    
    //TODO:
//    func navigateToViewController(identifier:String) {
//        
//        let aClass: AnyClass! = NSClassFromString(identifier)
//        
//        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(identifier as String) as! aClass
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
    
}

