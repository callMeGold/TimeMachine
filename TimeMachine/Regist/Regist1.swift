//
//  Regist1.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/4.
//  Copyright © 2015年 nmore. All rights reserved.
//


import Foundation
import UIKit
class Regist1:UIViewController {
    var registPasswordWarp:UIView!              //总父容器
    var LogoPic:UIImageView!                    //时光机logo图片
    var PasswordfeildWarp:UIView!               //密码文本框父容器
    var nextBtn:UIButton!               //下一步按钮
    var TextItem=["姓名","密码","确定密码"]
    var manBtn:UIButton!
    var womanBtn:UIButton!
    var CompleteRegistBtn:UIButton!
    var memberName:String?
    var TextFeild:UITextField?
    var Text1Feild:UITextField?
    var Text2Feild:UITextField?
    var Text3Feild:UITextField?
    var TextLabel:UILabel!
    
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
        //设置背景图
        let viewWarp=UIView()
        viewWarp.frame=CGRectMake(0, 0, screen.width, screen.height)
        self.view.addSubview(viewWarp)
        self.title="注册"
        self.view.backgroundColor=UIColor.whiteColor()

        let BgPic:UIImageView=UIImageView()
        BgPic.frame=CGRectMake(0, 0, screen.width, screen.height)
        BgPic.image=UIImage(named: "Bg2.jpg")
        viewWarp.addSubview(BgPic)
        
        
        OverallLayout();
        upPic();
        passwordfeild();
        btnLayout();
    }
    //
    func OverallLayout(){
        //总父容器
        registPasswordWarp=UIView()
        let registPasswordWarpX:CGFloat=0
        let registPasswordWarpY:CGFloat=64
        let registPasswordWarpW:CGFloat=screen.width
        let registPasswordWarpH:CGFloat=screen.height
        registPasswordWarp.frame=CGRectMake(registPasswordWarpX, registPasswordWarpY, registPasswordWarpW, registPasswordWarpH)
        self.view.addSubview(registPasswordWarp)
        
    }
    //时光机logo图片
    func upPic(){
        //时光机logo图片
        LogoPic=UIImageView()
        let LogoPicX:CGFloat=0
        let LogoPicY:CGFloat=0
        let LogoPicW:CGFloat=screen.width
        let LogoPicH:CGFloat=150
        LogoPic.frame=CGRectMake(LogoPicX, LogoPicY, LogoPicW, LogoPicH)
        LogoPic.image=UIImage(named: "Bg5.jpg")
        registPasswordWarp.addSubview(LogoPic)
    }
    //密码文本框父容器
    func passwordfeild(){
        PasswordfeildWarp=UIView()
        let PasswordfeildWarpX:CGFloat=20
        let PasswordfeildWarpY:CGFloat=CGRectGetMaxY(LogoPic.frame)
        let PasswordfeildWarpW:CGFloat=screen.width-40
        let PasswordfeildWarpH:CGFloat=110
        PasswordfeildWarp.frame=CGRectMake(PasswordfeildWarpX, PasswordfeildWarpY, PasswordfeildWarpW, PasswordfeildWarpH)
        registPasswordWarp.addSubview(PasswordfeildWarp)
       
        //循环出子容器
        for(var i=0;i<3;i++){
            //文字标签
            TextLabel=UILabel()
            let TextLabelX:CGFloat=0
            let TextLabelY:CGFloat=40*CGFloat(i)
            let TextLabelW:CGFloat=100
            let TextLabelH:CGFloat=30
            TextLabel.frame=CGRectMake(TextLabelX, TextLabelY, TextLabelW, TextLabelH)
            TextLabel.text=TextItem[i]+":"
            TextLabel.textAlignment=NSTextAlignment.Center
            TextLabel.backgroundColor=UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 0.8)
            TextLabel.font=UIFont.systemFontOfSize(16)
            TextLabel.textColor=UIColor.whiteColor()
            PasswordfeildWarp.addSubview(TextLabel)
        }
        //姓名输入文本框
        Text1Feild=UITextField()
        let TextFeildX:CGFloat=CGRectGetMaxX(TextLabel.frame)+5
        let TextFeildY:CGFloat=0
        let TextFeildW:CGFloat=PasswordfeildWarpW-TextFeildX
        let TextFeildH:CGFloat=30
        Text1Feild?.frame=CGRectMake(TextFeildX, TextFeildY, TextFeildW, TextFeildH)
        Text1Feild?.placeholder="请输入您的姓名"
        Text1Feild?.clearButtonMode=UITextFieldViewMode.WhileEditing
        Text1Feild?.font=UIFont.systemFontOfSize(16)
        Text1Feild?.backgroundColor=UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 0.8)
        PasswordfeildWarp.addSubview(Text1Feild!)
        //密码输入文本框
        Text2Feild=UITextField()
        Text2Feild?.frame=CGRectMake(TextFeildX, 40, TextFeildW, TextFeildH)
        Text2Feild?.placeholder="请输入您的密码"
        Text2Feild?.clearButtonMode=UITextFieldViewMode.WhileEditing
        Text2Feild?.font=UIFont.systemFontOfSize(16)
        Text2Feild?.backgroundColor=UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 0.8)
        Text2Feild?.secureTextEntry=true
        PasswordfeildWarp.addSubview(Text2Feild!)
        //再次输入您的密码输入文本框
        Text3Feild=UITextField()
        Text3Feild?.frame=CGRectMake(TextFeildX, 80, TextFeildW, TextFeildH)
        Text3Feild?.placeholder="请再次输入您的密码"
        Text3Feild?.clearButtonMode=UITextFieldViewMode.WhileEditing
        Text3Feild?.font=UIFont.systemFontOfSize(16)
        Text3Feild?.backgroundColor=UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 0.8)
        Text3Feild?.secureTextEntry=true
        PasswordfeildWarp.addSubview(Text3Feild!)

        
    }
    //男女按钮+完成注册按钮
    func btnLayout(){
        //男按钮
        manBtn=UIButton()
        let manBtnX:CGFloat=CGRectGetMinX(PasswordfeildWarp.frame)
        let manBtnY:CGFloat=CGRectGetMaxY(PasswordfeildWarp.frame)+10
        let manBtnW:CGFloat=(CGRectGetWidth(PasswordfeildWarp.frame)-5)/2
        let manBtnH:CGFloat=30
        manBtn.frame=CGRectMake(manBtnX, manBtnY, manBtnW, manBtnH)
        manBtn.setTitle("男", forState: UIControlState.Normal)
        manBtn.setBackgroundImage(UIImage(named: "baiseBg.jpg"), forState: UIControlState.Normal)
        manBtn.setBackgroundImage(UIImage(named: "lvseBg.jpg"), forState: UIControlState.Selected)
        manBtn.selected=true;
        manBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        manBtn.tag=10
        manBtn.addTarget(self, action: "clickManBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        registPasswordWarp.addSubview(manBtn)
        //女按钮
        womanBtn = UIButton()
        let womanBtnX:CGFloat=CGRectGetMaxX(manBtn.frame)+5
        let womanBtnY:CGFloat=manBtnY
        let womanBtnW:CGFloat=manBtnW
        let womanBtnH:CGFloat=30
        womanBtn.frame=CGRectMake(womanBtnX, womanBtnY, womanBtnW, womanBtnH)
        womanBtn.setBackgroundImage(UIImage(named: "baiseBg.jpg"), forState: UIControlState.Normal)
        womanBtn.setBackgroundImage(UIImage(named: "lvseBg.jpg"), forState: UIControlState.Selected)
        womanBtn.selected=false;
        womanBtn.tag=20
        womanBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)

        womanBtn.addTarget(self, action: "clickManBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        womanBtn.setTitle("女", forState: UIControlState.Normal)
        registPasswordWarp.addSubview(womanBtn)
        //完成注册按钮
        CompleteRegistBtn=UIButton()
        let CompleteRegistBtnX:CGFloat=CGRectGetMinX(manBtn.frame)
        let CompleteRegistBtnY:CGFloat=CGRectGetMaxY(womanBtn.frame)+20
        let CompleteRegistBtnW:CGFloat=screen.width - CompleteRegistBtnX * 2
        let CompleteRegistBtnH:CGFloat=40
        CompleteRegistBtn.frame=CGRectMake(CompleteRegistBtnX, CompleteRegistBtnY, CompleteRegistBtnW, CompleteRegistBtnH)
        CompleteRegistBtn.setTitle("完成注册", forState: UIControlState.Normal)
        CompleteRegistBtn.backgroundColor=UIColor(red: 0.44, green: 0.85, blue: 0.76, alpha: 1)
        CompleteRegistBtn.layer.borderWidth=0.5
        CompleteRegistBtn.layer.borderColor=UIColor.whiteColor().CGColor
        CompleteRegistBtn.layer.cornerRadius=CompleteRegistBtnH/2
        CompleteRegistBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        CompleteRegistBtn.addTarget(self, action: "clickCompleteRegistBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        registPasswordWarp.addSubview(CompleteRegistBtn)
        
    }
    //点击男nv按钮
    func clickManBtn(sender:UIButton){
        if(sender.tag==10){
            manBtn.selected=false
            womanBtn.selected=true
        }else {
            manBtn.selected=true
            womanBtn.selected=false
        }
        
    }
    //点击完成注册按钮
    func clickCompleteRegistBtn(sender:UIButton){
        let URL=http+"doRegest.xhtml"
        let phone=self.memberName
        let pwdtext=Text2Feild?.text
        print("\(phone)")
        request(.POST, URL, parameters: ["memberName":"\(phone!)","memberPassword":"\(pwdtext!)"])
            .responseJSON{res in
                if res.result.error != nil{
                    print("服务器错误")
                }
                if res.result.value != nil{
                    ///解析json
                    var jsonResult=JSON(res.result.value!)
                    if jsonResult["success"].stringValue=="failds" {
                        print("注册失败")
                        
                    }else if jsonResult["success"].stringValue=="success" {
                        print("成功注册")
                        self.navigationController?.popToRootViewControllerAnimated(true)
                    }else if jsonResult["success"].stringValue=="isexist" {
                        print("已经被注册")
                    }else{
                        print("qita1222")
                    }
                }
        }

        
    }
    
    
    
    
}