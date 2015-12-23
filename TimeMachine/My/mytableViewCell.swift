//
//  mytableViewCell.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/5.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class mytableViewCell:UITableViewCell {
    var nickName:UILabel!
    var phoneNumber:UILabel?
    var myCellWarp:UIView!          //cell容器
    var myCellWarp1:UIView!          //cell1容器
    var myCellWarp2:UIView!          //cell2容器
    var tabelCellImage:UIImageView!     //cell2图片
    var cellText:UILabel!               //cell2文字
    var viewH:CGFloat=0              //容器高度变量
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        myCellWarp=UIView()
        myCellWarp.frame=CGRectMake(0, 0, screen.width, viewH);
        self.contentView.addSubview(myCellWarp);
    }
    func cell1(){
        myCellWarp1=UIView()
        myCellWarp1.frame=CGRectMake(0, 0, screen.width, viewH)
        myCellWarp.addSubview(myCellWarp1)

        //cell左视图
        let tabelCellLeftImage:UIImageView=UIImageView()
        tabelCellLeftImage.frame=CGRectMake(10, 5, 50, 50)
        tabelCellLeftImage.image=UIImage(named: "goddess3.jpg")
        tabelCellLeftImage.layer.cornerRadius=4
        myCellWarp1.addSubview(tabelCellLeftImage)
        //昵称
        nickName=UILabel()
        nickName.frame=CGRectMake(CGRectGetMaxX(tabelCellLeftImage.frame)+5, 10, 100, 20)
        nickName.text=""
        nickName.font=UIFont.systemFontOfSize(14)
        myCellWarp1.addSubview(nickName)
        //手机号
        phoneNumber=UILabel()
        phoneNumber!.frame=CGRectMake(CGRectGetMinX(nickName.frame), 35, 200, 20)
        
        phoneNumber!.font=UIFont.systemFontOfSize(14)
        myCellWarp1.addSubview(phoneNumber!)

    }
    func cell2(){
        myCellWarp2=UIView()
        myCellWarp2.frame=CGRectMake(0, 0, screen.width, viewH)
        myCellWarp.addSubview(myCellWarp2)
        
        //cell左视图
        tabelCellImage=UIImageView()
        tabelCellImage.frame=CGRectMake(10, 10, 30, 30)
        tabelCellImage.image=UIImage(named: "goddess2.jpg")
        myCellWarp2.addSubview(tabelCellImage)
        //text
        cellText=UILabel()
        cellText.frame=CGRectMake(CGRectGetMaxX(tabelCellImage.frame), 15, 80, 20)
        cellText.text="我的信息"
        myCellWarp2.addSubview(cellText)


        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
