//
//  addPeople.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/13.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class addPeople: UIViewController {
    var memberEntity:personalInfoEntity?
    ///已有账号 按钮
    var btnYes:UIButton!
    ///没有账号 按钮
    var btnNo:UIButton!
    ///滚动父容器
    var viewWarp:UIScrollView!
    ///上部父容器
    var upView:UIView!
    ///下部父容器1
    var downViewOne:UIView!
    ///下部父容器2
    var downViewTwo:UIView!
    ///账号输入框
    var accoudFeild:UITextField?
    ///长辈选择按钮
    var btnElder:UIButton!
    ///平辈选择按钮
    var btnPeers:UIButton!
    ///未婚选择按钮
    var btnUnmarried:UIButton!
    ///已婚选择按钮
    var btnMarried:UIButton!
    ///昵称输入框
    var nicknameFeild:UITextField?
    ///文本视图
    var infoView:UITextView?
    ///确定按钮
    var btnTrue:UIButton!
    //2222222
    ///2账号输入框
    var accoudFeild1:UITextField?
    ///2长辈选择按钮
    var btnElder1:UIButton!
    ///2平辈选择按钮
    var btnPeers1:UIButton!
    ///2未婚选择按钮
    var btnUnmarried1:UIButton!
    ///2已婚选择按钮
    var btnMarried1:UIButton!
    ///2昵称输入框
    var nicknameFeild1:UITextField?
    ///2文本视图
    var infoView1:UITextView?
    ///2确定按钮
    var btnTrue1:UIButton!
    ///姓名输入框
    var accoudFeild2:UITextField?
    ///2男选择按钮
    var btnMan:UIButton!
    ///2女选择按钮
    var btnWomen:UIButton!
    
    
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
        downViewTwo.hidden=true
    }
    // 初始化UI控件
    func initView(){
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="添加成员"
        layout();
        upLayout()
        downLayoutOne();
        downLayoutTwo();
    }
    ///初始化滚动父容器
    func layout(){
        viewWarp = UIScrollView()
        viewWarp.frame=CGRectMake(0, 0, screen.width, screen.height)
        viewWarp.contentSize=CGSizeMake(screen.width, screen.height)
        viewWarp.showsVerticalScrollIndicator=false
        self.view.addSubview(viewWarp)
    }
    //上部布局
    func upLayout(){
        //初始化上部父视图
        upView=UIView()
        upView.frame=CGRectMake(0, 10, screen.width, 40)
        viewWarp.addSubview(upView)
        ///已有账号 按钮
        btnYes=UIButton()
        btnYes.frame=CGRectMake(30, 5, screen.width/2-30, 30)
        btnYes.setTitle("已有时光机账号", forState: UIControlState.Normal)
        btnYes.titleLabel?.font=UIFont.systemFontOfSize(14)
        btnYes.setBackgroundImage(UIImage(named: "familyHuise.jpg"), forState: UIControlState.Normal)
        btnYes.setBackgroundImage(UIImage(named: "familyLvse.jpg"), forState: UIControlState.Selected)
        btnYes.layer.cornerRadius=15
        btnYes.layer.masksToBounds=true
        btnYes.selected=true
        btnYes.tag=10
        btnYes.addTarget(self, action: "clickBtnYesOrNo:", forControlEvents: UIControlEvents.TouchUpInside)
        upView.addSubview(btnYes)
        ///没有账号 按钮
        btnNo=UIButton()
        btnNo.frame=CGRectMake(CGRectGetMaxX(btnYes.frame), 5, screen.width/2-30, 30)
        btnNo.setTitle("没有时光机账号", forState: UIControlState.Normal)
        btnNo.setBackgroundImage(UIImage(named: "familyHuise.jpg"), forState: UIControlState.Normal)
        btnNo.setBackgroundImage(UIImage(named: "familyLvse.jpg"), forState: UIControlState.Selected)
        btnNo.titleLabel?.font=UIFont.systemFontOfSize(14)
        btnNo.layer.cornerRadius=15
        btnNo.layer.masksToBounds=true
        btnNo.selected=false
        btnNo.tag=20
        btnNo.addTarget(self, action: "clickBtnYesOrNo:", forControlEvents: UIControlEvents.TouchUpInside)
        upView.addSubview(btnNo)
    }
    //下部布局
    func downLayoutOne(){
        downViewOne=UIView()
        downViewOne.frame=CGRectMake(0, CGRectGetMaxY(upView.frame), screen.width, screen.height-CGRectGetMaxY(upView.frame))
        viewWarp.addSubview(downViewOne)
        //标签1
        let viewOne=UIView()
        viewOne.frame=CGRectMake(-1, 0, screen.width+2, 40)
        viewOne.layer.borderWidth=1
        viewOne.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewOne.addSubview(viewOne)
        let labelOne:UILabel=UILabel()
        labelOne.frame=CGRectMake(10, 10, 50, 20)
        labelOne.text="账号"
        viewOne.addSubview(labelOne)
        ///账号输入框
        accoudFeild=UITextField()
        accoudFeild?.frame=CGRectMake(CGRectGetMaxX(labelOne.frame), 10, screen.width-CGRectGetMaxX(labelOne.frame)-20, 20)
        accoudFeild?.placeholder="请输入对方的手机号码"
        accoudFeild?.clearButtonMode=UITextFieldViewMode.Always
        accoudFeild?.font=UIFont.systemFontOfSize(14)
        viewOne.addSubview(accoudFeild!)
        
        
        
        //标签2
        let viewTwo=UIView()
        viewTwo.frame=CGRectMake(-1, CGRectGetMaxY(viewOne.frame)-1, screen.width+2, 40)
        viewTwo.layer.borderWidth=1
        viewTwo.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewOne.addSubview(viewTwo)
        let labelTwo:UILabel=UILabel()
        labelTwo.frame=CGRectMake(10, 10, 50, 20)
        labelTwo.text="辈分"
        viewTwo.addSubview(labelTwo)
        ///长辈选择按钮
        btnElder=UIButton()
        btnElder.frame=CGRectMake(CGRectGetMaxX(labelTwo.frame), 10, 20, 20)
        btnElder.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnElder.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnElder.tag=11
        btnElder.addTarget(self, action: "clickBtnElderOrPeers:", forControlEvents: UIControlEvents.TouchUpInside)
        btnElder.selected=false
        viewTwo.addSubview(btnElder)
        ///长辈 标签
        let elderText:UILabel=UILabel()
        elderText.frame=CGRectMake(CGRectGetMaxX(btnElder.frame)+10, 10, 40, 20)
        elderText.text="长辈"
        elderText.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewTwo.addSubview(elderText)
        ///平辈选择按钮
        btnPeers=UIButton()
        btnPeers.frame=CGRectMake(CGRectGetMaxX(elderText.frame)+10, 10, 20, 20)
        btnPeers.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnPeers.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnPeers.tag=22
        btnPeers.addTarget(self, action: "clickBtnElderOrPeers:", forControlEvents: UIControlEvents.TouchUpInside)
        btnPeers.selected=true
        viewTwo.addSubview(btnPeers)
        ///平辈 标签
        let peersText:UILabel=UILabel()
        peersText.frame=CGRectMake(CGRectGetMaxX(btnPeers.frame)+10, 10, 40, 20)
        peersText.text="平辈"
        peersText.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewTwo.addSubview(peersText)
        
        //标签3
        let viewThree=UIView()
        viewThree.frame=CGRectMake(-1, CGRectGetMaxY(viewTwo.frame)-1, screen.width+2, 40)
        viewThree.layer.borderWidth=1
        viewThree.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewOne.addSubview(viewThree)
        let labelThree:UILabel=UILabel()
        labelThree.frame=CGRectMake(10, 10, 50, 20)
        labelThree.text="昵称"
        viewThree.addSubview(labelThree)
        ///昵称输入框
        nicknameFeild=UITextField()
        nicknameFeild?.frame=CGRectMake(CGRectGetMaxX(labelThree.frame), 10, screen.width-CGRectGetMaxX(labelOne.frame)-20, 20)
        nicknameFeild?.placeholder="请输入对方的昵称"
        nicknameFeild?.clearButtonMode=UITextFieldViewMode.Always
        nicknameFeild?.font=UIFont.systemFontOfSize(14)
        viewThree.addSubview(nicknameFeild!)
        //标签4
        let viewFour=UIView()
        viewFour.frame=CGRectMake(-1, CGRectGetMaxY(viewThree.frame)-1, screen.width+2, 40)
        viewFour.layer.borderWidth=1
        viewFour.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewOne.addSubview(viewFour)
        let labelFour:UILabel=UILabel()
        labelFour.frame=CGRectMake(10, 10, 50, 20)
        labelFour.text="婚配"
        viewFour.addSubview(labelFour)
        ///未婚选择按钮
        btnUnmarried=UIButton()
        btnUnmarried.frame=CGRectMake(CGRectGetMaxX(labelTwo.frame), 10, 20, 20)
        btnUnmarried.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnUnmarried.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnUnmarried.tag=33
        btnUnmarried.addTarget(self, action: "clickbtnUnmarried:", forControlEvents: UIControlEvents.TouchUpInside)
        btnUnmarried.selected=false
        viewFour.addSubview(btnUnmarried)
        ///未婚 标签
        let UnmarriedText:UILabel=UILabel()
        UnmarriedText.frame=CGRectMake(CGRectGetMaxX(btnElder.frame)+10, 10, 40, 20)
        UnmarriedText.text="未婚"
        UnmarriedText.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewFour.addSubview(UnmarriedText)
        ///已婚选择按钮
        btnMarried=UIButton()
        btnMarried.frame=CGRectMake(CGRectGetMaxX(elderText.frame)+10, 10, 20, 20)
        btnMarried.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnMarried.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnMarried.tag=44
        btnMarried.addTarget(self, action: "clickbtnUnmarried:", forControlEvents: UIControlEvents.TouchUpInside)
        btnMarried.selected=true
        viewFour.addSubview(btnMarried)
        ///已婚 标签
        let MarriedText:UILabel=UILabel()
        MarriedText.frame=CGRectMake(CGRectGetMaxX(btnPeers.frame)+10, 10, 40, 20)
        MarriedText.text="已婚"
        MarriedText.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewFour.addSubview(MarriedText)
        ///文本视图
        infoView=UITextView()
        infoView?.frame=CGRectMake(10, CGRectGetMaxY(viewFour.frame)+20, screen.width-20, 80)
        infoView?.text="输入你的验证信息，以便对方确定你的身份"
        
        infoView?.layer.borderWidth=1
        infoView?.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewOne.addSubview(infoView!)
        ///确定按钮
        btnTrue=UIButton()
        btnTrue.frame=CGRectMake(20, CGRectGetMaxY(infoView!.frame)+30, screen.width-40, 40)
        btnTrue.setTitle("确定提交", forState: UIControlState.Normal)
        btnTrue.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        btnTrue.layer.cornerRadius=20
        btnTrue.addTarget(self, action: "clickBtnTrue:", forControlEvents: UIControlEvents.TouchUpInside)
        downViewOne.addSubview(btnTrue)
        
    }
    
    //点击选择有无账号按钮
    func clickBtnYesOrNo(sender:UIButton){
        if sender.tag==10{
            downViewTwo.hidden=true
            downViewOne.hidden=false
            btnYes.selected=true
            btnNo.selected=false
            
        }else{
            downViewOne.hidden=true
            downViewTwo.hidden=false
            btnYes.selected=false
            btnNo.selected=true

        }
        
    }
    //1 点击选择辈分按钮 1
    func clickBtnElderOrPeers(sender:UIButton){
        if sender.tag==11{
            btnElder.selected=false
            btnPeers.selected=true
        }else{
            btnElder.selected=true
            btnPeers.selected=false

        }
    }
    //1 点击有无婚配按钮
    func clickbtnUnmarried(sender:UIButton){
        if sender.tag==33{
            btnUnmarried.selected=false
            btnMarried.selected=true
        }else{
            btnUnmarried.selected=true
            btnMarried.selected=false
        }
        
    }
    //1 点击确定提交按钮
    func clickBtnTrue(sender:UIButton){
        self.navigationController?.popViewControllerAnimated(true)
    }
    ///下部父容器2
    func downLayoutTwo(){
        downViewTwo=UIView()
        downViewTwo.frame=CGRectMake(0, CGRectGetMaxY(upView.frame), screen.width, screen.height-CGRectGetMaxY(upView.frame))
        viewWarp.addSubview(downViewTwo)
        //标签1.1
        let viewOne2=UIView()
        viewOne2.frame=CGRectMake(-1, 0, screen.width+2, 40)
        viewOne2.layer.borderWidth=1
        viewOne2.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(viewOne2)
        let labelOne2:UILabel=UILabel()
        labelOne2.frame=CGRectMake(10, 10, 50, 20)
        labelOne2.text="姓名"
        viewOne2.addSubview(labelOne2)
        ///姓名输入框
        accoudFeild2=UITextField()
        accoudFeild2?.frame=CGRectMake(CGRectGetMaxX(labelOne2.frame), 10, screen.width-CGRectGetMaxX(labelOne2.frame)-20, 20)
        accoudFeild2?.placeholder="请输入对方的姓名"
        accoudFeild2?.clearButtonMode=UITextFieldViewMode.Always
        accoudFeild2?.font=UIFont.systemFontOfSize(14)
        viewOne2.addSubview(accoudFeild2!)
        //标签1.2
        let viewOne1=UIView()
        viewOne1.frame=CGRectMake(-1, CGRectGetMaxY(viewOne2.frame)-1, screen.width+2, 40)
        viewOne1.layer.borderWidth=1
        viewOne1.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(viewOne1)
        let labelOne1:UILabel=UILabel()
        labelOne1.frame=CGRectMake(10, 10, 50, 20)
        labelOne1.text="手机"
        viewOne1.addSubview(labelOne1)
        ///账号输入框
        accoudFeild1=UITextField()
        accoudFeild1?.frame=CGRectMake(CGRectGetMaxX(labelOne1.frame), 10, screen.width-CGRectGetMaxX(labelOne1.frame)-20, 20)
        accoudFeild1?.placeholder="请输入对方的手机号码"
        accoudFeild1?.clearButtonMode=UITextFieldViewMode.Always
        accoudFeild1?.font=UIFont.systemFontOfSize(14)
        viewOne1.addSubview(accoudFeild1!)

        
        
        
        //标签2
        let viewTwo1=UIView()
        viewTwo1.frame=CGRectMake(-1, CGRectGetMaxY(viewOne1.frame)-1, screen.width+2, 40)
        viewTwo1.layer.borderWidth=1
        viewTwo1.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(viewTwo1)
        let labelTwo1:UILabel=UILabel()
        labelTwo1.frame=CGRectMake(10, 10, 50, 20)
        labelTwo1.text="辈分"
        viewTwo1.addSubview(labelTwo1)
        ///长辈选择按钮
        btnElder1=UIButton()
        btnElder1.frame=CGRectMake(CGRectGetMaxX(labelTwo1.frame), 10, 20, 20)
        btnElder1.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnElder1.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnElder1.tag=15
        btnElder1.addTarget(self, action: "clickBtnElderOrPeers1:", forControlEvents: UIControlEvents.TouchUpInside)
        btnElder1.selected=false
        viewTwo1.addSubview(btnElder1)
        ///长辈 标签
        let elderText1:UILabel=UILabel()
        elderText1.frame=CGRectMake(CGRectGetMaxX(btnElder1.frame)+10, 10, 40, 20)
        elderText1.text="长辈"
        elderText1.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewTwo1.addSubview(elderText1)
        ///平辈选择按钮
        btnPeers1=UIButton()
        btnPeers1.frame=CGRectMake(CGRectGetMaxX(elderText1.frame)+10, 10, 20, 20)
        btnPeers1.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnPeers1.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnPeers1.tag=25
        btnPeers1.addTarget(self, action: "clickBtnElderOrPeers1:", forControlEvents: UIControlEvents.TouchUpInside)
        btnPeers1.selected=true
        viewTwo1.addSubview(btnPeers1)
        ///平辈 标签
        let peersText1:UILabel=UILabel()
        peersText1.frame=CGRectMake(CGRectGetMaxX(btnPeers1.frame)+10, 10, 40, 20)
        peersText1.text="平辈"
        peersText1.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewTwo1.addSubview(peersText1)
        
        //标签3
        let viewThree1=UIView()
        viewThree1.frame=CGRectMake(-1, CGRectGetMaxY(viewTwo1.frame)-1, screen.width+2, 40)
        viewThree1.layer.borderWidth=1
        viewThree1.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(viewThree1)
        let labelThree1:UILabel=UILabel()
        labelThree1.frame=CGRectMake(10, 10, 50, 20)
        labelThree1.text="昵称"
        viewThree1.addSubview(labelThree1)
        ///昵称输入框
        nicknameFeild1=UITextField()
        nicknameFeild1?.frame=CGRectMake(CGRectGetMaxX(labelThree1.frame), 10, screen.width-CGRectGetMaxX(labelOne1.frame)-20, 20)
        nicknameFeild1?.placeholder="请输入对方的昵称"
        nicknameFeild1?.clearButtonMode=UITextFieldViewMode.Always
        nicknameFeild1?.font=UIFont.systemFontOfSize(14)
        viewThree1.addSubview(nicknameFeild1!)
        //标签4
        let viewFour2=UIView()
        viewFour2.frame=CGRectMake(-1, CGRectGetMaxY(viewThree1.frame)-1, screen.width+2, 40)
        viewFour2.layer.borderWidth=1
        viewFour2.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(viewFour2)
        let labelFour2:UILabel=UILabel()
        labelFour2.frame=CGRectMake(10, 10, 50, 20)
        labelFour2.text="性别"
        viewFour2.addSubview(labelFour2)
        ///男选择按钮
        btnMan=UIButton()
        btnMan.frame=CGRectMake(CGRectGetMaxX(labelTwo1.frame), 10, 20, 20)
        btnMan.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnMan.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnMan.tag=13
        btnMan.addTarget(self, action: "btnSex:", forControlEvents: UIControlEvents.TouchUpInside)
        btnMan.selected=false
        viewFour2.addSubview(btnMan)
        ///男 标签
        let ManText1:UILabel=UILabel()
        ManText1.frame=CGRectMake(CGRectGetMaxX(btnElder1.frame)+10, 10, 40, 20)
        ManText1.text="男"
        ManText1.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewFour2.addSubview(ManText1)
        ///女选择按钮
        btnWomen=UIButton()
        btnWomen.frame=CGRectMake(CGRectGetMaxX(elderText1.frame)+10, 10, 20, 20)
        btnWomen.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnWomen.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnWomen.tag=23
        btnWomen.addTarget(self, action: "btnSex:", forControlEvents: UIControlEvents.TouchUpInside)
        btnWomen.selected=true
        viewFour2.addSubview(btnWomen)
        ///女 标签
        let womenText1:UILabel=UILabel()
        womenText1.frame=CGRectMake(CGRectGetMaxX(btnPeers1.frame)+10, 10, 40, 20)
        womenText1.text="女"
        womenText1.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewFour2.addSubview(womenText1)

        //标签4
        let viewFour1=UIView()
        viewFour1.frame=CGRectMake(-1, CGRectGetMaxY(viewFour2.frame)-1, screen.width+2, 40)
        viewFour1.layer.borderWidth=1
        viewFour1.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(viewFour1)
        let labelFour1:UILabel=UILabel()
        labelFour1.frame=CGRectMake(10, 10, 50, 20)
        labelFour1.text="婚配"
        viewFour1.addSubview(labelFour1)
        ///未婚选择按钮
        btnUnmarried1=UIButton()
        btnUnmarried1.frame=CGRectMake(CGRectGetMaxX(labelTwo1.frame), 10, 20, 20)
        btnUnmarried1.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnUnmarried1.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnUnmarried1.tag=35
        btnUnmarried1.addTarget(self, action: "clickbtnUnmarried1:", forControlEvents: UIControlEvents.TouchUpInside)
        btnUnmarried1.selected=false
        viewFour1.addSubview(btnUnmarried1)
        ///未婚 标签
        let UnmarriedText1:UILabel=UILabel()
        UnmarriedText1.frame=CGRectMake(CGRectGetMaxX(btnElder1.frame)+10, 10, 40, 20)
        UnmarriedText1.text="未婚"
        UnmarriedText1.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewFour1.addSubview(UnmarriedText1)
        ///已婚选择按钮
        btnMarried1=UIButton()
        btnMarried1.frame=CGRectMake(CGRectGetMaxX(elderText1.frame)+10, 10, 20, 20)
        btnMarried1.setBackgroundImage(UIImage(named: "iconfont-success.png") , forState: UIControlState.Normal)
        btnMarried1.setBackgroundImage(UIImage(named: "iconfont-round.png"), forState: UIControlState.Selected)
        btnMarried1.tag=45
        btnMarried1.addTarget(self, action: "clickbtnUnmarried1:", forControlEvents: UIControlEvents.TouchUpInside)
        btnMarried1.selected=true
        viewFour1.addSubview(btnMarried1)
        ///已婚 标签
        let MarriedText1:UILabel=UILabel()
        MarriedText1.frame=CGRectMake(CGRectGetMaxX(btnPeers1.frame)+10, 10, 40, 20)
        MarriedText1.text="已婚"
        MarriedText1.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        viewFour1.addSubview(MarriedText1)
        ///文本视图
        infoView1=UITextView()
        infoView1?.frame=CGRectMake(10, CGRectGetMaxY(viewFour1.frame)+20, screen.width-20, 80)
        infoView1?.text="输入你的验证信息，以便对方确定你的身份"
        
        infoView1?.layer.borderWidth=1
        infoView1?.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        downViewTwo.addSubview(infoView1!)
        ///确定按钮
        btnTrue1=UIButton()
        btnTrue1.frame=CGRectMake(20, CGRectGetMaxY(infoView1!.frame)+30, screen.width-40, 40)
        btnTrue1.setTitle("确定提交", forState: UIControlState.Normal)
        btnTrue1.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        btnTrue1.layer.cornerRadius=20
        btnTrue1.addTarget(self, action: "clickBtnTrue:", forControlEvents: UIControlEvents.TouchUpInside)
        downViewTwo.addSubview(btnTrue1)
        
    }
    

    //1 点击选择辈分按钮 1
    func clickBtnElderOrPeers1(sender:UIButton){
        if sender.tag==15{
            btnElder1.selected=false
            btnPeers1.selected=true
        }else{
            btnElder1.selected=true
            btnPeers1.selected=false
            
        }
    }
    //点击  性别选择
    func btnSex(sender:UIButton){
        if sender.tag==13{
            btnMan.selected=false
            btnWomen.selected=true
        }else{
            btnMan.selected=true
            btnWomen.selected=false
        }
    }
    
    //1 点击有无婚配按钮
    func clickbtnUnmarried1(sender:UIButton){
        if sender.tag==35{
            btnUnmarried1.selected=false
            btnMarried1.selected=true
        }else{
            btnUnmarried1.selected=true
            btnMarried1.selected=false
        }
        
    }
    //1 点击确定提交按钮
    func clickBtnTrue1(sender:UIButton){
        self.navigationController?.popViewControllerAnimated(true)
    }
}
