//
//  GlobalMenuTableController.swift
//  Boltifi
//
//  Created by Sravan on 03/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation

class GlobalMenuTableController:UITableViewController {
    
    @IBOutlet weak var tblGlobalMenu: UITableView!
    let identifier: String = "tableCell"
    
    var arrGlobalMenuItems = ["", "Home", "See how it works", "About", "Contact Us", "Logout"]
  
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGlobalMenuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier)

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell.textLabel?.text = arrGlobalMenuItems[indexPath.row]

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