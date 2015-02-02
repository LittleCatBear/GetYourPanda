//
//  ViewController.swift
//  GetYourPanda
//
//  Created by Julie Huguet on 24/01/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import UIKit
import AssetsLibrary

class PictureViewController: UIViewController, UIApplicationDelegate {
    
    @IBOutlet weak var customImageView: UIImageView!
    let pictureServices : PictureServices = PictureServices()
    
    var assetsLibrary: ALAssetsLibrary?
    typealias CompletionHandler = (success:Bool!) -> Void

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        assetsLibrary = ALAssetsLibrary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //save to assets library in custom folder named "GYP_Album"
    @IBAction func saveClickButton(sender: UIButton) {
        var orientation:ALAssetOrientation = ALAssetOrientation.Up
        var image = customImageView.image
        self.addImage(image!, toAlbum: "GYP_Album", orientation:orientation) { (success) -> Void in
            print("Image Added : \(success)");
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        customImageView.image = pictureServices.getRedPanda()
        
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        println("test")
    }
    
    func alertHandler(msg: NSString){
        
        let alertController = UIAlertController(title: "Picture status", message:
            msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok, great!", style: UIAlertActionStyle.Default,handler: nil))
    
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    // Create or check existing group for picture & save picture in the group
    func addImage(image:UIImage, toAlbum albumName:String, orientation : ALAssetOrientation, handler:CompletionHandler){
        
        assetsLibrary?.addAssetsGroupAlbumWithName(albumName, resultBlock: {(group:ALAssetsGroup!) -> Void in
            print("\nAlbum Created:=  \(albumName)");
            /*-- Find Group --*/
            
            var groupToAddTo:ALAssetsGroup?;
            
            self.assetsLibrary?.enumerateGroupsWithTypes(ALAssetsGroupType(ALAssetsGroupAlbum),
                usingBlock: { (group:ALAssetsGroup?, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
                    
                    if(group != nil){
                        
                        if group!.valueForProperty(ALAssetsGroupPropertyName) as String == albumName{
                            groupToAddTo = group;
                            
                            print("\nGroup Found \(group!.valueForProperty(ALAssetsGroupPropertyName))\n");
                            
                            self.assetsLibrary?.writeImageToSavedPhotosAlbum(image.CGImage, orientation: orientation, completionBlock: {(assetURL:NSURL!,error:NSError!) -> Void in
                                
                                if(error == nil){
                                    self.assetsLibrary?.assetForURL(assetURL,
                                        resultBlock: { (asset:ALAsset!) -> Void in
                                            var yes:Bool? = groupToAddTo?.addAsset(asset);
                                            if (yes == true){
                                                handler(success: true);
                                                self.alertHandler("Yay, cuteness saved ! \\o/")
                                            }
                                        },
                                        failureBlock: { (error2:NSError!) -> Void in
                                            self.alertHandler("Oops, something went wrong :( /n Cuteness not saved")
                                            handler(success: false);
                                    });
                                }
                            });
                        }
                    } /*Group Is Not nil*/
                },
                failureBlock: { (error:NSError!) -> Void in
                    print("Failed to find group");
                    handler(success: false);
            });
            
            }, failureBlock: { (error:NSError!) -> Void in
                print("Failed to create \(error)");
                handler(success: false);
        });
    }

}

