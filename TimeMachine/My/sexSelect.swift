//
//  sexSelect.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/11.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class sexSelect:UIViewController {
    var btnMan:UIButton!   //男按钮
    var memberEntity:personalInfoEntity?
    var btnWomen:UIButton! //女按钮
    var btnSubmit:UIButton!//提交按钮
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    //初始化UI控件
    func initView(){
        self.view.backgroundColor=UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        btnSex();
    }
    //男女按钮
    func btnSex(){
        btnMan=UIButton()
        btnMan.frame=CGRectMake(0,100, screen.width, 40)
        btnMan.setTitle("男", forState: UIControlState.Normal)
        btnMan.tag=10
        btnMan.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnMan.setBackgroundImage(UIImage(named: "baiseBg.jpg"), forState: UIControlState.Normal)
        btnMan.setBackgroundImage(UIImage(named: "lvseBg.jpg"), forState: UIControlState.Selected)
        btnMan.addTarget(self, action: "sexSelect:", forControlEvents: UIControlEvents.TouchUpInside)
        btnMan.selected=true
        self.view.addSubview(btnMan)
        btnWomen=UIButton()
        btnWomen.frame=CGRectMake(0, CGRectGetMaxY(btnMan.frame)+30, screen.width, 40)
        btnWomen.setTitle("女", forState: UIControlState.Normal)
        btnWomen.tag=20
        btnWomen.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnWomen.setBackgroundImage(UIImage(named: "baiseBg.jpg"), forState: UIControlState.Normal)
        btnWomen.setBackgroundImage(UIImage(named: "lvseBg.jpg"), forState: UIControlState.Selected)
        btnWomen.addTarget(self, action: "sexSelect:", forControlEvents: UIControlEvents.TouchUpInside)
        btnWomen.selected=false
        self.view.addSubview(btnWomen)
        btnSubmit=UIButton()
        btnSubmit.frame=CGRectMake(10, CGRectGetMaxY(btnWomen.frame)+50, screen.width-20, 50)
        btnSubmit.backgroundColor=UIColor(red: 0.32, green: 0.60, blue: 0.64, alpha: 1)
        btnSubmit.setTitle("提交", forState: UIControlState.Normal)
        btnSubmit.layer.cornerRadius=5
        btnSubmit.addTarget(self, action: "ClickSubmit:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnSubmit)
        
    }
    //选择性别
    func sexSelect(sender:UIButton){
        if sender.tag == 10 {
            btnMan.selected=true
            btnWomen.selected=false
            memberEntity?.sex="男"
        }else{
            btnMan.selected=false
            btnWomen.selected=true
            memberEntity?.sex="女"
        }
    }
    //点击提交按钮
    func ClickSubmit(sender:UIButton){
        NSNotificationCenter.defaultCenter().postNotificationName("nickNameNotification", object: memberEntity);
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}