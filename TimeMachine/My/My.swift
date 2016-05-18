//
//  My.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class My:UIViewController,UITableViewDataSource,UITableViewDelegate {
    var viewWarp:UIScrollView!            //总父容器
    var Warp:UIView!
    var memberEntity:personalInfoEntity?

    var myTableView:UITableView?    //table
    var myTextItem=["家庭管理","版本更新","系统设置"]
    var mytubiao=["MY2.png","MY3.png","MY4.png"]
    
    //导航栏颜色透明
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.lt_setBackgroundColor(UIColor.blackColor().colorWithAlphaComponent(0.1))
        
    }
    //接收通知函数
    func updateNickName(atitle:NSNotification)
    {
        self.memberEntity = atitle.object as? personalInfoEntity;
        
        myTableView!.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        memberEntity=personalInfoEntity()
        memberEntity?.sex="男"
        memberEntity?.nickName="卢蛋蛋大傻逼"
        memberEntity?.age="20"
        memberEntity?.address="湖南省 长沙市"
        memberEntity?.numberPhone="18833339999"
        initView();
        //接收通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateNickName:", name: "nickNameNotification", object: nil);
    }
    //初始化ui控件
    func initView(){
        //给整个页面加背景图
        let BgPicWarp=UIView()
        BgPicWarp.frame=CGRectMake(0, 0, screen.width, screen.height)
        self.view.addSubview(BgPicWarp)
        let BgPic:UIImageView=UIImageView()
        BgPic.frame=CGRectMake(0, 0, screen.width, screen.height)
        BgPic.image=UIImage(named: "Bg6.jpg")
        BgPicWarp.addSubview(BgPic)
        self.title="我"
        self.view.backgroundColor=UIColor.whiteColor()
        
        OverallLayout();
        tableLayout();
        viewWarp.contentSize=CGSizeMake(screen.width, CGRectGetMaxY(myTableView!.frame)+10)
    }
    //总体布局
    func OverallLayout(){
        Warp=UIView()
        Warp.frame=CGRectMake(0, 0, screen.width, screen.height)
        self.view.addSubview(Warp)
        viewWarp=UIScrollView()
        viewWarp.frame=CGRectMake(0, 64, screen.width, screen.height)
        viewWarp.showsVerticalScrollIndicator=true
        Warp.addSubview(viewWarp)
        
    }
    //tabel布局
    func tableLayout(){
        //创建table控件
        
        let myTableViewX:CGFloat=0
        let myTableViewY:CGFloat=10
        let myTableViewW:CGFloat=screen.width
        let myTableViewH:CGFloat=screen.height
        myTableView=UITableView(frame:CGRectMake(myTableViewX, myTableViewY, myTableViewW, myTableViewH),style:UITableViewStyle.Grouped)
        myTableView!.delegate=self
        myTableView!.dataSource=self
        viewWarp.addSubview(myTableView!)
        
    }
    //2.返回几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    //1.4每组的头部高度
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
    }
    
    //1.5每组的底部高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    //3.返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 1
        }else if section==1{
            return 2
        }else{
            return 1
        }
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let mytableView=mytableViewCell();
        if indexPath.section==0{
            mytableView.viewH=60;
            return 60;
        }else{
            mytableView.viewH=50;
            return 50
        }
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cellIdeifier:String="cellIdeifier";
        var cell=tableView.dequeueReusableCellWithIdentifier(cellIdeifier) as? mytableViewCell;
        if(cell == nil){
            cell=mytableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdeifier) ;
        }else{
            cell=mytableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdeifier) 
        }
        if indexPath.section==0{
            cell?.cell1();
            cell?.nickName.text=memberEntity?.nickName
            cell?.phoneNumber?.text="手机号："+(memberEntity?.numberPhone)!
        }else if indexPath.section==1{
//            cell!.textLabel!.text="ludandan"
//            cell!.imageView!.image=UIImage(named: "goddess3.jpg")
            cell?.cell2();
            cell?.cellText?.text=myTextItem[indexPath.row]
            cell?.tabelCellImage?.image=UIImage(named: mytubiao[indexPath.row])
        }else{
            cell?.cell2();
            cell?.cellText?.text=myTextItem[2]
            cell?.tabelCellImage?.image=UIImage(named: mytubiao[2])

        }
        cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        return cell!
    }
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        if indexPath.section==0 {
            let Jump=myPersonalInformation()
            Jump.memberEntity=self.memberEntity
            Jump.hidesBottomBarWhenPushed=true;
            self.navigationController?.pushViewController(Jump, animated: true)
        }else if indexPath.section==1 {
            if indexPath.row==0{
                let Jump=FamilyManagement()
                Jump.memberEntity=self.memberEntity
                Jump.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
                self.navigationController?.pushViewController(Jump, animated: true)
            }else if indexPath.row==1{
                print("1-1")
            }
        }else{
            let Jump=SystemSet()
            Jump.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
            self.navigationController?.pushViewController(Jump, animated: true)

        }
        
        //获得点击的cell
        //let cell=tableView.cellForRowAtIndexPath(indexPath);
        //let currCell=items[indexPath.row];
        //print("当前选中了\(currCell)")
    }
}
