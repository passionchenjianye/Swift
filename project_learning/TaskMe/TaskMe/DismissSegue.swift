//
//  DismissSegue.swift
//  TaskMe
//
//  Created by Tony on 12/28/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import UIKit

@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
    
    override func perform() {
        if let controller = sourceViewController.presentingViewController? {
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
   
}
