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
        
        //初始化为点评框增加缩放效果
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        //一个滑动的动画
        let transform = CGAffineTransformMakeTranslation(0, 500)
        //组合动画效果
        dialogView.transform = CGAffineTransformConcat(scale, transform)
    }

    override func viewWillAppear(animated: Bool) {
        //为点评框增加缩放效果
//        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//        }, completion: nil)
        
        // Spring animation
//        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6,
//            initialSpringVelocity: 0.5, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeTranslation(0, 0)
//            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
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
