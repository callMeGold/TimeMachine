//
//  JoinFamily.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/16.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit

class searchTable: UITableViewController,UISearchBarDelegate{
    lazy var dismissBtn: UIButton = { UIButton(frame: CGRectMake(0, 0, 24, 24)) }();//返回按钮
    
    var itemsString:[String]!
    var searcher:UISearchController!
    var searchBars:UISearchBar?
    struct SearchControllerRestorableState {
        var wasActive = false
        var wasFirstResponder = false
    }
    var restoredState = SearchControllerRestorableState();
    //初始化函数
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title="查找家庭";
        initView();
    }
    //初始化UI
    func initView(){
        dismissBtnPrepare();
        //创建Table
        self.tableView=UITableView(frame: CGRectMake(0, 80, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height));
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cells")
        //1.读取表格数据
        let tablePath = NSBundle.mainBundle().pathForResource("states", ofType: "txt")!;
        let tableData=try! NSString(contentsOfFile: tablePath, encoding: NSUTF8StringEncoding);
        itemsString = tableData.componentsSeparatedByString("\n") as [String];
        let src = searchResultTable(data: itemsString)
        searcher = UISearchController(searchResultsController: src)
        searcher.searchResultsUpdater = src;
        //获取焦点时有阴影效果
        searcher.dimsBackgroundDuringPresentation=true;
        //获取焦点导航向上移的动画效果
        searcher.hidesNavigationBarDuringPresentation=true;
        searchBars = searcher.searchBar
        tableView.tableHeaderView = searchBars
        searchBars?.delegate=self;
        searchBars?.placeholder="输入家庭名称";
        //取消按钮颜色和文本框光标颜色
        searchBars?.tintColor=UIColor.blueColor();
        //搜索框背景颜色
        //searchBars?.barTintColor=UIColor.blackColor();
        searcher.searchBar.sizeToFit();
        self.tableView.reloadData();
        //背景充满导航
        definesPresentationContext = true;
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Restore the searchController's active state.
        if restoredState.wasActive {
            searcher.active = restoredState.wasActive
            restoredState.wasActive = false
            if restoredState.wasFirstResponder {
                searcher.searchBar.becomeFirstResponder()
                restoredState.wasFirstResponder = false
            }
        }
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated);
        //2.3将状态栏变为白色
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsString.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        cell.textLabel!.text = itemsString[indexPath.row];
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        //获取点击的行索引
        if(indexPath.row == 0){
        }
    }
    /** 返回按钮 */
    func dismissBtnPrepare(){
        dismissBtn.setImage(UIImage(named: "img.bundle:cancel.png"), forState: UIControlState.Normal)
        dismissBtn.addTarget(self, action: "dismissLogin", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dismissBtn)
    }
    /** 释放当前页面 */
    func dismissLogin(){
        self.navigationController?.popViewControllerAnimated(true)
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        var b=0
        b++
        print(b);
        //2.3将状态栏变为白色
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
    }
    //搜索框开始编辑事件
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        //2.3将状态栏变为白色
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default;
    }
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        //2.3将状态栏变为白色
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
    }
}