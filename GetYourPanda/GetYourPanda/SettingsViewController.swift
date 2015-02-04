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
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var goButton: UIButton!
    
    let customCell: String =  "typeCell"
  
    let localNotification:UILocalNotification = UILocalNotification()
    
    let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var requestServices = RequestServices()
    var tableData = []
    
    
    
    override func viewDidLoad() {
        
        requestServices.getTypes()
        self.requestServices.delegate = self
      //  self.timePicker.datePickerMode = UIDatePickerMode.Time
     //   self.goButton.layer.cornerRadius = 5
        initBg()
        
    }
    
    func didReceiveRequestServicesResults(results: NSArray) {
       // var resultsArr : NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
            //self.typeChoiceTableView!.reloadData()
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
        localNotification.alertBody =  "Your daily cuteness is available !"
        localNotification.fireDate = self.timePicker.date
        localNotification.repeatInterval = NSCalendarUnit.CalendarUnitMinute
        //localNotification
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    func initBg(){
        let rect : CGRect = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        var vista : UIView = UIView(frame: rect)
        let gradient : CAGradientLayer = CAGradientLayer()
        gradient.frame = vista.bounds
        
        let cor1 = UIColor(red: 255.0/255.0, green: 156.0/255.0, blue: 220.0/255.0, alpha: 1.0).CGColor
        //let cor2 = UIColor(red: 39.0/255.0, green: 160.0/255.0, blue: 255.0/255.0, alpha: 1.0).CGColor
        let cor2 = UIColor.whiteColor().CGColor
        let arrayColors = [cor1, cor2]
        
        gradient.colors = arrayColors
        view.layer.insertSublayer(gradient, atIndex: 300)
    }
 
    
}