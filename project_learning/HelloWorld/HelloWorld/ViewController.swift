//
//  ViewController.swift
//  HelloWorld
//
//  Created by Tony on 12/27/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "小梁是猪？", message: "恭喜你答对了！", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定小梁是猪", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

