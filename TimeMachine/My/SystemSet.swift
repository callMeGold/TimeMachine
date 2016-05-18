//
//  SystemSet.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/20.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class SystemSet: UIViewController,UITableViewDelegate,UITableViewDataSource {
    ///table
    var powerTable:UITableView!
    ///提交按钮
    var btnSubmit:UIButton!
    var setSwitch:UISwitch!
    ///SoundSwitch
    var SoundSwitch:UISwitch!
    //页面加载
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
    }
    //初始化ui控件
    func initView(){
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="系统设置"
        tableview();
    }
    //创建table
    func tableview(){
        //infoTable = UITableView()
        powerTable=UITableView(frame:CGRectMake(0, 0, screen.width, screen.height),style:UITableViewStyle.Grouped);
        powerTable.dataSource=self
        powerTable.delegate=self
        //消除垂直滚动条
        powerTable.showsVerticalScrollIndicator=false;
        self.view.addSubview(powerTable)
    }
    //2.返回几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    //1.4每组的头部高度
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        return 10
        
        
    }
    
    
    
    //1.5每组的底部高度
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0;
        
    }
    //3.返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowH:CGFloat!
        if indexPath.row==2{
            rowH=60
        }else{
            rowH=50
        }
        return rowH
        
        
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cells:String="cells";
        var cell=tableView.dequeueReusableCellWithIdentifier(cells) ;
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cells)
            
        }
        if indexPath.row==0{
            cell?.textLabel?.text="设置提醒"
            setSwitch=UISwitch()
            setSwitch.frame=CGRectMake(screen.width-75, 12, 60, 30)
            setSwitch.on=false
            cell?.contentView.addSubview(setSwitch)
        }else if indexPath.row==1{
            cell?.textLabel?.text="声音开关"
            SoundSwitch=UISwitch()
            SoundSwitch.frame=CGRectMake(screen.width-75, 12, 60, 30)
            SoundSwitch.on=false
            cell?.contentView.addSubview(SoundSwitch)
        }else if indexPath.row==2{
            btnSubmit=UIButton()
            btnSubmit.frame=CGRectMake(10, 10, screen.width-20, 40)
            btnSubmit.layer.cornerRadius=6
            btnSubmit.setTitle("确认提交", forState: UIControlState.Normal)
            btnSubmit.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
            btnSubmit.addTarget(self, action: "clickBtnSubmit:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.contentView.addSubview(btnSubmit)
        }
        
        return cell!
    }
    ///点击确认提交按钮
    func clickBtnSubmit(sender:UIButton){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
               
        
    }
}