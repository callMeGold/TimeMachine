//
//  Info.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//
import Foundation
import UIKit
class Info:UIViewController,UITableViewDataSource,UITableViewDelegate {
    var infoTable:UITableView!      //table
    override func viewDidLoad() {
         //导航栏颜色透明
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title="卢蛋蛋的信息"
        self.navigationController?.title="信息"
        initView();
    }
    //初始化ui控件
    func initView(){
        tableview();
    }
    //创建table
    func tableview(){
        //infoTable = UITableView()
        infoTable=UITableView(frame:CGRectMake(0, 0, screen.width, screen.height),style:UITableViewStyle.Plain);
        infoTable.dataSource=self
        infoTable.delegate=self
        //消除垂直滚动条
        infoTable.showsVerticalScrollIndicator=false;
        self.view.addSubview(infoTable)
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
       return 5
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
                    return 100
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cells:String="cells";
        var cell=tableView.dequeueReusableCellWithIdentifier(cells) as? infoTableCell ;
        if(cell == nil){
            cell=infoTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: cells)
            
        }
        if indexPath.row%2==0{
            cell?.cellIofo?.text="你以向卢蛋蛋申请加入他的家庭，请耐心等待他的回复";
            cell?.cellClickSeach.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "clickSeach:"))
        }else {
            cell?.cellIofo?.text="卢蛋蛋申请加入您的家庭";
        }
        //cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        cell?.selected=false;
        ///取消点击效果（如QQ空间）
        cell?.selectionStyle=UITableViewCellSelectionStyle.None;
        return cell!
    }
    //点击查看详情事件
    func clickSeach(sender:UITapGestureRecognizer){
        let reg = InfoDetails();
        self.navigationController!.pushViewController(reg, animated: true)
    }
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        let reg = InfoDetails();
        reg.hidesBottomBarWhenPushed=true
        self.navigationController!.pushViewController(reg, animated: true)
//        if indexPath.row==0 {
//            let reg = InfoDetails();
//            reg.hidesBottomBarWhenPushed=true
//            self.navigationController!.pushViewController(reg, animated: true)
//
//        }else if indexPath.row==1 {
//            print("0-1")
//        }else{
//            print("0-2")
//        }
        //获得点击的cell
        //let cell=tableView.cellForRowAtIndexPath(indexPath);
        //let currCell=items[indexPath.row];
        //print("当前选中了\(currCell)")
    }
}