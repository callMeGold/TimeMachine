//
//  InfoDetails.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/9.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class InfoDetails:UIViewController {
    var viewWarp:UIView!        //信息布局父容器
    
    
    
    
    
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
    }
    //初始化ui控件
    func initView(){
        self.title="信息"
        self.view.backgroundColor=UIColor.whiteColor()
        infoLayout();
    }
    //信息布局
    func infoLayout(){
        //信息布局父容器
        viewWarp=UIView()
        viewWarp.frame=CGRectMake(0, 80, screen.width, screen.height)
        self.view.addSubview(viewWarp)
        //头像
        let headerPic:UIImageView=UIImageView()
        headerPic.frame=CGRectMake(10, 0, 50, 50)
        headerPic.image=UIImage(named: "jiqimao.jpg")
        viewWarp.addSubview(headerPic)
        //昵称标签
        let nicknameText="卢蛋蛋这个傻逼"
        let nicknameTextSize=nicknameText.textSizeWithFont(UIFont.systemFontOfSize(16), constrainedToSize: CGSizeMake(200, 20))
        let nicknameTextW:CGFloat=nicknameTextSize.width
        let nickname:UILabel=UILabel()
        nickname.frame=CGRectMake(CGRectGetMaxX(headerPic.frame)+10, 10, nicknameTextW, 20)
        nickname.text=nicknameText
        nickname.font=UIFont.systemFontOfSize(16)
        viewWarp.addSubview(nickname)
        //性别图标
        let sexPic:UIImageView=UIImageView()
        sexPic.frame=CGRectMake(CGRectGetMaxX(nickname.frame)+10, CGRectGetMinY(nickname.frame), 20, 20)
        sexPic.image=UIImage(named: "man.png")
        viewWarp.addSubview(sexPic)
        //时间
        let InfoTime:UILabel=UILabel()
        InfoTime.frame=CGRectMake(CGRectGetMaxX(headerPic.frame)+10, CGRectGetMaxY(sexPic.frame), 200, 20)
        InfoTime.text="2015年11月11日"
        InfoTime.font=UIFont.systemFontOfSize(14)
        InfoTime.textColor=UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 1)
        viewWarp.addSubview(InfoTime)
        //大框框
        let InfoTextView:UITextView=UITextView()
        InfoTextView.frame=CGRectMake(10, CGRectGetMaxY(InfoTime.frame)+10, screen.width-20, 100)
        InfoTextView.text="卢蛋蛋，我也是傻逼，快点让我加！！！！"
        InfoTextView.layer.borderWidth=0.5
        InfoTextView.layer.borderColor=UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 1).CGColor
        viewWarp.addSubview(InfoTextView)
        //同意按钮
        let AgreeBtn:UIButton=UIButton()
        AgreeBtn.frame=CGRectMake(30, CGRectGetMaxY(InfoTextView.frame)+30, screen.width-60, 40)
        AgreeBtn.layer.cornerRadius=CGRectGetHeight(AgreeBtn.frame)/2
        AgreeBtn.setTitle("同意申请", forState: UIControlState.Normal)
        AgreeBtn.addTarget(self, action: "clickAgreeBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        AgreeBtn.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        viewWarp.addSubview(AgreeBtn)
        //拒绝按钮
        let RefuseBtn:UIButton=UIButton()
        RefuseBtn.frame=CGRectMake(CGRectGetMinX(AgreeBtn.frame), CGRectGetMaxY(AgreeBtn.frame)+10, CGRectGetWidth(AgreeBtn.frame), CGRectGetHeight(AgreeBtn.frame))
        RefuseBtn.layer.cornerRadius=CGRectGetHeight(AgreeBtn.frame)/2
        RefuseBtn.setTitle("拒绝申请", forState: UIControlState.Normal)
        RefuseBtn.addTarget(self, action: "clickRefuseBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        RefuseBtn.backgroundColor=UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        viewWarp.addSubview(RefuseBtn)


        
    }
    //点击同意按钮
    func clickAgreeBtn(sender:UIButton){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    //点击拒绝按钮
    func clickRefuseBtn(sender:UIButton){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
