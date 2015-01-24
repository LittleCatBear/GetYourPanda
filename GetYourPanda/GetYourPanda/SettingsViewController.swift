//
//  SettingsViewController.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 24/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import UIKit


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var catSwitch: UISwitch!
    @IBOutlet weak var redPandaSwitch: UISwitch!
    let localNotification:UILocalNotification = UILocalNotification()
    
    override func viewDidLoad() {
       
      
        
        
        
    }
    
    @IBAction func goClickButton(sender: AnyObject) {
        localNotification.alertAction = "alert test"
        localNotification.alertBody =  "body of alert"
        localNotification.fireDate = NSDate(timeIntervalSinceNow : 30)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    
}