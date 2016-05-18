//
//  UpdateNickname.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/9.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class UpdateNickname: UIViewController {
    
    var nicknameLabel:UITextField!          //修改名字输入框
    var memberEntity:personalInfoEntity?
    
    
    
    //页面加载
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
        
    }
    //初始化UI控件
    func initView(){
        self.title="修改名字"
        self.view.backgroundColor=UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        pageLayout();
    }
    //页面布局
    func pageLayout(){
        //输入框
        nicknameLabel=UITextField()
        
        nicknameLabel.frame=CGRectMake(0, 80, screen.width, 40)
        
        nicknameLabel.addTarget(self, action: "updataNick:", forControlEvents: UIControlEvents.EditingChanged)

        nicknameLabel.text=memberEntity?.nickName
        nicknameLabel.clearButtonMode=UITextFieldViewMode.Always
        nicknameLabel.backgroundColor=UIColor.whiteColor()
        self.view.addSubview(nicknameLabel)
        //保存按钮
        let saveBtn:UIButton=UIButton()
        saveBtn.frame=CGRectMake(0, CGRectGetMaxY(nicknameLabel.frame)+30, screen.width, 40)
        saveBtn.setTitle("保存", forState: UIControlState.Normal)
        saveBtn.backgroundColor=UIColor.whiteColor()
        saveBtn.addTarget(self, action: "clickSaveBtn:", forControlEvents: UIControlEvents.TouchUpInside)
    
        saveBtn.setTitleColor(UIColor(red: 0.96, green: 0.64, blue: 0.19, alpha: 1), forState: UIControlState.Normal)
        self.view.addSubview(saveBtn)
        
    }
    func updataNick(sender:UITextField){
        memberEntity?.nickName=sender.text!
    }
    //点击保存按钮
    func clickSaveBtn(sender:UIButton){
        //发送通知
        NSNotificationCenter.defaultCenter().postNotificationName("nickNameNotification", object: memberEntity);
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}
