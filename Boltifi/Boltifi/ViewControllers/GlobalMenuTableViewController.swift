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
    
    var arrGlobalMenuItems = ["", "Home", "See how it works", "About", "Contact Us", "Logout"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGlobalMenuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: MenuCustomCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? MenuCustomCell
        
        if cell == nil {
            cell = MenuCustomCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        cell.menuTitleLabel?.text = arrGlobalMenuItems[indexPath.row] as? String
//        cell.menuTitleLabel?.text = "abcdserewrewrewfref" as String//arrGlobalMenuItems[indexPath.row] as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //        if indexPath.row == 3 {
        //            //about
        //            self.dismissViewControllerAnimated(false, completion: { () -> Void in
        //                let objAboutViewController:AboutViewController = AboutViewController()
        //
        //                self.presentViewController(objAboutViewController, animated: false, completion: nil)
        //
        //            })
        //        } else {
        self.dismissViewControllerAnimated(false, completion: nil);
        //        }
    }
}