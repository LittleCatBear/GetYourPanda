//
//  SettingsViewController.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 24/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import UIKit


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RequestServicesProtocol {

    @IBOutlet weak var typeChoiceTableView: UITableView!
    
    let customCell: String =  "typeCell"
  
    let localNotification:UILocalNotification = UILocalNotification()
    
    let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var requestServices = RequestServices()
    var tableData = []
    
    
    
    override func viewDidLoad() {
        
        requestServices.getTypes()
        self.requestServices.delegate = self
    }
    
    func didReceiveRequestServicesResults(results: NSArray) {
        //var resultsArr : NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
            self.typeChoiceTableView!.reloadData()
        })
    }
    
    func didReceiveRequestServicesResults(results: NSDictionary) {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = typeChoiceTableView.dequeueReusableCellWithIdentifier(customCell) as UITableViewCell
        
        let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        
        cell.textLabel?.text = rowData["name"] as? NSString
        
      //  cell.detailTextLabel?.text = "subtitle #\(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let tempData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        println(tempData["id"])
        userDefaults.setObject(tempData["id"], forKey: "type_id")
        //stocker le n° selectionné dans les settings user
    }
    
    @IBAction func goClickButton(sender: AnyObject) {
        localNotification.alertAction = "alert test"
        localNotification.alertBody =  "body of alert"
        localNotification.fireDate = NSDate(timeIntervalSinceNow : 5)
        localNotification
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
 
    
}