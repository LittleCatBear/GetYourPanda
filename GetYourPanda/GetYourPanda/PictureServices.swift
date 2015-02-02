//
//  PictureServices.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 24/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import UIKit

class PictureServices: RequestServicesProtocol {
    
    var requestServices : RequestServices = RequestServices()
  //  var tableData = []
    let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var image : UIImage?
    
    init() {
    }
    
    func didReceiveRequestServicesResults(results: NSArray) {
    }
    
    func didReceiveRequestServicesResults(results: NSDictionary) {
        //var resultsArr : NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
          //  self.tableData = results
            //let rowData: NSDictionary = self.tableData[0] as NSDictionary
            var path: NSString = results["path"] as NSString
            println(path )
            var urlString = "http://localhost:3000" + "\(path)"
          
            var imgUrl : NSURL = NSURL(string: urlString)!
            
            //get img with url imgUrl
            
            let dataImg = NSData(contentsOfURL: imgUrl)
            println(dataImg)//make sure your image in this url does exist, otherwise unwrap in a if let check
            self.image = UIImage(data: dataImg!)
            
        })
    }
    /*
    let cats : [String] = ["chat1", "chat2", "chat3", "chat4"]
    let redPandas : [String] = ["panda1", "panda2", "panda3", "panda4", "panda5"]
    
    func getRedPanda() -> UIImage{
        
        let randNum : Int = Int(arc4random()) % (redPandas.count - 1)
        let redPanda : UIImage = UIImage(named: redPandas[randNum])!
        return redPanda
    }
    
    func getCat() -> UIImage{
        let randNum : Int = Int(arc4random()) % (cats.count - 1)
        let cat : UIImage = UIImage(named: cats[randNum])!
        return cat
    }
*/

}
