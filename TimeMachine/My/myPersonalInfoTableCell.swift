//
//  myPersonalInfoTableCell.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/9.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class myPersonalInfoTableCell:UITableViewCell {
    var cellWarp:UIView!            //cell父视图
    var cellWarpH:CGFloat=0         //高
    var cellText="dandanhhhh"
    var cellLabel:UILabel!
    var cellTextLabel:UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //cell父视图
        cellWarp=UIView()
        cellWarp.backgroundColor=UIColor.grayColor()
        cellWarp.frame=CGRectMake(0, 0, screen.width, cellWarpH)
        self.contentView.addSubview(cellWarp)
        
    }
    func cellZero(){
        //标题
        cellLabel=UILabel()
        cellLabel.frame=CGRectMake(10, 20, 60, 20)
        cellLabel.text="头像"
        cellWarp.addSubview(cellLabel)
        //头像
        let cellImage:UIImageView=UIImageView()
        cellImage.frame=CGRectMake(screen.width-80, 5, 50, 50)
        cellImage.image=UIImage(named: "goddess3.jpg")
        cellImage.layer.cornerRadius=25
        cellImage.layer.masksToBounds=true
        cellWarp.addSubview(cellImage)
    }
    func cellOne(){
        //标题
        cellLabel=UILabel()
        cellLabel.frame=CGRectMake(10, 20, 100, 20)
        cellLabel.text="头像"
        cellWarp.addSubview(cellLabel)
        
        //标题信息
        let cellTextSize=cellText.textSizeWithFont(UIFont.systemFontOfSize(16), constrainedToSize: CGSizeMake(300, 20))
        let cellTextW:CGFloat=cellTextSize.width
        cellTextLabel=UILabel()
        cellTextLabel.frame=CGRectMake(screen.width-30-cellTextW, 15, cellTextW, 20)
        cellTextLabel.text=cellText;
        cellTextLabel.font=UIFont.systemFontOfSize(16)
        cellWarp.addSubview(cellTextLabel)
    }
   



    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
