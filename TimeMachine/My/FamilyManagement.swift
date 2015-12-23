//
//  MyFriend.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/10.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class FamilyManagement:UIViewController,UITableViewDataSource,UITableViewDelegate {
    var memberEntity:personalInfoEntity?
    var viewWarp:UIScrollView!        //父视图
    var upView:UIView!          //上部父视图
    var familyPic:UIImageView?  //家族的头像
    var familyNumber:UILabel?   //家庭编号
    var familyName:UILabel?     //某某的幸福之家标签
    var downView:UIView!        //下部父视图
    var famillyTable:UITableView!   //table
    
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="家庭管理"
        initView();
        
    }
    //初始化UI控件
    func initView(){
        self.view.backgroundColor=UIColor.whiteColor()
        warp();
        
        UpPic();
        downLayout()
          viewWarp.contentSize=CGSizeMake(screen.width, CGRectGetMaxY(downView.frame)+10);
    }
    //初始化父视图
    func warp(){
        viewWarp=UIScrollView()
        viewWarp.frame=CGRectMake(0, 0, screen.width, screen.height)
        viewWarp.showsVerticalScrollIndicator=false;//清除滚动条
      
        self.view.addSubview(viewWarp)
    }
    //上部图片
    func UpPic(){
        //上部父视图
        upView=UIView()
        upView.frame=CGRectMake(0, 0, screen.width, 170)
        viewWarp.addSubview(upView)
        //上部父视图背景图
        let upImage:UIImageView=UIImageView()
        upImage.frame=CGRectMake(0, 0, CGRectGetWidth(upView.frame), CGRectGetHeight(upView.frame))
        upImage.image=UIImage(named: "goddess5.jpg")
        upView.addSubview(upImage)
        //家族的头像
        familyPic=UIImageView()
        familyPic!.frame=CGRectMake(screen.width*2/7, 10, screen.width*3/7, 100)
        familyPic!.image=UIImage(named: "goddess4.jpg")
        upView.addSubview(familyPic!)
        //某某的幸福之家标签
        familyName=UILabel()
        familyName?.frame=CGRectMake(0, CGRectGetMaxY(familyPic!.frame)+10, screen.width, 20)
        familyName?.text="卢蛋蛋" + "的幸福之家"
        familyName!.textAlignment=NSTextAlignment.Center
        familyName!.textColor=UIColor.whiteColor()
        familyName?.font=UIFont.systemFontOfSize(16)
        upView.addSubview(familyName!)
        //家庭编号
        familyNumber=UILabel()
        familyNumber?.frame=CGRectMake(0, CGRectGetMaxY(familyName!.frame)+10, screen.width, 20)
        familyNumber?.text="编号："+"暂无"
        familyNumber?.textColor=UIColor.whiteColor()
        familyNumber?.textAlignment=NSTextAlignment.Center
        familyNumber?.font=UIFont.systemFontOfSize(14)
        upView.addSubview(familyNumber!)
        
    }
    //下部父视图
    func downLayout(){
        //初始化下部父视图
        downView=UIView()
        downView.frame=CGRectMake(0, CGRectGetMaxY(upView.frame)+10, screen.width, 252)
        viewWarp.addSubview(downView)
        //初始化table
        famillyTable=UITableView(frame: CGRectMake(0, 0, screen.width, 252),style: UITableViewStyle.Plain)
        
        famillyTable.dataSource=self
        famillyTable.delegate=self
        famillyTable.backgroundColor=UIColor.whiteColor()
        downView.addSubview(famillyTable)
    }
    //2.返回几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    //1.4每组的头部高度
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    //1.5每组的底部高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    //3.返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return 50
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cellIdeifier:String="cellIdeifier";
        var cell=tableView.dequeueReusableCellWithIdentifier(cellIdeifier) ;
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdeifier) ;
        }else{
            cell=UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdeifier)
        }
        if indexPath.section==0 {
            if indexPath.row==0 {
                cell?.textLabel?.text="家庭名称"
            }else if indexPath.row==1 {
                cell?.textLabel?.text="家庭列表"
            }else if indexPath.row==2 {
                cell?.textLabel?.text="创建家庭"
            }else if indexPath.row==3 {
                cell?.textLabel?.text="加入家庭"
            }else if indexPath.row==4 {
                cell?.textLabel?.text="添加成员"
                cell?.detailTextLabel?.text="暂未添加成员";
            }
           cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
            
            
        }
        cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        return cell!
    }
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        if indexPath.row==0 {
           //家庭名称
            
        }else if indexPath.row==1 {
            //家庭列表
            
        }else if indexPath.row==2 {
            //创建家庭
            let Jump=FamilyCreation()
            Jump.memberEntity=self.memberEntity
            self.navigationController?.pushViewController(Jump, animated: true)

        }else if indexPath.row==3 {
            //加入家庭JoinFamily
            let Jump=searchTable()
            self.navigationController?.pushViewController(Jump, animated: true)
            
        }else if indexPath.row==4 {
            //添加成员
            let Jump=addPeople()
            Jump.memberEntity=self.memberEntity
            self.navigationController?.pushViewController(Jump, animated: true)

        }
        
        //获得点击的cell
        //let cell=tableView.cellForRowAtIndexPath(indexPath);
        //let currCell=items[indexPath.row];
        //print("当前选中了\(currCell)")
    }

    
    
    
    
    
    
}
