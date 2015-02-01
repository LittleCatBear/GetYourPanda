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
  
    let localNotification:UILocalNotification = UILocalNotification()
    
    var requestServices = RequestServices()
    var tableData = []
    
    
    
    override func viewDidLoad() {
        requestServices.getTypes()
    }
    
    func didReceiveRequestServicesResults(results: NSDictionary) {
        var resultsArr : NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = resultsArr
            self.typeChoiceTableView!.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "typeCell")
        let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        
        cell.textLabel?.text = rowData["name"] as? NSString
      //  cell.detailTextLabel?.text = "subtitle #\(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
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