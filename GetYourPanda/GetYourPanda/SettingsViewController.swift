//
//  SettingsViewController.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 24/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import UIKit


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var typeChoiceTableView: UITableView!
  
    let localNotification:UILocalNotification = UILocalNotification()
    
    override func viewDidLoad() {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
    }
    
    
    @IBAction func goClickButton(sender: AnyObject) {
        localNotification.alertAction = "alert test"
        localNotification.alertBody =  "body of alert"
        localNotification.fireDate = NSDate(timeIntervalSinceNow : 5)
        localNotification
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
 
    
}