//
//  Release.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class Release:UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate {
    ///滚动父视图
    var viewScroll:UIScrollView?
    ///table视图
    var ReleaseTable:UITableView?
    ///头部视图高
    var headerViewH:CGFloat?
    ///头部视图
    var headerView:UIView!
    ///头部视图文本输入框
    var headerTextView:UITextView?
    ///头部视图文本输入框
    var headerCollection:UICollectionView?
    ///
    var flowLayoutW:CGFloat!
    ///发布按钮
    var btnRelease:UIButton!
    ///图片数组
    var items=NSMutableArray();
    ///headerCollectionH  高
    var headerCollectionH:CGFloat!

    
    //导航栏颜色透明
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.lt_setBackgroundColor(UIColor.blackColor().colorWithAlphaComponent(0.2))
    }
    //加载页面
    override func viewDidLoad() {
        super.viewDidLoad()
        var addimage=UIImage(named: "addimage.jpg")
        items.addObject(addimage!)
         header();
        initView();
       
    }
    //页面一加载就执行此方法
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(true)
        let i=(items.count-1)/4
        headerCollectionH=(flowLayoutW+5)*CGFloat(i+1)
     
        headerCollection!.frame=CGRectMake(10, CGRectGetMaxY(headerTextView!.frame), screen.width-20, headerCollectionH)
        headerViewH=CGRectGetMaxY(headerCollection!.frame)+10
        headerView.frame=CGRectMake(0, 0, screen.width, headerViewH!)
        ReleaseTable?.reloadData()
        
        
    }
    ///初始化UI
    func initView(){
        self.view.backgroundColor = UIColor.whiteColor()
        self.title="发布"
        layout();
        
    }
    ///布局
    func layout(){
        
                ///tabel
        ReleaseTable=UITableView(frame: CGRectMake(0, 0, screen.width, screen.height),style:UITableViewStyle.Grouped)
        ReleaseTable?.dataSource=self
        ReleaseTable?.delegate=self
        self.view.addSubview(ReleaseTable!)
       
    }
    //tabel头部布局
    func header(){
        ///头部视图
        headerView=UIView();
        headerView.backgroundColor=UIColor.whiteColor();
        ///头部视图文本输入框
        headerTextView=UITextView()
        headerTextView?.frame=CGRectMake(10, 10, screen.width-20, 60)
        headerTextView?.text="说点什么吧..."
        headerView.addSubview(headerTextView!)
        let headerLayout=UICollectionViewFlowLayout();
        flowLayoutW=((headerTextView?.frame.width)!-15)/4;
        headerLayout.itemSize=CGSizeMake(flowLayoutW, flowLayoutW)
        headerLayout.minimumLineSpacing=5;    //每个相邻layout的上下
        headerLayout.minimumInteritemSpacing=5;   //每个相邻layout的左右
        headerLayout.headerReferenceSize=CGSizeMake(0, 0);
        
        //创建UICollectionView
        headerCollectionH=flowLayoutW+5
        let i=(items.count-1)/4
        headerCollectionH=(flowLayoutW+5)*CGFloat(i+1)
        headerCollection = UICollectionView(frame:CGRectMake(10, CGRectGetMaxY(headerTextView!.frame), screen.width-20, headerCollectionH), collectionViewLayout:headerLayout)
        headerCollection?.backgroundColor=UIColor.whiteColor();
        headerCollection?.delegate=self;
        headerCollection?.tag=100;
        headerCollection?.dataSource=self;
        headerCollection?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell" )
        headerView.addSubview(headerCollection!);
        headerViewH=CGRectGetMaxY(headerCollection!.frame)+10
        headerView.frame=CGRectMake(0, 0, screen.width, headerViewH!)
        

    }
    ///返回多少个
    func collectionView(collectionView:UICollectionView,numberOfItemsInSection section:Int)->Int{
               return items.count;
    }
    ///返回多少组
    func numberOfSectionInCollectionView(collectiomView:UICollectionView)->Int{
        return 1;
    }
    //每个UICollectionView展示的内容(数据源)
    func collectionView(collectionView:UICollectionView,cellForItemAtIndexPath indexPath:NSIndexPath)->UICollectionViewCell
    {
        var Cell:UICollectionViewCell=UICollectionViewCell()
        
        let cell=headerCollection?.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath);
        //2.图片
        let imageItem:UIImageView=UIImageView()
        imageItem.frame=CGRectMake(0, 0, flowLayoutW, flowLayoutW)
        
        imageItem.image=items[indexPath.row] as! UIImage
        cell!.contentView.addSubview(imageItem)
        imageItem.tag=indexPath.row
        imageItem.userInteractionEnabled=true
        ///点击事件
        let tap=UITapGestureRecognizer(target: self, action: "clickimageItem:")
        imageItem.addGestureRecognizer(tap)
        Cell=cell!;
        
        
        return Cell;
        
    }
    ///点击添加图片事件
    func clickimageItem(sender:UIGestureRecognizer){
        headerCollectionH=(flowLayoutW+5)*CGFloat((items.count-1)/4+1)
        if sender.view?.tag==items.count-1{
            let action:UIActionSheet=UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil,otherButtonTitles:"卢蛋蛋艳照相册","卢蛋蛋想拍艳照了");
            action.delegate=self;
            action.showInView(self.view);
        }else{
            print("疯了吧你，卢蛋蛋")
        }
    }
    //根据索引选择拍照还是从照片库获取
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex==1{
           if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                //初始化图片控制器
                let picker=UIImagePickerController();
                //设置代理
                picker.delegate=self;
                //指定图片控制器类型
                picker.sourceType=UIImagePickerControllerSourceType.PhotoLibrary;
                //允许编辑
                picker.allowsEditing=false;
                //弹出控制器，显示界面
                self.presentViewController(picker, animated: true, completion: nil);
           }else{
            let aler=UIAlertView(title: "读取相册错误", message: nil, delegate: nil, cancelButtonTitle: "确定")
            }
        }else if buttonIndex==2{
            if UIImagePickerController.isSourceTypeAvailable(.Camera){
                //创建图片控制器
                let picker=UIImagePickerController();
                //设置代理
                picker.delegate=self;
                //设置来源
                picker.sourceType=UIImagePickerControllerSourceType.Camera;
                //允许编辑
                picker.allowsEditing=false;
                //打开相机
                self.presentViewController(picker, animated: true, completion: nil)
            }
            else
            {
                let aler=UIAlertView(title: "找不到相机", message: nil, delegate: nil, cancelButtonTitle: "确定")
            }

        }else{
            print("\(buttonIndex)")
        }
    }
    //选择图片成功之后代理
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
                let image=info[UIImagePickerControllerOriginalImage]as! UIImage;
                //图片控制器退出
                items.insertObject(image, atIndex: items.count-1);
                let a:NSData=UIImagePNGRepresentation(image)!;
                print("图片路径-----\(image)")
        
                picker.dismissViewControllerAnimated(true, completion: nil);
        
                headerCollection?.reloadData();
    }
       //取消图片控制器代理
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //图片控制器退出
        picker.dismissViewControllerAnimated(true, completion: nil);
        // println("图片控制器已退出2");
    }
    //选中后调用
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    //返回这个UICollectionView是否可以被选择
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    //3.5.1返回头部组视图
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header();
                return headerView;
    }
    //2.返回几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    //1.4每组的头部高度
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        //headerViewH=headerTextView?.frame.height
        return headerViewH!
        
        
    }
    //3.5.1返回组视图
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView=UIView(frame: CGRectMake(0, 0, screen.width, 50));
        footerView.backgroundColor=UIColor.linghtGreyBg();
        
        //退出登录按钮
        let exitBtn=UIButton(frame: CGRectMake(10, 10, footerView.frame.width-20, 40));
        footerView.addSubview(exitBtn);
        exitBtn.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1);
        exitBtn.setTitle("确定发布", forState: UIControlState.Normal);
        //exitBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal);
        exitBtn.layer.cornerRadius=6;
        exitBtn.addTarget(self, action: "exitAction:", forControlEvents: UIControlEvents.TouchUpInside);
        
        return footerView;
        
        
    }
    func exitAction(sender:UIButton){
        print("3434343")
    }
//    //3.5.1返回底部组视图
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        ///发布按钮
//        let vieww=UIView(frame: CGRectMake(0,0,screen.width,50))
//        btnRelease=UIButton()
//        btnRelease.frame=CGRectMake(20, CGRectGetMaxY(ReleaseTable!.frame), screen.width-40, 30)
//        btnRelease.setTitle("确认发布", forState: UIControlState.Normal)
//        btnRelease.layer.cornerRadius=btnRelease.frame.height/2
//        btnRelease.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.77, alpha: 1)
//        vieww.addSubview(btnRelease);
//        vieww.backgroundColor=UIColor.redColor();
//        return vieww
//    }
//    
    
    //1.5每组的底部高度
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 50;
        
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
        let cells:String="cells";
        var cell=tableView.dequeueReusableCellWithIdentifier(cells) ;
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cells)
        }
        if indexPath.row==0{
            let uiPic:UIImageView=UIImageView()
            uiPic.frame=CGRectMake(5, 10, 30, 30)
            uiPic.image=UIImage(named: "biaoti")
            cell?.contentView.addSubview(uiPic)
            let celltext:UILabel=UILabel()
            celltext.frame=CGRectMake(40, 15, 80, 20)
            celltext.text="标题"
            cell?.contentView.addSubview(celltext)
            let cellFeild:UITextField=UITextField()
            cellFeild.frame=CGRectMake(CGRectGetMaxX(celltext.frame), 15, screen.width-CGRectGetMaxX(celltext.frame)-15, 20)
            cellFeild.placeholder="请输入发布的标题"
            cellFeild.font=UIFont.systemFontOfSize(14)
            cellFeild.clearButtonMode=UITextFieldViewMode.Always
            cell?.contentView.addSubview(cellFeild)
        }else if indexPath.row==1{
            let uiPic:UIImageView=UIImageView()
            uiPic.frame=CGRectMake(5, 10, 30, 30)
            uiPic.image=UIImage(named: "weizhi")
            cell?.contentView.addSubview(uiPic)
            let celltext:UILabel=UILabel()
            celltext.frame=CGRectMake(40, 15, 80, 20)
            celltext.text="上传位置"
            cell?.contentView.addSubview(celltext)
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        }else if indexPath.row==2{
            cell?.imageView?.image=UIImage(named: "")
            let celltext:UILabel=UILabel()
            celltext.frame=CGRectMake(40, 15, 80, 20)
            celltext.text="目录"
            cell?.contentView.addSubview(celltext)
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        }else if indexPath.row==3{
            let uiPic:UIImageView=UIImageView()
            uiPic.frame=CGRectMake(5, 10, 30, 30)
            uiPic.image=UIImage(named: "quanxian")
            cell?.contentView.addSubview(uiPic)
            let celltext:UILabel=UILabel()
            celltext.frame=CGRectMake(40, 15, 80, 20)
            celltext.text="查看权限"
            cell?.contentView.addSubview(celltext)
            
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        }else if indexPath.row==4{
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
            let uiPic:UIImageView=UIImageView()
            uiPic.frame=CGRectMake(5, 10, 30, 30)
            uiPic.image=UIImage(named: "tixing")
            cell?.contentView.addSubview(uiPic)
            let celltext:UILabel=UILabel()
            celltext.frame=CGRectMake(40, 15, 80, 20)
            celltext.text="提醒设置"
            cell?.contentView.addSubview(celltext)
    }
        ///取消点击效果（如QQ空间）
        cell?.selectionStyle=UITableViewCellSelectionStyle.None;
        

        return cell!
    }
        //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        if indexPath.row==0 {
            //标题
            let reg = InfoDetails();
            reg.hidesBottomBarWhenPushed=true
            self.navigationController!.pushViewController(reg, animated: true)
            
        }else if indexPath.row==1 {
            //上传位置
            
            
            
            
            print("0-1")
        }else if indexPath.row==2 {
            //目录
            print("0-1")
        }else if indexPath.row==3 {
            //查看权限
            let reg = seePower();
            reg.hidesBottomBarWhenPushed=true
            self.navigationController!.pushViewController(reg, animated: true)
        }else if indexPath.row==4 {
            //提醒设置
            let reg = RemindSet();
            reg.hidesBottomBarWhenPushed=true
            self.navigationController!.pushViewController(reg, animated: true)
        }
        //获得点击的cell
        //let cell=tableView.cellForRowAtIndexPath(indexPath);
        //let currCell=items[indexPath.row];
        //print("当前选中了\(currCell)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
