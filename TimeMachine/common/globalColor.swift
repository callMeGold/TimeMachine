//
//  global.swift
//  timeMachine
//
//  Created by 卢洋 on 15/6/11.
//  Copyright (c) 2015年 奈文摩尔. All rights reserved.
//

import Foundation
import UIKit
/*继承UIColor类*/
extension UIColor {
    
    /** 导航主题色 */
    class func appMainColor() -> UIColor {
        return UIColor(red:0.01, green: 0.01, blue: 0.01, alpha:1);
    }
    /** 首页背景灰色 --》0.31 */
    class func appIndexColor() -> UIColor {
        return UIColor(red:0.31, green: 0.31, blue: 0.31, alpha:1)
    }
    /** 首页背景深灰色 --》0.31 */
    class func appIndexColorWithshenhui() -> UIColor {
        return UIColor(red:0.15, green: 0.15, blue: 0.16, alpha:1)
    }
    /** 登陆按钮背景色 */
    class func yellowBtnColor() ->UIColor{
        return UIColor(red:0.95, green:0.59, blue:0.2, alpha: 1.0);
    }
    /** 忘记密码颜色 */
    class func textLinkColor() ->UIColor {
        return UIColor(red: 0.21, green:0.56, blue:0.81, alpha: 1.0);
    }
    /** 视图背景颜色，浅灰色 */
    class func linghtGreyBg() ->UIColor {
        return UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1);
    }
    /**黑色边框,一般指表格的边框线 */
    class func greyBorder() ->UIColor{
        return UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1)
    }
    /**黑色边框,一般指表格的边框线 */
    class func greyFont()->UIColor{
        return UIColor(red: 150/255, green: 151/255, blue: 152/255, alpha: 1)
    }
    //我的资料边框颜色
    class func borderGrey()->UIColor{
        return UIColor(red: 222/255, green: 224/255, blue: 224/255, alpha: 1)
    }
    //红色字体
    class func redFont()->UIColor{
        return UIColor(red: 233/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    //搜索框灰色背景色和滚动灰色背景
    class func greySearch()->UIColor{
        return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
    }
    //发布文字灰色字体
    class func textWithGrey()->UIColor{
        return UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
    }
    //灰色按钮
    class func greyBtn()->UIColor{
        return UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    }
    //money 颜色
    class func moneyText()->UIColor{
        return UIColor(red: 255/255, green: 100/255, blue: 0/255, alpha: 1)
    }
}
