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
    func didReceiveRequestServicesResultsNS(results: NSDictionary)
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
            
            if(error != nil){
                println(error!.localizedDescription)
            }
            
            var err : NSError?
            var json : NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSArray
            if(err != nil){
                println("json error \(err!.localizedDescription)")
            }

            self.delegate?.didReceiveRequestServicesResults(json)
        })
        task.resume()
    }
    
    func getRandomPicturePath(typeId : NSInteger)
    {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(urlController.getRandomPictureUrlbyTypeId(typeId), completionHandler: { (data, response, error) -> Void in
            
            if(error != nil){
                println(error!.localizedDescription)
            }
            
            var err: NSError?
            
            var json : NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
            if(err != nil){
                println("json error")
            }
            self.delegate?.didReceiveRequestServicesResultsNS(json)
        })
        task.resume()
    }
}
    

