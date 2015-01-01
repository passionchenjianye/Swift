//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Tony on 12/23/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var dialogView:UIView!
    
    override func viewDidLoad() {
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    }
    
    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//            }, completion: nil)
//        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
//                self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//                }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
    let scale = CGAffineTransformMakeScale(1, 1)
    let translate = CGAffineTransformMakeTranslation(0, 0)
    self.dialogView.transform = CGAffineTransformConcat(scale, translate)
    }, completion: nil)

    }
}
