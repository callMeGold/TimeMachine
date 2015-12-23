//
//  myPersonalInformation.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/9.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class myPersonalInformation:UIViewController,UITableViewDelegate,UITableViewDataSource{
    var viewWarp:UIView!            //页面父视图
    var PersonalInfoTable:UITableView!      //个人信息table
    var memberEntity:personalInfoEntity?

    
    
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        initView();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateNickName:", name: "nickNameNotification", object: nil);
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(true)
        
        
    }
    func updateNickName(obj:NSNotification)
    {
        self.memberEntity=obj.object as? personalInfoEntity;
        PersonalInfoTable.reloadData()
    }
    
  
    //初始化UI控件
    func initView(){
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="个人信息"
        InfoTableLayout();
    }
    //页面布局
    func InfoTableLayout(){
        //页面父视图
        viewWarp=UIView()
        viewWarp.frame=CGRectMake(0, 0, screen.width, screen.height)
        self.view.addSubview(viewWarp)
        //个人信息table
        PersonalInfoTable=UITableView(frame: CGRectMake(0, 0, screen.width, screen.height),style:UITableViewStyle.Grouped)
        PersonalInfoTable.delegate=self
        PersonalInfoTable.dataSource=self
        
        viewWarp.addSubview(PersonalInfoTable)
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
        
        return 0;
        
    }
    //3.返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return 3
        }else if section==1 {
            return 3
        }else{
            return 1
        }
        
        
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let MyCell=myPersonalInfoTableCell()
        if indexPath.section==0 {
            if indexPath.row==0{
                MyCell.cellWarpH=60
                return 60
            }else{
                MyCell.cellWarpH=50
                return 50
            }
            
        }else{
            MyCell.cellWarpH=50
            return 50
        }
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cells:String="mycell";
        var cell=tableView.dequeueReusableCellWithIdentifier(cells) as? myPersonalInfoTableCell;
        if(cell == nil){
            cell=myPersonalInfoTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: cells)
        }else{
            cell=myPersonalInfoTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: cells)
        }
        //let MyCell=myPersonalInfoTableCell()
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell?.cellZero()
                cell?.cellLabel.text="头像"
                cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
            }else if indexPath.row == 1{
                cell?.cellText = memberEntity!.nickName!
                cell?.cellOne()
                cell?.cellLabel.text="名字"
                cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
               
            }else{
                cell?.cellText=(memberEntity?.numberPhone)!
                cell?.cellOne()
                cell?.cellLabel.text="手机号"
                
            }
            //cell?.textLabel?.text=textItemOne[indexPath.row]
        }else if indexPath.section==1 {
            if indexPath.row==0 {
                cell?.cellText=(memberEntity?.sex)!
                cell?.cellOne()
                cell?.cellLabel.text="性别"
            }else if indexPath.row == 1{
                cell?.cellText=(memberEntity?.age)!
                cell?.cellOne()
                cell?.cellLabel.text="年龄"
                
            }else if indexPath.row == 2{
                cell?.cellText=(memberEntity?.address)!
                cell?.cellOne()
                cell?.cellLabel.text="地区"

                
            }
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        }else{
            cell?.cellOne()
            cell?.cellLabel.text="修改密码"
            cell?.cellTextLabel.removeFromSuperview()//从父视图移除
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        }
        
       
        return cell!
    }
  
    
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        if indexPath.section==0{
            if indexPath.row==0{
                print("22")
            }else if indexPath.row==1{
                let Jump=UpdateNickname()
                Jump.memberEntity=self.memberEntity
                self.navigationController?.pushViewController(Jump, animated: true)
                
            }else if indexPath.row==2{
//                let Jump=UpdateNickname()
//                Jump.memberEntity=self.memberEntity
//                self.navigationController?.pushViewController(Jump, animated: true)
                
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let Jump=sexSelect()
                Jump.memberEntity=self.memberEntity
                self.navigationController?.pushViewController(Jump, animated: true)
            }else if indexPath.row==1{
                let Jump=updateAge()
                Jump.memberEntity=self.memberEntity
                self.navigationController?.pushViewController(Jump, animated: true)
                
            }else if indexPath.row==2{
                let Jump=updateAddress()
                Jump.memberEntity=self.memberEntity
                self.navigationController?.pushViewController(Jump, animated: true)
                
            }else if indexPath.section == 2 {
                let Jump=updatePasswordOne()
                
                self.navigationController?.pushViewController(Jump, animated: true)
            }
        }else{
            let Jump=updatePasswordOne()
            
            self.navigationController?.pushViewController(Jump, animated: true)
            

        }
       
    }
   

}
