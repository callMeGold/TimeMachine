//
//  FamilyCreationToo.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/13.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class FamilyCreationToo: UIViewController {
    var memberEntity:personalInfoEntity?
    var viewWarp:UIView!            //父视图
    var familyFather:UIView!       //父系家庭标签
    var familyFatherFeild:UITextField?      //父系家庭编号搜索框
    
    var familyMother:UIView!       //母系家庭标签
    var familyMotherFeild:UITextField?      //母系家庭编号搜索
    var btnNext:UIButton!           //下一步按钮
    
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    //初始化UI控件
    func initView(){
        self.title="创建家庭"
        self.view.backgroundColor=UIColor.whiteColor()
        layou();
    }
    //页面布局
    func layou(){
        //容器父视图
        viewWarp=UIView()
        viewWarp.frame=CGRectMake(0, 64, screen.width, screen.height)
        self.view.addSubview(viewWarp)
        
        //父系家庭父视图
        familyFather=UIView()
        familyFather.frame=CGRectMake(-1, 10, screen.width+2, 60)
        familyFather.layer.borderWidth=1
        familyFather.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        viewWarp.addSubview(familyFather)
        //父系家庭标签
        let familyFatherLable:UILabel=UILabel()
        familyFatherLable.frame=CGRectMake(10, 20, 80, 20)
        familyFatherLable.text="父系家庭"
        familyFather.addSubview(familyFatherLable)
        //父系家庭编号搜索框
        let seachView=UIView()
        seachView.frame=CGRectMake(0, 0, 30, 30)
        let seachImage:UIImageView=UIImageView()
        seachImage.frame=CGRectMake(5, 5, 20, 20)
        seachImage.image=UIImage(named: "iconfont-miaojiesellersearch.png")
        seachView.addSubview(seachImage)
        familyFatherFeild=UITextField()
        familyFatherFeild?.frame=CGRectMake(CGRectGetMaxX(familyFatherLable.frame), 15, screen.width-CGRectGetMaxX(familyFatherLable.frame)-15, 30)
        familyFatherFeild?.leftView=seachView
        familyFatherFeild?.clearButtonMode=UITextFieldViewMode.Always
        familyFatherFeild?.leftViewMode=UITextFieldViewMode.Always
        familyFatherFeild?.placeholder="查找父系家庭的编号"
        familyFatherFeild?.layer.borderWidth=1
        familyFatherFeild?.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        familyFatherFeild?.layer.cornerRadius=5
        familyFatherFeild?.keyboardType=UIKeyboardType.NumberPad
        familyFather.addSubview(familyFatherFeild!)
        //说明
        let remind:UILabel=UILabel()
        remind.frame=CGRectMake(5, CGRectGetMaxY(familyFather.frame)+10, screen.width-10, 20)
        remind.text="说明：填入你爷爷与父亲组织的家庭编号，可不填"
        remind.font=UIFont.systemFontOfSize(12)
        viewWarp.addSubview(remind)
        //母系家庭父视图
        //母系家庭编号搜索
        //父系家庭父视图
        familyMother=UIView()
        familyMother.frame=CGRectMake(-1, CGRectGetMaxY(remind.frame)+5, screen.width+2, 60)
        familyMother.layer.borderWidth=1
        familyMother.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        viewWarp.addSubview(familyMother)
        //父系家庭标签
        let familyMotherLable:UILabel=UILabel()
        familyMotherLable.frame=CGRectMake(10, 20, 80, 20)
        familyMotherLable.text="母系家庭"
        familyMother.addSubview(familyMotherLable)
        //父系家庭编号搜索框
        let familyMotherseachView=UIView()
        familyMotherseachView.frame=CGRectMake(0, 0, 30, 30)
        let familyMotherseachViewImage:UIImageView=UIImageView()
        familyMotherseachViewImage.frame=CGRectMake(5, 5, 20, 20)
        familyMotherseachViewImage.image=UIImage(named: "iconfont-miaojiesellersearch.png")
        familyMotherseachView.addSubview(familyMotherseachViewImage)
        familyMotherFeild=UITextField()
        familyMotherFeild?.frame=CGRectMake(CGRectGetMaxX(familyMotherLable.frame), 15, screen.width-CGRectGetMaxX(familyMotherLable.frame)-15, 30)
        familyMotherFeild?.leftView=familyMotherseachView
        familyMotherFeild?.layer.cornerRadius=5
        familyMotherFeild?.layer.borderWidth=1
        familyMotherFeild?.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        familyMotherFeild?.clearButtonMode=UITextFieldViewMode.Always
        familyMotherFeild?.leftViewMode=UITextFieldViewMode.Always
        familyMotherFeild?.placeholder="查找母系家庭的编号"
        familyMotherFeild?.keyboardType=UIKeyboardType.NumberPad
        familyMother.addSubview(familyMotherFeild!)
        //说明
        let reminds:UILabel=UILabel()
        reminds.frame=CGRectMake(5, CGRectGetMaxY(familyMother.frame)+10, screen.width-10, 20)
        reminds.text="说明：填入你外公与母亲组织的家庭编号，可不填"
        reminds.font=UIFont.systemFontOfSize(12)
        viewWarp.addSubview(reminds)
        
        
        //下一步按钮
        btnNext=UIButton()
        btnNext.frame=CGRectMake(10, CGRectGetMaxY(reminds.frame)+40, screen.width-20, 40)
        btnNext.setTitle("下一步", forState: UIControlState.Normal)
        btnNext.layer.cornerRadius=CGRectGetHeight(btnNext.frame)/2
        btnNext.addTarget(self, action: "cilckBtnNext:", forControlEvents: UIControlEvents.TouchUpInside)
        btnNext.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
        viewWarp.addSubview(btnNext)

    }
    //点击下一步按钮
    func cilckBtnNext(sender:UIButton){
        let Jump=FamilyCreationSuccess()
        Jump.memberEntity=self.memberEntity
        self.navigationController?.pushViewController(Jump, animated: true)
    }
    
    
}
