//
//  FamilyCreation.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/12.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class FamilyCreation:UIViewController {
    var memberEntity:personalInfoEntity?
    var viewWarp:UIView!    //父视图
    var familyLabel:UILabel!    //家庭名字标签
    var familyName:UITextField? //家庭名字输入框
    var btnNext:UIButton!       //下一步按钮
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
    }
    //初始化UI控件
    func initView(){
        self.title="创建家庭"
        self.view.backgroundColor=UIColor.whiteColor()
        layout();
    }
    //布局
    func layout(){
        //父视图
        viewWarp=UIView()
        viewWarp.frame=CGRectMake(0, 64, screen.width, screen.height)
        self.view.addSubview(viewWarp)
        //家庭名字标签
        let leftView=UIView()
        leftView.frame=CGRectMake(0, 0, 100, 40)
        familyLabel=UILabel()
        familyLabel.frame=CGRectMake(10, 0, 80, 40)
        familyLabel.text="家庭名字:"
        leftView.addSubview(familyLabel)
        //家庭名字输入框
        familyName=UITextField()
        familyName?.frame=CGRectMake(-1, 20, screen.width+2, 40)
        familyName?.leftView=leftView
        familyName?.layer.borderWidth=1
        familyName?.layer.borderColor=UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1).CGColor
        familyName?.leftViewMode=UITextFieldViewMode.Always
        familyName?.clearButtonMode=UITextFieldViewMode.Always
        familyName?.placeholder="设置家庭名字"
        viewWarp.addSubview(familyName!)
        
        
        //提醒的文字
        let Remind:UILabel=UILabel()
        Remind.frame=CGRectMake(10, CGRectGetMaxY(familyName!.frame)+20, screen.width, 20)
        Remind.text="如：卢蛋蛋大傻逼的幸福一家"
        Remind.font=UIFont.systemFontOfSize(14)
        viewWarp.addSubview(Remind)
        let Explain:UILabel=UILabel()
        Explain.frame=CGRectMake(10, CGRectGetMaxY(Remind.frame)+10, screen.width-10, 20)
        Explain.text="说明：创建账号后您的帐号成为此家庭的主账号"
        Explain.font=UIFont.systemFontOfSize(14)
        viewWarp.addSubview(Explain)
        //下一步按钮
        btnNext=UIButton()
        btnNext.frame=CGRectMake(10, CGRectGetMaxY(Explain.frame)+40, screen.width-20, 40)
        btnNext.setTitle("下一步", forState: UIControlState.Normal)
        btnNext.layer.cornerRadius=CGRectGetHeight(btnNext.frame)/2
        btnNext.addTarget(self, action: "cilckBtnNext:", forControlEvents: UIControlEvents.TouchUpInside)
        btnNext.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        viewWarp.addSubview(btnNext)
    }
    //点击下一步按钮
    func cilckBtnNext(sender:UIButton){
        let Jump=FamilyCreationToo()
        Jump.memberEntity=self.memberEntity
        self.navigationController?.pushViewController(Jump, animated: true)
    }
}