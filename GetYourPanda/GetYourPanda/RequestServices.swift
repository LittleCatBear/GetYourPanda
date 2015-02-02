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
    func didReceiveRequestServicesResults(results: NSArray)
}

class RequestServices: NSObject {
    
    override init() {
    }
    
    var delegate: RequestServicesProtocol?
    
    //manager of Urls
    var urlController : UrlController = UrlController()
    
    func getTypes()
    {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(urlController.getTypesUrl, completionHandler: {data, response, error -> Void in
            println("task completed")
            
            if(error != nil){
                println(error!.localizedDescription)
            }
            
            var err : NSError?
            var json : NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
            //println(json["id"])
            if(err != nil){
                println("json error \(err!.localizedDescription)")
            }

            println("no json error")
            //let results : NSArray = json["results"] as NSArray
            self.delegate?.didReceiveRequestServicesResults(json)
        })
        task.resume()
    }
    
    func getRandomPicture(typeId : NSInteger)
    {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(urlController.getRandomPictureUrlbyTypeId(typeId), completionHandler: { (data, response, error) -> Void in
            println("get random img request completed")
            
            if(error != nil){
                println(error!.localizedDescription)
            }
            
            var err: NSError?
            var json : NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
            if(err != nil){
                println("json error")
            }
            println("no json error for random img")
            self.delegate?.didReceiveRequestServicesResults(json)
        })
        task.resume()
    }
}
    

