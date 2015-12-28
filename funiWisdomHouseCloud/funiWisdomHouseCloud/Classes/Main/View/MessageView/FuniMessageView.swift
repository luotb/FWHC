//
//  FuniMessageView.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/28.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class FuniMessageView: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor    = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.view.layer.cornerRadius = 4;
        self.view.alpha              = 0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
    *  设置消息文本
    *
    *  @param msg 消息文本
    */
    func setMessageText(msg:String) {
        messageLabel.text = String.excludeEmpty(msg);
        self.showMessageViewAnimate()
    }
    
    
    /**
    *  动画show消息
    */
    func showMessageViewAnimate() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.view.alpha = 1.0
        }) { (isSuccess:Bool) -> Void in
            FuniCommon.asynExecuteCode(2, code: { () -> Void in
                self.hideMessageViewAnimate()
            })
        }
    }
    
    
    /**
    *  动画hide消息
    */
    func hideMessageViewAnimate() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.alpha = 0
        }
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
