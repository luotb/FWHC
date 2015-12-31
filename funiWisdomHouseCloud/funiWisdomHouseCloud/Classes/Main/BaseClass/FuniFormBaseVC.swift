//
//  FuniFormBaseVC.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/28.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class FuniFormBaseVC: BaseViewController {
    
    var messageView:FuniMessageView!
    var currentTextField:FuniTextField!
    var dropListView:FuniDropListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerMessageListen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK MessageView
extension FuniFormBaseVC {
    
    func loadMessageView() {
        if self.messageView != nil {
            self.messageView.view.removeFromSuperview()
        }
        
        self.messageView = Helper.getViewControllerFromStoryboard("Common", storyboardID:"FuniMessageView") as! FuniMessageView
        let width = APPWIDTH - 80
        self.messageView.view.frame = CGRectMake(40, 26, width, 32)
        ((UIApplication.sharedApplication().delegate) as! AppDelegate).window!.addSubview(self.messageView.view)
    }
    
    func setMessageText(text:String) {
        self.loadMessageView()
        self.messageView?.setMessageText(String.excludeEmpty(text))
    }
    
    
    /**
    *  注册消息监听者
    */
    func registerMessageListen() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"messageNotification:", name: Key_Notification_Message, object: nil)
    }
    
    
    /**
    *  消息监听通知
    *
    *  @param notification notification description
    */
    func messageNotification(notification:NSNotification) {
        let dic:Dictionary = notification.userInfo!
        let msg:String = dic[Key_Notification_MessageText] as! String
        self.setMessageText(msg)
    }
    
}

// MARK TextField
extension FuniFormBaseVC : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField.isKindOfClass(FuniTextField) &&
            (textField as! FuniTextField).isPopupWin == true {
                self.currentTextField = textField as! FuniTextField
                self.buildPopupDataSource(textField as! FuniTextField)
                self.showPopupView()
            return false
        }
        return true
    }
    
    
    
    /**
     *  验证所有输入框
     *
     *  @return 返回是否验证通过
     */
    func validateInputInView() ->Bool {
        var judge = true
        let textFields = self.allTextField()
        for textField:FuniTextField in textFields {
            if textField.verifyTextField() == false {
                textField.becomeFirstResponder()
                judge = false
                break
            }
        }
        return judge
    }
    
    //找出所有的textfield
    func allTextField() ->Array<FuniTextField>{
        var results = Array<FuniTextField>()
        let allSubView = self.allSubviews(self.view)
        for view:UIView in allSubView {
            if view.isKindOfClass(FuniTextField) {
                results.append(view as! FuniTextField)
            }
        }
        
        if results.count > 0 {
            results.sortInPlace({ (tf1:FuniTextField, tf2:FuniTextField) -> Bool in
                return tf1.index < tf2.index
            })
        }
        
        return results
    }
    
    //找出所有的subview
    func allSubviews(theView:UIView) ->Array<UIView> {
        var results:Array<UIView> = theView.subviews
        for eachView: UIView in theView.subviews {
            
            if let riz:Array<UIView> = self.allSubviews(eachView) {
                for tempView:UIView in riz {
                    results.append(tempView)
                }
            }
        }
        return results
    }
}

// MARK Popup window
extension FuniFormBaseVC {
    
    /**
     为textfiled绑定弹窗所需的数据源
     
     - parameter textField: <#textField description#>
     */
    func buildPopupDataSource(textField:FuniTextField) {
        
    }
    
    func loadPopupView() {
        self.dropListView = Helper.getViewControllerFromStoryboard("Common", storyboardID: "FuniDropListView") as! FuniDropListView
        self.dropListView.lastSelValue = self.currentTextField.text
        self.dropListView.dropListDataSource = self.currentTextField.dataSource
        self.dropListView.view.alpha = 0
        self.view.addSubview(self.dropListView.view)
        
        self.dropListView.didSelDropListClosure = {(configInfo: FuniConfigInfo)
            -> Void in
            self.currentTextField.currentDidSelInfo = configInfo
            self.removeDropListView()
        }
    }
    
    /**
     显示选择框弹窗
     */
    func showPopupView() {
        self.loadPopupView()
        UIView.animateWithDuration(0.3) { () -> Void in
            self.dropListView.view.alpha = 1.0
        }
    }
    
    /**
     移除弹窗
     */
    func removeDropListView() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
             self.dropListView.view.alpha = 0
            }) { (isSuccess:Bool) -> Void in
                if self.dropListView != nil {
                    self.dropListView.view.removeFromSuperview()
                }
        }
    }
}
