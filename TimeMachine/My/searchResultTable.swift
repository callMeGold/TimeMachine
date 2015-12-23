//
//  searchResultTable.swift
//  TimeMachine
//
//  Created by nevermore on 15/12/3.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class searchResultTable:UITableViewController,UISearchResultsUpdating{
    var tableData:UITableView!;
    var originalData:[String]!                  //原数据
    var filteredData:[String]!                  //过滤数据
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title="输入商家名称";
        initView()
    }
    init(data:[String]){
        originalData = data
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //初始化UI
    func initView(){
        //创建Table
        tableData=UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height));
        self.view.addSubview(tableData);
        //tableData.backgroundColor=UIColor.redColor();
        tableData.delegate=self;
        tableData.dataSource=self;
        tableData.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cells")
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation,return the number of rows
        return filteredData.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        cell.textLabel!.text = originalData[indexPath.row];
        return cell
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar=searchController.searchBar;
        let target=searchBar.text;
        filteredData = originalData.filter()
            {
                s in
                var options = NSStringCompareOptions.CaseInsensitiveSearch
                if searchController.searchBar.selectedScopeButtonIndex == 0
                {
                    options = options.union(.AnchoredSearch)
                }
                let found = s.rangeOfString(target!, options: options)
                return (found != nil)
        }
        tableData.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}