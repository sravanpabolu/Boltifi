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
    
//    @IBOutlet weak var tblGlobalMenu: UITableView!
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
        cell.menuTitleLabel?.text = arrGlobalMenuItems[indexPath.row] as? String
//        cell.menuTitleLabel?.text = "abcdserewrewrewfref" as String//arrGlobalMenuItems[indexPath.row] as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
//        let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("AboutViewController") as? AboutViewController
//        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        
//        let revealController:SWRevealViewController = revealViewController()
        
        switch indexPath.row {
        case 0 : //Home
            let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_HOME_VIEW_CONTROLLER) as? HomeViewController
            self.navigationController?.pushViewController(viewControllerObj!, animated: true)
            break
        case 1: //See How It Works
            let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_SEE_HOW_IT_WORKS_VIEW_CONTROLLER) as? SeeHowItWorksViewController
            self.navigationController?.pushViewController(viewControllerObj!, animated: true)
            break
        case 2: //About
            let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_ABOUT_VIEW_CONTROLLER) as? AboutViewController
            self.navigationController?.pushViewController(viewControllerObj!, animated: true)

            break
        case 2: //Contact Us
            let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_CONTACT_US_VIEW_CONTROLLER) as? ContactUsViewController
            self.navigationController?.pushViewController(viewControllerObj!, animated: true)
            
            break
        case 2: //Logout
//            let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier(IDENTIFIER_ABOUT_VIEW_CONTROLLER) as? AboutViewController
//            self.navigationController?.pushViewController(viewControllerObj!, animated: true)
            
            break
        default:
            print("Not a valid option selected")
        }
    }
}