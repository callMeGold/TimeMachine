//
//  dynamicTableViewCell.swift
//  TimeMachine
//
//  Created by nevermore on 15/11/17.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
import UIKit
@objc protocol dynamicTableViewCellDelegate:NSObjectProtocol,UITextFieldDelegate{
    func obj(index:NSIndexPath,textF:String)
}
class dynamicTableViewCell:UITableViewCell{
    var cellDelegate:dynamicTableViewCellDelegate?
    

    ///cell容器
    var cellView:UIView!
    ///头像
    var headerPic:UIImageView!
    ///昵称
    var nickname:UILabel!
    ///时间
    var cellTime:UILabel!
    ///标题
    var cellTitle:UILabel!
    ///发布的图片
    var cellPic:UIImageView?
    ///点赞的人
    var PraisePeople:UILabel!
    ///cell高
    var cellViewH:CGFloat!
    ///标题文字
    var cellTitleText:String?
    ///评论输入框
    var commentFeild:UITextField?
    ///
    var praise:UIImageView!
    ///
    var comment:UIImageView!
    ///点赞图标＋点赞人
    var praise1:UIImageView!
    ///评论内容
    var comment1:UILabel!
    ///
    var comment2:UILabel!
    ///添加评论
    var addComment:UILabel?
    var index:NSIndexPath?
    var textF:String?
    var commentFeildY:CGFloat!
    var addLabelY:CGFloat=0
    var addviewH:CGFloat=0
    var addview:UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        ///头像
        headerPic=UIImageView()
        self.contentView.addSubview(headerPic)
        ///昵称
        nickname=UILabel()
        
        nickname.textColor=UIColor(red: 0, green: 0.47, blue: 0.98, alpha: 1)
        nickname.font=UIFont.systemFontOfSize(16)
        self.contentView.addSubview(nickname)
        ///时间
        cellTime=UILabel()
        cellTime.textColor=UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        cellTime.font=UIFont.systemFontOfSize(14)
        self.contentView.addSubview(cellTime)
        ///标题
        cellTitle=UILabel()
        cellTitle.font=UIFont.systemFontOfSize(14)
        cellTitle.numberOfLines=0
        cellTitle.lineBreakMode=NSLineBreakMode.ByWordWrapping
        self.contentView.addSubview(cellTitle)
        ///发布的图片
        cellPic=UIImageView()
        self.contentView.addSubview(cellPic!)
        ///点赞＋评论   图标
        praise=UIImageView()
        self.contentView.addSubview(praise)
        comment=UIImageView()
        self.contentView.addSubview(comment)
        ///点赞图标＋点赞人
        praise1=UIImageView()
        self.contentView.addSubview(praise1)
        ///点赞人
        PraisePeople=UILabel()
        PraisePeople.textColor=UIColor(red: 0, green: 0.47, blue: 0.98, alpha: 1)
        PraisePeople.font=UIFont.systemFontOfSize(14)
        self.contentView.addSubview(PraisePeople)
        ///评论内容
        comment1=UILabel()
        comment1.font=UIFont.systemFontOfSize(14)
        self.contentView.addSubview(comment1)
        comment2=UILabel()
        comment2.font=UIFont.systemFontOfSize(14)
        comment2.numberOfLines=0
        comment2.lineBreakMode=NSLineBreakMode.ByWordWrapping
        self.contentView.addSubview(comment2)
        ///评论输入框
        commentFeild=UITextField()
        commentFeild?.layer.borderWidth=1
        commentFeild?.layer.borderColor=UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        commentFeild?.font=UIFont.systemFontOfSize(14)
        commentFeild?.clearButtonMode=UITextFieldViewMode.Always
        self.contentView.addSubview(commentFeild!)
        commentFeild?.addTarget(self, action: "endEdit:", forControlEvents: UIControlEvents.EditingDidEnd)
        //cellView.backgroundColor=UIColor.redColor()
    }
    ///显示数据
    func showData(entrys:DynEntity){
        ///
        headerPic.image=UIImage(named: entrys.headerPics)
         headerPic.frame=CGRectMake(10, 10, 60, 60)
        ///
        nickname.text=entrys.nicknames
        nickname.frame=CGRectMake(CGRectGetMaxX(headerPic.frame)+10, CGRectGetMinY(headerPic.frame)+10, 150, 20)
        ///
        cellTime.text=entrys.cellTimes
        cellTime.frame=CGRectMake(CGRectGetMaxX(headerPic.frame)+10, CGRectGetMaxY(nickname.frame)+10, 200, 20)
        ///
        cellTitle.text=entrys.cellTitles
        let cellTitlesize=cellTitle.text!.textSizeWithFont(cellTitle.font, constrainedToSize: CGSizeMake(screen.width-CGRectGetMaxX(headerPic.frame)+10-15, 200))
        cellTitle.frame=CGRectMake(10, CGRectGetMaxY(cellTime.frame)+5, screen.width-20, cellTitlesize.height)
        ///
        cellPic?.image=UIImage(named: entrys.cellPics)
        cellPic?.frame=CGRectMake(30, CGRectGetMaxY(cellTitle.frame)+20, screen.width-60, 100)
        ///
        praise.frame=CGRectMake(screen.width-100, CGRectGetMaxY(cellPic!.frame)+20, 20, 20)
        praise.image=UIImage(named: "44dianzan.png")
        ///
        comment.frame=CGRectMake(CGRectGetMaxX(praise.frame)+20, CGRectGetMinY(praise.frame), 20, 20)
        comment.image=UIImage(named: "iconfont-pinglun.png")
        ///
        praise1.frame=CGRectMake(10, CGRectGetMaxY(comment.frame)+5, 20, 20)
        praise1.image=UIImage(named: "54dianzan.png")
        ///
        PraisePeople.text=entrys.PraisePeoples
        PraisePeople.frame=CGRectMake(CGRectGetMaxX(praise1.frame)+5, CGRectGetMinY(praise1.frame), 300, 20)
        ///评论内容
        let str:NSMutableAttributedString=NSMutableAttributedString(string:"卢蛋蛋：哇，美女约吗");
        str.addAttribute(NSForegroundColorAttributeName, value:UIColor(red: 0, green: 0.47, blue: 0.98, alpha: 1), range:NSMakeRange(0,3));
        comment1.frame=CGRectMake(10, CGRectGetMaxY(PraisePeople.frame)+5, screen.width, 20)
        comment1.attributedText=str
        ///
        let str1:NSMutableAttributedString=NSMutableAttributedString(string:"浩鸡蛋回复卢蛋蛋：你妈蛋，跟老子抢女人，逐出师门！！！");
        str1.addAttribute(NSForegroundColorAttributeName, value:UIColor(red: 0, green: 0.47, blue: 0.98, alpha: 1), range:NSMakeRange(0,3));
        str1.addAttribute(NSForegroundColorAttributeName, value:UIColor(red: 0, green: 0.47, blue: 0.98, alpha: 1), range:NSMakeRange(5,3));
        comment2.frame=CGRectMake(10,CGRectGetMaxY(comment1.frame)+5 ,screen.width-20, 40)
        comment2.attributedText=str1
        ///追加评论
        addview=UIView()
        let count=entrys.arr.count
        print("count........\(count)")
        var i=0
        for(i=0;i<count;i++){
            addComment=UILabel()
            let addCommentY:CGFloat=30*CGFloat(i)
            let ludandan="卢蛋蛋:"+(entrys.arr[i] as! String)
            let str2:NSMutableAttributedString=NSMutableAttributedString(string:ludandan);
            str2.addAttribute(NSForegroundColorAttributeName, value:UIColor(red: 0, green: 0.47, blue: 0.98, alpha: 1), range:NSMakeRange(0,3));
            addComment?.attributedText=str2
//                =ludandan+(entrys.arr[i] as! String) as? String
            addComment?.frame=CGRectMake(10, addCommentY, screen.width-20, 40)
            addview.addSubview(addComment!)
            addComment?.font=UIFont.systemFontOfSize(14)
        }
        addviewH=CGFloat(count)*30
        addview.frame=CGRectMake(0, CGRectGetMaxY(comment2.frame), screen.width-20, addviewH)
        self.contentView.addSubview(addview)
        ///
        commentFeild?.frame=CGRectMake(10, CGRectGetMaxY(addview.frame)+15, screen.width-20, 30)
        commentFeild?.placeholder="我也来说一句"
        self.frame.size.height=CGRectGetMaxY(commentFeild!.frame)+10
        addLabelY=CGRectGetMaxY(addview.frame)
        

        
    }
   
    ///文本框输入结束事件
    func endEdit(sender:UITextField){
        
        let addLabel:UILabel=UILabel()
        
        addLabel.text=sender.text
        addLabel.font=UIFont.systemFontOfSize(14)
        addLabel.frame=CGRectMake(10, addLabelY, screen.width-20, 40)
        self.contentView.addSubview(addLabel)
        addLabelY=addLabelY+30
        commentFeildY=CGRectGetMaxY(addLabel.frame)+15
        commentFeild?.frame=CGRectMake(10, commentFeildY, screen.width-20, 30)
        textF=sender.text
        cellDelegate?.obj(index!,textF: textF!)
        self.frame.size.height=CGRectGetMaxY(commentFeild!.frame)+10
        print("add...\(addLabelY)")
        print("comment....\(commentFeildY)")
        print("cellH.....\(self.frame.size.height)")
        //self.contentView.backgroundColor=UIColor.redColor()
        sender.text=""
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}