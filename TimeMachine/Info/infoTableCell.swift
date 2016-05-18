//
//  infoTableCell.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/6.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
class infoTableCell:UITableViewCell {
    var cellTime:UILabel!           //时间
    var cellIofo:UILabel!           //交互请求消息
    var cellClickSeach:UILabel!     //点击查看详情
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //图片
        let cellImage:UIImageView=UIImageView()
        cellImage.frame=CGRectMake(0, 0, 40, 100)
        cellImage.image=UIImage(named: "infoCell.jpg")
        self.contentView.addSubview(cellImage)
        //时间
        let timeText="2015-11-11 11:11:11"
        let timeTextSize=timeText.textSizeWithFont(UIFont.systemFontOfSize(14), constrainedToSize: CGSizeMake(screen.width-CGRectGetMaxX(cellImage.frame), 20))
        let timeTextSizeW:CGFloat=timeTextSize.width
        let timeTextSizeH:CGFloat=timeTextSize.height
        
        cellTime=UILabel()
        cellTime.frame=CGRectMake(CGRectGetMaxX(cellImage.frame), 5, timeTextSizeW, timeTextSizeH)
        cellTime.text=timeText;
        cellTime.font=UIFont.systemFontOfSize(14)
        cellTime.textColor=UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1)
        self.contentView.addSubview(cellTime)
        //系统消息标签
        let cellSystemMessage:UILabel=UILabel()
        cellSystemMessage.frame=CGRectMake(CGRectGetMinX(cellTime.frame), CGRectGetMaxY(cellTime.frame)+5, 100, 20)
        cellSystemMessage.text="系统消息"
        cellSystemMessage.font=UIFont.systemFontOfSize(16)
        cellSystemMessage.textColor=UIColor(red: 0.28, green: 0.65, blue: 0.88, alpha: 1)
        self.contentView.addSubview(cellSystemMessage)
        //交互请求消息
        let Celltext="你以向卢蛋蛋申请加入他的家庭，请耐心等待他的回复"
        let CelltextSize=Celltext.textSizeWithFont(UIFont.systemFontOfSize(14), constrainedToSize: CGSizeMake(screen.width-CGRectGetMinX(cellTime.frame)-15, 20));
        let cellInfoW:CGFloat=CelltextSize.width;
        let cellInfoH:CGFloat=CelltextSize.height;
        cellIofo=UILabel()
        cellIofo.frame=CGRectMake(CGRectGetMinX(cellTime.frame), CGRectGetMaxY(cellSystemMessage.frame)+5, cellInfoW, cellInfoH);
        cellIofo.text=Celltext;
        cellIofo.textColor=UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1)
        self.contentView.addSubview(cellIofo)
        //点击查看详情
        cellClickSeach=UILabel()
        cellClickSeach.frame=CGRectMake(CGRectGetMinX(cellTime.frame), CGRectGetMaxY(cellIofo.frame)+5, 150, 20)
        cellClickSeach.text="点击查看详情>>"
        cellClickSeach.userInteractionEnabled=true
               cellClickSeach.textColor=UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1)
        self.contentView.addSubview(cellClickSeach)
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
