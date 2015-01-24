//
//  PictureServices.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 24/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import UIKit

class PictureServices {
    
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

}
