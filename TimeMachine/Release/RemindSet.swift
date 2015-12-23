//
//  RemindSet
//  TimeMachine
//
//  Created by nevermore on 15/11/20.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class RemindSet: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate {
    ///table
    var RemindSetTable:UITableView!
    ///提交按钮
    var btnSubmit:UIButton!
    ///提醒备注
    var RemindTextView:UITextView!
    ///开启提醒开关
    var remindSwitch:UISwitch!
    ///提醒时间选择器
    var TimeSelect:UIDatePicker!
    var cellTime:UITextField!
    var cellRemind:UITextField!
    ///循环选择
    var remindPicker:UIPickerView!
    var valuePicker:String?
    
    
    
    //页面加载
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
    }
    //初始化ui控件
    func initView(){
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="谁可以看"
        tableview();
    }
    //创建table
    func tableview(){
        //infoTable = UITableView()
        RemindSetTable=UITableView(frame:CGRectMake(0, 0, screen.width, screen.height),style:UITableViewStyle.Grouped);
        RemindSetTable.dataSource=self
        RemindSetTable.delegate=self
        //消除垂直滚动条
        RemindSetTable.showsVerticalScrollIndicator=false;
        self.view.addSubview(RemindSetTable)
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
        var rowH:CGFloat!
        if indexPath.row==3{
            rowH=100
        }else if indexPath.row==4{
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
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cells)
            
        }else{
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cells)
            
        }
        if indexPath.row==0{
            cell?.textLabel?.text="是否开启提醒"
            remindSwitch=UISwitch()
            remindSwitch.frame=CGRectMake(screen.width-75, 12, 60, 30)
            remindSwitch.on=false
            cell?.contentView.addSubview(remindSwitch)
        }else if indexPath.row==1{
            cell?.textLabel?.text="提醒时间"
            cellTime=UITextField()
            cellTime.frame=CGRectMake(10, 0, screen.width-25, 50)
            cellTime.text="2010-2-2"
            cellTime.textAlignment=NSTextAlignment.Right
            cellTime.addTarget(self, action: "clickTime:", forControlEvents: UIControlEvents.EditingDidBegin)
            cell?.contentView.addSubview(cellTime)
        }else if indexPath.row==2{
            cell?.textLabel?.text="提醒循环"
            cellRemind=UITextField()
            cellRemind.frame=CGRectMake(10, 0, screen.width-25, 50)
            cellRemind.text="每小时一次"
            cellRemind.textAlignment=NSTextAlignment.Right
            cellRemind.addTarget(self, action: "clickcellRemind:", forControlEvents: UIControlEvents.EditingDidBegin)
            cell?.contentView.addSubview(cellRemind)
        }else if indexPath.row==3{
            RemindTextView=UITextView()
            RemindTextView.frame=CGRectMake(20, 0, screen.width-40, 100)
            RemindTextView.text="备注："
            cell?.contentView.addSubview(RemindTextView)
        }else if indexPath.row==4{
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
    ///点击提醒循环事件
    func clickcellRemind(sender:UITextField){
        remindPicker=UIPickerView()
        remindPicker.dataSource=self
        remindPicker.delegate=self
        remindPicker.selectedRowInComponent(0);
        sender.inputView=remindPicker
        //2创建工具栏
        let barWarp=UIView(frame: CGRectMake(0, 0, screen.width, 45));
        barWarp.backgroundColor=UIColor.greyBorder();
        let toolbar:UIToolbar=UIToolbar(frame: CGRectMake(0, 1, screen.width, 43));
        toolbar.backgroundColor=UIColor.linghtGreyBg();
        //2.1创建完成按钮
        let doneItem=UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Done, target: self, action: "doneSexCheck");
        doneItem.tintColor=UIColor.greyBtn();
        //2.2创建空白间距
        let flexibleSpace=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil);
        toolbar.items=[flexibleSpace,doneItem];
        barWarp.addSubview(toolbar);
        sender.inputAccessoryView=barWarp;
    }
    //4.1返回多少列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    //4.2返回多少行
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3;
    }
    //4.3.行高
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40;
    }
    
    //4.4返回数据源
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(row == 0){
            valuePicker = "每天一次"
        }else if row==1{
            valuePicker = "每小时一次"
        }else{
            valuePicker = "永不"
        }
        return valuePicker
    }
    //4.5提醒循环选择器值变化事件
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cellRemind.text = valuePicker
        
    }
    //完成选择性别
    func doneSexCheck(){
        cellRemind.text = valuePicker
        //刷新表格
        //RemindSetTable.reloadData();
        //关闭键盘
        self.view.endEditing(true);
    }

    ///点击提醒时间事件
    func clickTime(sender:UITextField){
        TimeSelect=UIDatePicker()
        TimeSelect.datePickerMode=UIDatePickerMode.DateAndTime;
        sender.inputView=TimeSelect
        TimeSelect.addTarget(self, action: "dateChanged:", forControlEvents: UIControlEvents.ValueChanged)
        //2创建工具栏
        let barWarp=UIView(frame: CGRectMake(0, 0, screen.width, 45));
        barWarp.backgroundColor=UIColor.greyBorder();
        let toolbar:UIToolbar=UIToolbar(frame: CGRectMake(0, 1, screen.width, 43));
        toolbar.backgroundColor=UIColor.linghtGreyBg();
        //2.1创建完成按钮
        let doneItem=UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Done, target: self, action: "Check");
        doneItem.tintColor=UIColor.greyBtn();
        //2.2创建空白间距
        let flexibleSpace=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil);
        toolbar.items=[flexibleSpace,doneItem];
        barWarp.addSubview(toolbar);
        sender.inputAccessoryView=barWarp;
    }
   
    ///点击完成事件
    func Check(){
        self.view.endEditing(true);
        print("没了")
    }
    ///时间选择事件
    func dateChanged(sender:UIDatePicker){
        let Timedate:NSDate=sender.date
        let formatter=NSDateFormatter()
        //设置时区
        let timeZone=NSTimeZone.systemTimeZone();
        let seconds=timeZone.secondsFromGMTForDate(Timedate);
        let newDate=Timedate.dateByAddingTimeInterval(Double(seconds));
        formatter.dateFormat="YYYY-MM-dd HH:mm"
        let timeStr:NSString=formatter.stringFromDate(Timedate)
        
        cellTime.text="\(timeStr)";
        print("\(Timedate)")
        print("选中的日期\(timeStr)")
        print("新日期\(newDate)")
        
    }
    
    ///点击确认提交按钮
    func clickBtnSubmit(sender:UIButton){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        //获取当前选中的单元格
        
//        var cell:UITableViewCell!=tableView.cellForRowAtIndexPath(indexPath);
//        
//        //返回所有单元格
//        
//        //遍历取消所有单元格样式
//        
//        var arry=tableView.visibleCells;
//        
//        for(var  i=0;i<arry.count;i++){
//            
//            var cells:UITableViewCell=arry[i] as! UITableViewCell;
//            
//            cells.accessoryType=UITableViewCellAccessoryType.None
//            
//        }
//        
//        //设置选中的单元格样式
//        
//        cell.accessoryType=UITableViewCellAccessoryType.Checkmark;
        
        
    }
}