//
//  test.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/23.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class test: UIViewController {
    var lblView:UIView!
    var textFeild:UITextField!
    var lblViewH:CGFloat=64
    var lblall:UILabel!
    var arry=NSMutableArray()
    var aY:CGFloat=64
    ///页面加载
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        initView()
        
    }
    func initView(){
        ///label容器
//        lblView=UIView()
//        var i=0
//        let count=arry.count
//        
//        
//        ///label
//        lblall=UILabel()
//        for (i=0;i<count;i++){
//            lblall.text=arry[i] as! String+""
//            let lblallY:CGFloat=40*CGFloat(i)
//            lblall.frame=CGRectMake(10, lblallY, screen.width-20, 40)
//            lblView.addSubview(lblall)
//            
//        }
//        lblViewH=40*CGFloat(i)
//        lblView.frame=CGRectMake(0, 64, screen.width, lblViewH)
//        self.view.addSubview(lblView)
//        
        ///文本框
        textFeild=UITextField()
        
        textFeild.frame=CGRectMake(20, lblViewH, screen.width-40, 40)
        textFeild.backgroundColor=UIColor.redColor()
        textFeild.addTarget(self, action: "add:", forControlEvents: UIControlEvents.EditingDidEnd)
        self.view.addSubview(textFeild)
    }
    func add(sender:UITextField){
//        arry.addObject("卢蛋蛋："+sender.text!)
//        self.textFeild.removeFromSuperview()
//        initView()
        
        let alabel:UILabel=UILabel()
        
        alabel.text=sender.text
        alabel.frame=CGRectMake(10, aY, screen.width, 40)
        self.view.addSubview(alabel)
        aY=aY+40
        lblViewH+=40
        textFeild.frame=CGRectMake(20, lblViewH, screen.width-40, 40)
        sender.text=""
    }
}