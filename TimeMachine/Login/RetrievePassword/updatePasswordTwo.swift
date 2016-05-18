//
//  updatePasswordTwo.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/12.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class updatePasswordTwo: UIViewController {
    var passwordFeild:UITextField? //密码框
    var passwordFeildToo:UITextField? //重复密码框
    var btnSubmit:UIButton?         //提交按钮
    
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="修改密码"
        initView();
    }
    //初始化UI控件
    func initView(){
        layout();
    }
    //ui布局
    func layout(){
        //密码输入框
        passwordFeild=UITextField()
        passwordFeild?.frame=CGRectMake(0, 100, screen.width, 40)
        passwordFeild?.backgroundColor=UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        passwordFeild?.placeholder="密码（6-20数字或字母）"
        passwordFeild?.secureTextEntry=true
        self.view.addSubview(passwordFeild!)
        //重复密码框
        passwordFeildToo=UITextField()
        passwordFeildToo?.frame=CGRectMake(0, CGRectGetMaxY(passwordFeild!.frame)+15, screen.width, 40)
        passwordFeildToo?.backgroundColor=UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        passwordFeildToo?.placeholder="再一次输入密码"
        passwordFeildToo?.secureTextEntry=true
        self.view.addSubview(passwordFeildToo!)
        //提交按钮
        btnSubmit=UIButton()
        btnSubmit?.frame=CGRectMake(20, CGRectGetMaxY(passwordFeildToo!.frame)+20, screen.width-40, 40)
        btnSubmit!.backgroundColor=UIColor(red: 0.32, green: 0.61, blue: 0.61, alpha: 1)
        btnSubmit!.setTitle("提交", forState: UIControlState.Normal)
        btnSubmit!.addTarget(self, action: "clickBtnSubmit:", forControlEvents: UIControlEvents.TouchUpInside)
        btnSubmit?.layer.cornerRadius=CGRectGetHeight(btnSubmit!.frame)/2
        self.view.addSubview(btnSubmit!)
    }
    // 点击提交按钮事件
    func clickBtnSubmit(sender:UIButton){
        
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    
    
}