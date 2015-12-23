//
//  Regist.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
var http="http://192.168.1.145:8000/front/"
class Regist:UIViewController {
    var registWarp:UIView!              //总父容器
    var feildWarp:UIView!               //文本框父容器
    var nextBtn:UIButton!               //下一步按钮
    var userFeild:UITextField?
    var code=""                         //验证码
    var codeText:UILabel!
    var codeFeild:UITextField?
    //导航栏颜色透明
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.lt_setBackgroundColor(UIColor.blackColor().colorWithAlphaComponent(0.1))
    }

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
        self.title="注册"
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
        userFeild=UITextField()
        userFeild?.frame=CGRectMake(CGRectGetMaxX(userText.frame)+10, CGRectGetMinY(userText.frame), screen.width-10-CGRectGetMaxX(userText.frame), 20)
        userFeild?.placeholder="请输入手机号码注册"
        userFeild?.clearButtonMode=UITextFieldViewMode.WhileEditing
        userFeild?.keyboardType=UIKeyboardType.NumberPad
        userFeild?.font=UIFont.systemFontOfSize(16)
        feildWarp.addSubview(userFeild!)
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
        codeText=UILabel()
        codeText.frame=CGRectMake(60, 70, 40, 20)
        codeText.text="验证"
        codeText.font=UIFont.systemFontOfSize(16)
        codeText.textColor=UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        feildWarp.addSubview(codeText)
        codeFeild=UITextField()
        codeFeild?.frame=CGRectMake(CGRectGetMaxX(userText.frame)+10, CGRectGetMinY(userText.frame)+50, screen.width-10-CGRectGetMaxX(userText.frame)-110, 20)
        codeFeild?.placeholder="请输入验证码"
        codeFeild?.keyboardType=UIKeyboardType.NumberPad
        codeFeild?.clearButtonMode=UITextFieldViewMode.WhileEditing
        codeFeild?.font=UIFont.systemFontOfSize(16)
        feildWarp.addSubview(codeFeild!)
        //获取验证码标签
        let codeLabel:UILabel=UILabel()
        codeLabel.frame=CGRectMake(CGRectGetMaxX(codeFeild!.frame)+5, 55, 100, 40)
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
    ///请求验证码
    func requestcode(){
        let URL1=http+"returnRandCode.xhtml"
        let memberName=self.userFeild?.text
        request(.POST, URL1, parameters: ["memberName":"\(memberName!)"])
            .responseJSON{Response in
                if Response.result.error != nil{
                    print("服务器错误")
                }
                if Response.result.value != nil {
                    let jsonResponse=JSON(Response.result.value!)
                    if jsonResponse["success"].stringValue=="success"{
                        print("发送成功,返回randCode(验证码))")
                        self.code=jsonResponse["randCode"].stringValue
                    }else if jsonResponse["success"].stringValue=="failds"{
                        print("发送失败")
                    }else{
                        print("失败...qita")
                    }
                }
        }
    }
    
    ///点击获取验证码标签
    func clickCodeLabel(){
        let URL=http+"doMemberTheOnly.xhtml"
        let memberName=self.userFeild?.text
        request(.POST, URL, parameters: ["memberName":"\(memberName!)"])
            .responseJSON{res in
                if res.result.error != nil{
                    print("服务器错误")
                }
                if res.result.value != nil{
                    ///解析json
                    var jsonResult=JSON(res.result.value!)
                    if jsonResult["success"].stringValue=="failds" {
                        print("可以注册")
                        self.requestcode();
                    }else if jsonResult["success"].stringValue=="success" {
                        print("已经注册")
                    }else if jsonResult["success"].stringValue=="error" {
                        print("系统繁忙")
                    }else{
                        print("qita1222")
                    }
                }
        }
    }
    ///点击下一步按钮
    func clickNextBtn(sender:UIButton){
        if self.code == codeFeild?.text{
            //跳转页面
            let reg = Regist1();
            reg.memberName=(userFeild?.text)!
            print("userFeild?.text....\(reg.memberName!)")
            self.navigationController!.pushViewController(reg, animated: true)
        }else{
            print("验证码错误")
        }
    }
}

