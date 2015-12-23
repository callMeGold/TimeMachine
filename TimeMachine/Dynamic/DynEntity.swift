//
//  DynEntity.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/23.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
class DynEntity:NSObject{
    ///头像
    var headerPics:String!
    ///昵称
    var nicknames:String!
    ///时间
    var cellTimes:String!
    ///标题
    var cellTitles:String!
    ///发布的图片
    var cellPics:String!
    ///点赞的人
    var PraisePeoples:String!
    
    var arr:NSMutableArray!
    
        //初始化方法
    init( headerPicss:String,nicknamess:String,cellTimess:String,cellTitless:String,cellPicss:String,PraisePeopless:String,arrs:NSMutableArray){
        headerPics=headerPicss;
        nicknames=nicknamess;
        cellTimes=cellTimess;
        cellTitles=cellTitless;
        cellPics=cellPicss;
        PraisePeoples=PraisePeopless
        arr=arrs
    }
    
}