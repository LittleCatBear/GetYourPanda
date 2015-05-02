//
//  UrlController.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 01/02/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import UIKit

class UrlController : NSObject {
    
    var getTypesUrl : NSURL = NSURL(string: "http://localhost:3000/types.json")!
   // var pictureUrl : NSURL?
    
    func getRandomPictureUrlbyTypeId(typeId : NSInteger) -> NSURL
    {
        var urlPicture : NSString = "http://localhost:3000/types/"+"\(typeId)"+"/images/random"
        return NSURL(string: urlPicture as String)!
    }
}


