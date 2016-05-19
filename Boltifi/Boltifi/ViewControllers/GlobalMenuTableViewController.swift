//
//  GlobalMenuTableViewController.swift
//  Boltifi
//
//  Created by Sravan on 06/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

class GlobalMenuTableViewController: UITableViewController {

    let identifier: String = "tableCell"

    var arrGlobalMenuItems = ["HOME", "SEE HOW IT WORKS", "ABOUT", "CONTACT US", "LOGOUT"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGlobalMenuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: GlobalMenuCustomCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? GlobalMenuCustomCell
        
        if cell == nil {
            cell = GlobalMenuCustomCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        cell.menuTitleLabel?.text = arrGlobalMenuItems[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let selectedOption = GlobalMenuOptions(rawValue: indexPath.row) {
            switch selectedOption
            {
            case .Home:
                let newFrontViewController = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_HOME_VIEW_CONTROLLER) as? HomeViewController
                let newNavigationController = UINavigationController(rootViewController: newFrontViewController!)
                self.revealViewController().pushFrontViewController(newNavigationController, animated: true)

            case .SeeHowItWorks:
                let newFrontViewController = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_SEE_HOW_IT_WORKS_VIEW_CONTROLLER) as? SeeHowItWorksViewController
                let newNavigationController = UINavigationController(rootViewController: newFrontViewController!)
                self.revealViewController().pushFrontViewController(newNavigationController, animated: true)
                
            case .About:
                let newFrontViewController = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_ABOUT_VIEW_CONTROLLER) as? AboutViewController
                let newNavigationController = UINavigationController(rootViewController: newFrontViewController!)
                self.revealViewController().pushFrontViewController(newNavigationController, animated: true)
                
            case .ContactUs:
             let newFrontViewController = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_CONTACT_US_VIEW_CONTROLLER) as? ContactUsViewController
                let newNavigationController = UINavigationController(rootViewController: newFrontViewController!)
                self.revealViewController().pushFrontViewController(newNavigationController, animated: true)
                
            case .Logout:
                let newFrontViewController = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_ABOUT_VIEW_CONTROLLER) as? AboutViewController
                let newNavigationController = UINavigationController(rootViewController: newFrontViewController!)
                self.revealViewController().pushFrontViewController(newNavigationController, animated: true)
            }
        }
    }
}