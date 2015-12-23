//
//  globalMethod.swift
//  timeMachine
//
//  Created by 卢洋 on 15/6/17.
//  Copyright (c) 2015年 奈文摩尔. All rights reserved.
//

import Foundation
import UIKit
/** 一些公共的全局方法 */
class publicMethod:UIViewController,UIAlertViewDelegate{
    // 手机号验证正则表达式
    func validateMobile(phoneNum:String)-> Bool {
        //     let phoneRegex = "^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"
        // 手机号以 13 14 15 18 开头   八个 \d 数字字符
        let phoneRegex = "^((13[0-9])|(17[0-9])|(14[^4,\\D])|(15[^4,\\D])|(18[0-9]))\\d{8}$|^1(7[0-9])\\d{8}$";
        let phoneTest = NSPredicate(format: "SELF MATCHES %@" , phoneRegex)
        return (phoneTest.evaluateWithObject(phoneNum));
    }
    //金额验证正则表达式
    func validataMoney(moneyNum:String)-> Bool{
        let moneyRegex="^[0-9]+([.]{0,1}[0-9]+){0,1}$";
        let moneyTest=NSPredicate(format: "SELF MATCHES %@", moneyRegex);
        return(moneyTest.evaluateWithObject(moneyNum));
    }
    func sizeWithText(text:NSString,maxSize:CGSize,font:UIFont)->CGSize{
        let attributes=NSDictionary(object: font, forKey: NSFontAttributeName);
        return text.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes as! [String : AnyObject] as [String : AnyObject] , context: nil).size;
        
    }

}

//自动控制文字换行及宽度
extension String {
    func textSizeWithFont(font: UIFont, constrainedToSize size:CGSize) -> CGSize {
        var textSize:CGSize!
        if CGSizeEqualToSize(size, CGSizeZero) {
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
            textSize = self.sizeWithAttributes(attributes as! [String : AnyObject] as [String : AnyObject])
        } else {
            let option = NSStringDrawingOptions.UsesLineFragmentOrigin
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
            let stringRect = self.boundingRectWithSize(size, options: option, attributes: attributes as! [String : AnyObject] as [String : AnyObject], context: nil)
            textSize = stringRect.size
        }
        return textSize
    }
    
    

}


