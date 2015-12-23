//
//  Navigation.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class Navigation:UITabBarController{
    
    //页面初始化
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //1.创建"首页"导航控制器
        let vwHome = Home();
        let navHome=UINavigationController(rootViewController: vwHome);
        navHome.title="首页";
        navHome.tabBarItem.image=UIImage(named: "zhuye.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        navHome.tabBarItem.selectedImage=UIImage(named: "zhuyes.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        
        //2.创建"动态"导航控制器
        let vwDynamic=Dynamic();
        let navDynamic=UINavigationController(rootViewController: vwDynamic);
        navDynamic.title="动态";
        navDynamic.tabBarItem.image=UIImage(named: "diqiu.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        navDynamic.tabBarItem.selectedImage=UIImage(named: "diqius.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        
        //3.创建"发布"导航控制器
        let vwRelease=Release();
        let navRelease=UINavigationController(rootViewController: vwRelease);
        navRelease.title="发布";
        navRelease.tabBarItem.image=UIImage(named: "edit.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        navRelease.tabBarItem.selectedImage=UIImage(named: "edits.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        
        //4.创建"信息"导航控制器
        let vwInfo=Info();
        let navInfo=UINavigationController(rootViewController: vwInfo);
        navInfo.title="信息";
        navInfo.tabBarItem.image=UIImage(named: "info.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        navInfo.tabBarItem.selectedImage=UIImage(named: "infos.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        //5.创建"我的"导航控制器
        let vwMy=My();
        let navMy=UINavigationController(rootViewController: vwMy);
        navMy.title="我的";
        navMy.tabBarItem.image=UIImage(named: "myfill.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        navMy.tabBarItem.selectedImage=UIImage(named: "myfills.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        //7.添加到工具栏
        let items=[navHome,navDynamic,navRelease,navInfo,navMy];
        self.viewControllers=items;
        self.navigationController?.navigationBar.tintColor=UIColor.whiteColor();
        
        //8.自定义工具栏
//        self.tabBar.backgroundColor=UIColor.redColor();
//        self.tabBar.tintColor=UIColor.greenColor();
        ///工具栏背景色
        self.tabBar.barTintColor=UIColor.whiteColor();
        
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1), forKey:NSForegroundColorAttributeName) as? [String : AnyObject], forState:UIControlState.Normal)//工具栏文字默认颜色
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor(red: 0.34, green: 0.74, blue: 0.61, alpha: 1), forKey:NSForegroundColorAttributeName) as? [String : AnyObject], forState:UIControlState.Selected)//工具栏文字选中颜色
        //self.tabBar.tintColorDidChange()=UIColor.greenColor();
        //        let viewBar=UIView(frame:CGRectMake(0,0,UIScreen.mainScreen().bounds.width, 49));
        //        viewBar.backgroundColor=UIColor(patternImage:UIImage(named:"TabbarBg.png")!);
        //        self.tabBar.insertSubview(viewBar, atIndex:0)
        //        self.tabBar.opaque=true
        //        self.tabBar.tintColor=UIColor.appMainColor();
        
    }
    
}

