//
//  ReviewViewController.swift
//  HuntFood
//
//  Created by noprom on 15/9/19.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var dialogView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //为背景图片增加模糊效果
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //初始化为点评框增加渐变效果
        dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    }

    override func viewWillAppear(animated: Bool) {
        //为点评框增加渐变效果
        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}