//
//  updatePasswordOne.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/12.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class updatePasswordOne: UIViewController {
    
    
    
    var registWarp:UIView!              //总父容器
    var feildWarp:UIView!               //文本框父容器
    var nextBtn:UIButton!               //下一步按钮
    
    //导航栏颜色透明
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.lt_setBackgroundColor(UIColor.blackColor().colorWithAlphaComponent(0.1))
    }
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
        
    }
    //初始化ui控件
    func initView(){
        let registWarpBackImage=UIImageView()
        registWarpBackImage.frame=CGRectMake(0, 0, screen.width, screen.height)
        registWarpBackImage.image=UIImage(named: "Bg7.jpeg")
        self.view.addSubview(registWarpBackImage)
        self.title="忘记密码"
        allWarp();
        textFeild();
    }
    //整体布局
    func allWarp(){
        registWarp=UIView()
        registWarp.frame=CGRectMake(0, 64, screen.width, screen.height)
        self.view.addSubview(registWarp)
    }
    //文本框布局+下一步按钮
    func textFeild(){
        //文本框父容器
        feildWarp=UIView()
        feildWarp.frame=CGRectMake(0, 20, screen.width, 100)
        feildWarp.backgroundColor=UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        registWarp.addSubview(feildWarp)
        //验证码图标＋文字标签＋文本框
        let userPic:UIImageView=UIImageView()
        userPic.frame=CGRectMake(20, 10, 30, 30)
        userPic.image=UIImage(named: "iconfont-user.png")
        feildWarp.addSubview(userPic)
        let userText:UILabel=UILabel()
        userText.frame=CGRectMake(60, 20, 40, 20)
        userText.text="账号"
        userText.font=UIFont.systemFontOfSize(16)
        userText.textColor=UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        feildWarp.addSubview(userText)
        let userFeild:UITextField=UITextField()
        userFeild.frame=CGRectMake(CGRectGetMaxX(userText.frame)+10, CGRectGetMinY(userText.frame), screen.width-10-CGRectGetMaxX(userText.frame), 20)
        userFeild.placeholder="请输入手机号码注册"
        userFeild.clearButtonMode=UITextFieldViewMode.WhileEditing
        userFeild.font=UIFont.systemFontOfSize(16)
        feildWarp.addSubview(userFeild)
        //横线
        let lian=UIView()
        lian.frame=CGRectMake(CGRectGetMinX(userText.frame), 50, screen.width-CGRectGetMinX(userText.frame), 0.5)
        lian.backgroundColor=UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        feildWarp.addSubview(lian);
        //验证码图标＋文字标签＋文本框
        let codePic:UIImageView=UIImageView()
        codePic.frame=CGRectMake(20, 60, 30, 30)
        codePic.image=UIImage(named: "iconfont-downa.png")
        feildWarp.addSubview(codePic)
        let codeText:UILabel=UILabel()
        codeText.frame=CGRectMake(60, 70, 40, 20)
        codeText.text="验证"
        codeText.font=UIFont.systemFontOfSize(16)
        codeText.textColor=UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        feildWarp.addSubview(codeText)
        let codeFeild:UITextField=UITextField()
        codeFeild.frame=CGRectMake(CGRectGetMaxX(userText.frame)+10, CGRectGetMinY(userText.frame)+50, screen.width-10-CGRectGetMaxX(userText.frame)-110, 20)
        codeFeild.placeholder="请输入验证码"
        codeFeild.clearButtonMode=UITextFieldViewMode.WhileEditing
        codeFeild.font=UIFont.systemFontOfSize(16)
        feildWarp.addSubview(codeFeild)
        //获取验证码标签
        let codeLabel:UILabel=UILabel()
        codeLabel.frame=CGRectMake(CGRectGetMaxX(codeFeild.frame)+5, 55, 100, 40)
        codeLabel.layer.borderColor=UIColor(red: 0.32, green: 0.75, blue: 0.74, alpha: 1).CGColor;
        codeLabel.layer.borderWidth=0.5;
        codeLabel.text="获取验证码"
        codeLabel.layer.cornerRadius=5
        codeLabel.font=UIFont.systemFontOfSize(16)
        codeLabel.textColor=UIColor(red: 0.32, green: 0.75, blue: 0.74, alpha: 1)
        codeLabel.userInteractionEnabled=true;
        //点击事件
        let tap=UITapGestureRecognizer(target: self, action: "clickCodeLabel");
        codeLabel.addGestureRecognizer(tap);
        codeLabel.textAlignment=NSTextAlignment.Center
        feildWarp.addSubview(codeLabel)
        //下一步按钮
        nextBtn=UIButton()
        nextBtn.frame=CGRectMake(30, CGRectGetMaxY(codeText.frame)+120, screen.width-60, 40)
        nextBtn.setTitle("下一步", forState: UIControlState.Normal)
        nextBtn.layer.cornerRadius=20;
        nextBtn.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        nextBtn.addTarget(self, action: "clickNextBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        registWarp.addSubview(nextBtn)
        
        
        
    }
    ///点击获取验证码标签
    func clickCodeLabel(){
        print("1111")
    }
    ///点击下一步按钮
    func clickNextBtn(sender:UIButton){
        //跳转页面
        let reg = updatePasswordTwo();
        self.navigationController!.pushViewController(reg, animated: true)
    }
    
}