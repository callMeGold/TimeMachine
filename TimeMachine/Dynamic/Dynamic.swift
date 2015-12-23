//
//  Dynamic.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class Dynamic:UIViewController ,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,dynamicTableViewCellDelegate{
    ///父视图
    var viewWarp:UIView!
    ///  table
    var dynamicTable:UITableView!
    
    var critiqueView:UIView?
    
    var textField:UITextField?
    var dataEntity:[DynEntity]=[]
        
    
    
    
    
    //导航栏颜色透明
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.lt_setBackgroundColor(UIColor.blackColor().colorWithAlphaComponent(0.2))
    }
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title="动态"
        initView();
    }
    ///初始化UI控件
    func initView(){
        layout();
    }
    ///布局
    func layout(){
        
        let mode1:DynEntity=DynEntity(headerPicss: "goddess4.jpg", nicknamess: "浩鸡蛋", cellTimess: "2014年2月2日", cellTitless: "一女夜间走在小道上，突然窜出了一个人：别动，抢劫。女：大哥，你是劫钱还是劫色啊！男：哼哼，你说呢！女：大哥，我没钱，你就劫色吧！劫匪走上前仔细一瞧大叫一声：卧槽，你TM想的美，你不要过来，我手里有刀！", cellPicss: "goddess5.jpg", PraisePeopless: "浩鸡蛋，卢鸡巴",arrs: [])
        let mode2:DynEntity=DynEntity(headerPicss: "goddess4.jpg", nicknamess: "浩鸡蛋", cellTimess: "2014年12月8日", cellTitless: "一天一女同事说给我们讲个故事：从前有个太监。。。然后就沉默.一同事问：“下面呢？ ”她：“下面没了。 ”我接着问：“后面呢？”女同事鄙视的说：“你们这群流氓，前面说了，下面没了，后面你们还不放过吗？”我们竟然无言以对。。。”", cellPicss: "goddess5.jpg", PraisePeopless: "浩鸡蛋，卢鸡巴",arrs: [])
        let mode3:DynEntity=DynEntity(headerPicss: "goddess4.jpg", nicknamess: "浩鸡蛋", cellTimess: "2014年4月7日", cellTitless: "女孩：“干爹，我打算要你的那笔分手费了。”", cellPicss: "goddess5.jpg", PraisePeopless: "浩鸡蛋，卢鸡巴",arrs: [])
        let mode4:DynEntity=DynEntity(headerPicss: "goddess4.jpg", nicknamess: "浩鸡蛋", cellTimess: "2014年5月16日", cellTitless: "有一次和一女同事一起出差，车站等车，觉得无聊，我对她说：“我想到一个荤段子，讲给你听吧！”结果她直接无视我扭头走了。。。我心想，坏了，这小姑娘不高兴了！结果，她在一个角落跟我摆手：“过来过来，这儿人少，来这边说。”", cellPicss: "goddess5.jpg", PraisePeopless: "浩鸡蛋，卢鸡巴",arrs: [])
        
        dataEntity.insert(mode1, atIndex: 0)
        dataEntity.insert(mode2, atIndex: 1)
        dataEntity.insert(mode3, atIndex: 2)
        dataEntity.insert(mode4, atIndex: 3)
        dataEntity[0].arr.addObject("ludandan")
        ///  table
        dynamicTable=UITableView()
        dynamicTable.frame=CGRectMake(0, 0, screen.width, screen.height)
        dynamicTable.delegate=self
        dynamicTable.dataSource=self
        self.view.addSubview(dynamicTable)
        let jj:UIImageView=UIImageView()
        jj.image=UIImage(named: "Bg4")
    }
    //2.返回几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    //3.返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEntity.count;
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellData:DynEntity=self.dataEntity[indexPath.row];
        let DD=dynamicTableViewCell()
        DD.showData(cellData)
        return DD.frame.size.height ;
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cellIdeifier:String="cellId";
        var cell=tableView.dequeueReusableCellWithIdentifier(cellIdeifier) as? dynamicTableViewCell;
        if(cell == nil){
            cell=dynamicTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil);
        }
        cell?.cellDelegate=self
        cell?.index=indexPath
        let cellData:DynEntity=self.dataEntity[indexPath.row];
        cell?.showData(cellData);
        ///取消点击效果（如QQ空间）
        cell?.selectionStyle=UITableViewCellSelectionStyle.None;
        return cell!;
               
    }
    func obj(index: NSIndexPath,textF: String) {
        let cellSelf=dynamicTable.cellForRowAtIndexPath(index) as? dynamicTableViewCell
        let en=dataEntity[index.row]
        en.arr.addObject(textF)
        ///刷新当前行cell
        dynamicTable.reloadRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.None)
    }
       //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
}
