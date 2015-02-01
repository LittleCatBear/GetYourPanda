//
//  RequestServices.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 31/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation

protocol RequestServicesProtocol
{
    func didReceiveRequestServicesResults(results: NSDictionary)
}

class RequestServices: NSObject {
    
    var urlController : UrlController = UrlController()
    
    func getTypes()
    {
        let request = NSMutableURLRequest(URL: urlController.getTypesUrl)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
      //  request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("task completed")
            
            if(error != nil){
                println(error!.localizedDescription)
            }
            
            var err : NSError?

            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if(err != nil){
                println("json error \(err!.localizedDescription)")
            }
            
            let results : NSArray = json["results"] as NSArray
      
            })
            task.resume()
        }
}
    

