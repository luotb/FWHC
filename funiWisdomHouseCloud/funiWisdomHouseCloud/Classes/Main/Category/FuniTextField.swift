//
//  UITextFiel+Extension.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/28.
//  Copyright © 2015年 funi. All rights reserved.
//

import Foundation

let Key_Notification_MessageText = "Key_Notification_MessageText"
let Key_Notification_Message     = "Key_Notification_Message"

//定义文本框类型
enum FuniTextFielType: Int {
    case Empty      = 1,//空
     EMail  = 2,//eMail
     Card   = 3,//身份证
     Phone  = 4,//电话
     Number = 5,//数字
     Length = 6 //长度
}

class FuniTextField: UITextField {

    @IBInspectable var messageStr:String = ""
    @IBInspectable var textFielType:Int = 1
    @IBInspectable var minLength:Int = 0
    @IBInspectable var maxLength:Int = 0
    @IBInspectable var index:Int = 0
    @IBInspectable var isPopupWin:Bool = false
    var dataSource:Array<FuniConfigInfo>?
   
    override func awakeFromNib()
    {
    super.awakeFromNib()
        self.setBorderWithWidth(1, color: UIColor.blackColor())
//    self.backgroundColor = UIColor.colorFromHexString("")
//    [self setBorderStyle:UITextBorderStyleNone];
//    [self setTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
//    [self setBackgroundColor:[UIColor whiteColor]];
    //    self.returnKeyType            = UIReturnKeyNext;
    self.autocapitalizationType   = UITextAutocapitalizationType.None
    self.textAlignment            = NSTextAlignment.Left
    self.borderStyle              = UITextBorderStyle.None
    self.clearButtonMode          = UITextFieldViewMode.WhileEditing
    self.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
    }
    
    
//    override func drawPlaceholderInRect(var rect: CGRect) {
//        rect.origin.y += 7;
//        self.placeholderRectForBounds(CGRect)
//    [self.placeholder drawInRect:rect withAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:179.0/255.0 green:179.0/255.0 blue:179.0/255.0 alpha:1.0],NSFontAttributeName:[UIFont systemFontOfSize:14]}];
//    }
    
    
    /**
    *  验证文本框
    *
    *  @return 返回是否验证通过
    */
    func verifyTextField() ->Bool {
        let judge = self.verifyTextFieldNoMessage()
        if judge == false {
        self.notification()
        }
        return judge
    }
    
    /**
    *  验证文本框(不显示验证失败messageView)
    *
    *  @return 返回是否验证通过
    */
    func verifyTextFieldNoMessage() ->Bool {
        var judge:Bool = false
        switch (self.textFielType) {
            case 1:
                judge = self.isPlaceholderStr()
                break;
            case 2:
                judge = String.isValidateEmail(self.text!)
                break;
            case 3:
                judge = String.validateIdentityCard(self.text!)
                break;
            case 4:
                judge = String.validateMobile(self.text!)
                break;
            case 5:
                judge = String.isPureInt(self.text!)
                break;
            case 6:
                if(self.minLength != 0 && self.maxLength != 0){
                    if(self.text!.characters.count >= self.minLength && self.text!.characters.count <= self.maxLength){
                        judge = true
                    }
                }else{
                    judge = true
                }
                break;
            default:
                judge = true
                break;
        }
        return judge
    }
    
    
    /**
    *  判断输入框文本是否=placeholder值
    *
    *  @return 返回是否相等
    */
    func isPlaceholderStr() ->Bool {
        if self.text?.isEmpty == true {
            return false
        }else {
            return !(self.text == self.placeholder)
        }
    }
    
    func notification() {
        var dict = Dictionary<String,AnyObject>()
        dict[Key_Notification_MessageText] = self.messageStr
        NSNotificationCenter.defaultCenter().postNotificationName(Key_Notification_Message, object: self, userInfo: dict)
    }
}
