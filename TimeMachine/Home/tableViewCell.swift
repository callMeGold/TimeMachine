//
//  tableViewCell.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/30.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class tableViewCell:UITableViewCell{
    var tabelCellWarp:UIView!               //cell父容器
    var tabelCellLeftImage:UIImageView!     //cell左视图
    var tabelCellLeftText:UILabel!          //cell左标签
    var tabelCellLian:UILabel!              //文字后面的横线
    var cellScrollView:UIScrollView!        //滚动容器
    var cellImageItem=["cuteChild9.jpeg","cuteChild8.jpeg","cuteChild2.jpeg","cuteChild3.jpeg","cuteChild5.jpeg"]
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        //cell父容器
        tabelCellWarp=UIView()
        tabelCellWarp.frame=CGRectMake(0, 0, screen.width-10, screen.width/3)
        tabelCellWarp.backgroundColor=UIColor.whiteColor()
        self.contentView.addSubview(tabelCellWarp)
        //cell左视图
        tabelCellLeftImage=UIImageView()
        tabelCellLeftImage.frame=CGRectMake(0, 0, screen.width/3-25, screen.width/3-25)
        //滚动容器
        cellScrollView=UIScrollView(frame: CGRectMake(CGRectGetMaxY(tabelCellLeftImage.frame)+10, 0, screen.width-(CGRectGetMaxY(tabelCellLeftImage.frame)+10), screen.width/3-25))
        cellScrollView.contentSize=CGSizeMake((screen.width/3-15)*5, screen.width/3-25);
        //cellScrollView.showsVerticalScrollIndicator = false;  //清除垂直滚动条
        cellScrollView.showsHorizontalScrollIndicator = false;//清除水平滚动条
        tabelCellWarp.addSubview(cellScrollView)
        //循环出图片容器
        for(var i=0;i<5;i++){
            let imageView:UIImageView=UIImageView()
            let imageViewX:CGFloat=(10+screen.width/3-25)*CGFloat(i)
            
            imageView.frame=CGRectMake(imageViewX, 0, screen.width/3-25, screen.width/3-25)
            imageView.image=UIImage(named: cellImageItem[i])
            cellScrollView.addSubview(imageView)
        }
        
        
        tabelCellWarp.addSubview(tabelCellLeftImage)
        //cell左标签
        tabelCellLeftText=UILabel()
        tabelCellLeftText.text="美满恩深情厚，共守白头"
        tabelCellLeftText.font=UIFont.systemFontOfSize(12)
        tabelCellLeftText.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        tabelCellLeftText.frame=CGRectMake(0, screen.width/3-20, screen.width/3+35, 20)
        tabelCellWarp.addSubview(tabelCellLeftText)
        //文字后面的横线
        tabelCellLian=UILabel()
        tabelCellLian.frame=CGRectMake(screen.width/3+40, screen.width/3-10, screen.width*2/3-50, 0.5)
        tabelCellLian.backgroundColor=UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        tabelCellWarp.addSubview(tabelCellLian)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}