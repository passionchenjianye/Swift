//
//  AppDelegate.swift
//  FoodPin
//
//  Created by Tony on 12/4/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import UIKit
import Foundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UINavigationBar.appearance().barTintColor = UIColor(red: 231.0/255.0, green: 95.0/255.0, blue:
            53.0/255.0, alpha: 0.3)
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        if let barFont = UIFont(name: "AvenirNextCondensed-DemiBold", size: 22.0) {
            UINavigationBar.appearance().titleTextAttributes =
                [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:barFont]
        }
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        return true
    }

    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        UIBarButtonItem.appearance().tintColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue:
            27.0/255.0, alpha: 1.0);
        UIToolbar.appearance().barTintColor = UIColor(red: 237.0/255.0, green: 240.0/255.0, blue:
                243.0/255.0, alpha: 0.5)
        return true
    }
}

