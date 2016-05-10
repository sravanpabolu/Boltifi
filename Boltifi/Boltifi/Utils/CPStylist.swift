//
//  CPStylist.swift
//  Boltifi
//
//  Created by Sravan on 02/05/16.
//  Copyright (c) 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class CPStylist{
    
    
    enum MyStylesheet
    {
        case TextFieldStyle
        case EmailPaddingStyle
        case PasswordPaddingStyle
        case YesNoToggleButtonStyle
        case RadioButtonStyle
        case BarcodePaddingStyle
        case RadioDisableButtonStyle
        case ArrowButtonStyle
        case TimerButtonStyle
        case OnOffButtonStyle
        case TimerPaddingStyle
        case OffOnButtonStyle
        case ContentViewStyle
        
        case SubmitButtonStyle
        case UserNameViewStyle
        case PasswordViewStyle
    }

    func applyStyle(style: MyStylesheet, view:UIView)
    {
        switch style
        {

        case .TextFieldStyle :
            var border = CALayer()
            border.borderColor = UNDERLINE_COLOR.CGColor //UIColor.lightGrayColor().CGColor
            border.borderWidth = 1
           // border.frame = CGRect(x: 0, y: view.frame.size.height - 1, width:1000, height: 1)
             border.frame = CGRect(x: 0, y: 43, width:1000, height: 1)
            view.layer.addSublayer(border)
            
        case  .EmailPaddingStyle :
            let textField = view as? UITextField
            var paddingView: UIImageView!
            paddingView = UIImageView(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
            paddingView.image = UIImage(named: "User.png")
            textField?.rightView = paddingView
            textField?.rightViewMode = .Always
            
        case .SubmitButtonStyle :
            let button = view as? UIButton
            button?.layer.cornerRadius = 10
            button?.backgroundColor = UIColor.orangeColor()
            button?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
        case  .PasswordPaddingStyle :
            let textField = view as? UITextField
            var paddingView: UIImageView!
            paddingView = UIImageView(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
            paddingView.image = UIImage(named: "Password-1.png")
            textField?.rightView = paddingView
            textField?.rightViewMode = .Always
            
        case  .TimerPaddingStyle :
            let textField = view as? UITextField
            var paddingView: UIImageView!
            paddingView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
            paddingView.image = UIImage(named: "username.png")
           // textField?.backgroundColor = ACCESSORY_DARK_VIEW_COLOR
            textField?.leftView = paddingView
            textField?.leftViewMode = .Always
            
        case .UserNameViewStyle:
            let textField = view as? UITextField
            var paddingView: UIImageView!
            paddingView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
            paddingView.image = UIImage(named: "username.png")
            // textField?.backgroundColor = ACCESSORY_DARK_VIEW_COLOR
            textField?.leftView = paddingView
            textField?.leftViewMode = .Always
            
        case .PasswordViewStyle:
            let textField = view as? UITextField
            var paddingView: UIImageView!
            paddingView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
            paddingView.image = UIImage(named: "password.png")
            // textField?.backgroundColor = ACCESSORY_DARK_VIEW_COLOR
            textField?.leftView = paddingView
            textField?.leftViewMode = .Always
            
        case  .BarcodePaddingStyle :
            let textField = view as? UITextField
            var barcodeButton: UIButton!
            barcodeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
            let normalImage = UIImage(named: "BarCode.png")
            barcodeButton?.setImage(normalImage, forState: UIControlState.Normal)
            textField?.rightView = barcodeButton
            textField?.rightViewMode = .Always
            
        case .YesNoToggleButtonStyle:
            let button = view as? UIButton
            let normalImage = UIImage(named: "No.png")
            let selectedImage = UIImage(named: "Yes.png")
             button?.setImage(normalImage, forState: UIControlState.Normal)
             button?.setImage(selectedImage, forState: UIControlState.Selected)
            
        case .RadioButtonStyle:
            let button = view as? UIButton
           // let normalImage = UIImage(named: "RB_Disable.png")
            let selectedImage = UIImage(named: "RB_Enable.png")
           // button?.setImage(normalImage, forState: UIControlState.Normal)
            button?.setImage(selectedImage, forState: UIControlState.Selected)
            
        case .RadioDisableButtonStyle:
            let button = view as? UIButton
            let normalImage = UIImage(named: "RB_Disable.png")
           // let selectedImage = UIImage(named: "RB_Enable.png")
            button?.setImage(normalImage, forState: UIControlState.Normal)
           // button?.setImage(selectedImage, forState: UIControlState.Selected)

        case .ArrowButtonStyle:
            let button = view as? UIButton
            let normalImage = UIImage(named: "Down-Arrow.png")
            let selectedImage = UIImage(named: "Up-Arrow.png")
            button?.setImage(normalImage, forState: UIControlState.Normal)
            button?.setImage(selectedImage, forState: UIControlState.Selected)
            
        case .TimerButtonStyle:
             let button = view as? UIButton
             button?.backgroundColor = NAVIGATION_BAR_COLOR
             button?.layer.cornerRadius = 12
            
        case .OnOffButtonStyle:
            let button = view as? UIButton
            let normalImage = UIImage(named: "On_iPhone.png")
            let selectedImage = UIImage(named: "Off_iPhone.png")
            button?.setImage(normalImage, forState: UIControlState.Normal)
            button?.setImage(selectedImage, forState: UIControlState.Selected)
            
        case .OffOnButtonStyle:
            let button = view as? UIButton
            let normalImage = UIImage(named: "Off_iPhone.png")
            let selectedImage = UIImage(named: "On_iPhone.png")
            button?.setImage(normalImage, forState: UIControlState.Normal)
            button?.setImage(selectedImage, forState: UIControlState.Selected)
            
        case .ContentViewStyle:
            
            view.layer.cornerRadius = 5
            view.layer.shadowColor =  UIColor(rgb: 0x717171).CGColor;
            view.layer.shadowOffset = CGSize(width: 0, height: 3)
            view.layer.shadowOpacity = 0.7
            view.layer.shadowRadius = 2
        
        }
    }
    
}