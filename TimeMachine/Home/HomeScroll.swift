//
//  HomeScroll.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/28.
//  Copyright © 2015年 nmore. All rights reserved.
//

import Foundation
extension Home{
    /** 轮播 */
    func playView(){
        let globalViewX:CGFloat=20;
        let globalViewY:CGFloat=0;
        let globalViewW:CGFloat=screen.width;
        let globalViewH:CGFloat=150;
        globalView=UIScrollView(frame: CGRectMake(globalViewX, globalViewY, globalViewW, globalViewH));
        self.view.addSubview(globalView);
        globalView.showsHorizontalScrollIndicator=false;
        
        //1.添加广告滚动容器
        scrollview=UIScrollView(frame: CGRectMake(0, 0, globalViewW,150));
        scrollview.showsHorizontalScrollIndicator=false;
        scrollview.pagingEnabled=true;
        globalView.addSubview(scrollview);
        //2.添加分页
        pageControl=UIPageControl(frame: CGRectMake((screen.width)/2, scrollview!.frame.height-30, 0, 10));
        pageControl.pageIndicatorTintColor=UIColor.grayColor();
        pageControl.currentPageIndicatorTintColor=UIColor.whiteColor();
        globalView.addSubview(pageControl)
        //pageControl?.backgroundColor=UIColor.redColor()
        //3.添加图片
        //图片宽高
        let imageW:CGFloat=scrollview!.frame.width;
        let imageH:CGFloat=scrollview!.frame.height;
        let imageY:CGFloat=0;
        
        //循环添加图片
        for(var i=0;i < totalCount;i++){
            imageView=UIImageView();
            let imageX:CGFloat=CGFloat(i) * imageW;
            //设置frame
            imageView.frame=CGRectMake(imageX, imageY, imageW, imageH);
            //设置图片
            imageView.image=UIImage(named: imageItem[i]);
            scrollview.addSubview(imageView);
        }
        scrollview.contentSize=CGSizeMake((screen.width)*CGFloat(totalCount), 0);
        pageControl.numberOfPages=totalCount;
        pageControl.currentPage=0;
        //监听滚动
        scrollview.delegate=self;
        addTimer();
        
    }
    
    
    //下一张图片
    func nextImage(){
        var page:Int=pageControl.currentPage;
        print(page)
        if(page == totalCount - 1){
            page=0;
        }else{
            page++;
        }
        //滚动scrollView
        let x:CGFloat=CGFloat(page) * scrollview.frame.width;
        scrollview.contentOffset=CGPointMake(x, 0);
        
    }
    //开始滚动调用
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //计算页码
        let scrollviewW:CGFloat=scrollView.frame.width;
        let x:CGFloat=scrollView.contentOffset.x;
        let page:Int=(Int)((x + scrollviewW/2)/scrollviewW);
        pageControl.currentPage=page;
    }
    
    //开始拖拽的时候调用
    func scrollViewWillBeginDragging(scrollView:UIScrollView){
        //关闭定时器
        removeTimer();
    }
    //结束拖拽的时候调用
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //开启定时器
        addTimer();
    }
    /**
    * 开启定时器
    **/
    func addTimer(){
        timer=NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "nextImage", userInfo: nil, repeats: true);
        
        
    }
    /**
    *关闭定时器
    **/
    func removeTimer(){
        timer.invalidate();
    }
    
    
    

    
}
