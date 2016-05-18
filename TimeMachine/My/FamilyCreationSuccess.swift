//
//  FamilyCreationSuccess.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/13.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class FamilyCreationSuccess: UIViewController {
    var memberEntity:personalInfoEntity?
    var scrollView:UIScrollView!        //滚动父视图
    var upView:UIView!                  //上父视图
    var midView:UIView!                 //中父视图
    var downView:UIView!                //下父视图
    var addPeopleLabel:UILabel?         //接下来请添加成员一起记录美好时光吧   标签
    var familyName:UILabel?             //家庭名称
    var familyNumber:UILabel?           //家庭编号
    var familyMasterAccount:UILabel?    //家庭主账号
    var btnTrue:UIButton!               //确定按钮
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
    }
    //初始化UI控件
    func initView(){
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="创建家庭"
        layout();
        UpLayou();
        MidLayou();
        DownLayou();
        
    }
    //布局
    func layout(){
        //初始化滚动父视图
        scrollView=UIScrollView()
        scrollView.frame=CGRectMake(0, 0, screen.width, screen.height)
        scrollView.contentSize=CGSizeMake(screen.width, screen.height)
        scrollView.showsVerticalScrollIndicator=false
        self.view.addSubview(scrollView)
        
    }
    //上部 布局
    func UpLayou(){
        //初始化上部父视图
        upView=UIView()
        upView.frame=CGRectMake(0, 0, screen.width, 100)
        scrollView.addSubview(upView)
        //恭喜您已成功创建家庭 标签
        let successLabel:UILabel=UILabel()
        successLabel.frame=CGRectMake(0, 40, screen.width, 20)
        successLabel.text="恭喜您已成功创建家庭"
        successLabel.font=UIFont.systemFontOfSize(18)
        successLabel.textAlignment=NSTextAlignment.Center
        upView.addSubview(successLabel)
        //接下来请添加成员一起记录美好时光吧   标签
        addPeopleLabel=UILabel()
        addPeopleLabel?.frame=CGRectMake(0, CGRectGetMaxY(successLabel.frame)+10, screen.width, 20)
        addPeopleLabel?.text="接下来请添加成员一起记录美好时光吧"
        addPeopleLabel?.textAlignment=NSTextAlignment.Center
        addPeopleLabel?.textColor=UIColor(red: 0.33, green: 0.66, blue: 0.89, alpha: 1)
        addPeopleLabel?.userInteractionEnabled=true
        addPeopleLabel?.font=UIFont.systemFontOfSize(14)
        let tap=UITapGestureRecognizer(target: self, action:"clickAdd" )
        addPeopleLabel?.addGestureRecognizer(tap)
        upView.addSubview(addPeopleLabel!)

        
        
    }
    //中部 布局
    func MidLayou(){
        //初始化中部父视图
        midView=UIView()
        midView.frame=CGRectMake(10, CGRectGetMaxY(upView.frame), screen.width-20, 150)
        scrollView.addSubview(midView)
        //设置背景图
        let BgImge:UIImageView=UIImageView()
        BgImge.frame=CGRectMake(0, 0, CGRectGetWidth(midView.frame), CGRectGetHeight(midView.frame))
        BgImge.image=UIImage(named: "meinv.jpg")
        midView.addSubview(BgImge)
        //家庭名称。。标签
        familyName=UILabel()
        familyName?.frame=CGRectMake(0, 50, CGRectGetWidth(midView.frame), 20)
        familyName?.text="家庭名称："+"卢蛋蛋大傻逼"+"幸福的一家"
        familyName?.font=UIFont.systemFontOfSize(16)
        familyName?.textAlignment=NSTextAlignment.Center
        familyName?.textColor=UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)
        midView.addSubview(familyName!)
        //家庭编号
        familyNumber=UILabel()
        familyNumber?.frame=CGRectMake(0, CGRectGetMaxY(familyName!.frame)+5, CGRectGetWidth(midView.frame), 20)
        familyNumber?.text="家庭编号："+"898989"
        familyNumber?.font=UIFont.systemFontOfSize(16)
        familyNumber?.textAlignment=NSTextAlignment.Center
        familyNumber?.textColor=UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)
        midView.addSubview(familyNumber!)
        
        //家庭主账号
        familyMasterAccount=UILabel()
        familyMasterAccount?.frame=CGRectMake(0, CGRectGetMaxY(familyNumber!.frame)+5, CGRectGetWidth(midView.frame), 20)
        familyMasterAccount?.text="家庭主账号及姓名："+"卢蛋蛋大傻逼"
        familyMasterAccount?.font=UIFont.systemFontOfSize(16)
        familyMasterAccount?.textAlignment=NSTextAlignment.Center
        familyMasterAccount?.textColor=UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)
        midView.addSubview(familyMasterAccount!)

        
    }
    //下部 布局
    func DownLayou(){
        //初始化下部父视图
        downView=UIView()
        downView.frame=CGRectMake(0, CGRectGetMaxY(midView.frame), screen.width, 100)
        scrollView.addSubview(downView)
        //确定按钮
        btnTrue=UIButton()
        btnTrue.frame=CGRectMake(10, 40, screen.width-20, 40)
        btnTrue.setTitle("确定", forState: UIControlState.Normal)
        btnTrue.layer.cornerRadius=CGRectGetHeight(btnTrue.frame)/2
        btnTrue.addTarget(self, action: "cilckBtnTrue:", forControlEvents: UIControlEvents.TouchUpInside)
        btnTrue.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        downView.addSubview(btnTrue)
        
    }
    //点击   接下来请添加成员一起记录美好时光吧标签  事件
    func clickAdd(){
        let Jump=addPeople()
        Jump.memberEntity=self.memberEntity
        self.navigationController?.pushViewController(Jump, animated: true)

    }
    //点击确定按钮
    func cilckBtnTrue(sender:UIButton){
        let Jump=FamilyManagement()
        self.navigationController?.pushViewController(Jump, animated: true)
    }

}