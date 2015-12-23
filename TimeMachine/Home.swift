//
//  ViewController.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//
var screen = UIScreen.mainScreen().bounds       //屏幕
import UIKit
class Home: UIViewController ,UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate{
    
    var seachWarp:UIView!                           //搜索框容器
    var seachFeild:UITextField!                     //搜索框
    var cameraWarp:UIView!                          //照相机容器
    var cameraImage:UIButton!                       //照相机图片
    var globalView:UIScrollView!                    //轮播图父视图
    var scrollview:UIScrollView!                    //添加图片滚动容器
    var pageControl:UIPageControl!                  //分页。。。容器
    var imageView:UIImageView!                      //图片容器
    var newDynamicWarp:UIView!                      //最新动态父容器
    var imageItem=["family1.jpg","family2.jpg","family3.jpg","family4.jpg"]
    //图片集合
    var goddessItem=["goddess5.jpg","goddess1.jpg","goddess4.jpg"]
    //美女图片集合
    var goddessTextItem=["九月","再见夏日","每日一拍"]
    var totalCount=4;                 //图片个数
    var timer:NSTimer!                              //计时器
    var cuteChildItem=["cuteChild4.jpg","cuteChild5.jpeg","cuteChild6.jpeg","cuteChild7.jpeg","cuteChild8.jpeg","cuteChild9.jpeg"]
    //孩子图片集合
    var sameSurnameImageItem=["cuteChild9.jpeg","cuteChild8.jpeg","cuteChild2.jpeg","cuteChild3.jpeg","cuteChild5.jpeg"]
    var sameSurnameTextItem=["头条","海上姑娘","萌宝的麻麻","好妈妈教学","本地陈氏"]
    var hotWarp:UIView!                             //最热推荐父容器
    var hotText:UILabel!                            //最热推荐标签
    var cuteChildWarp:UIView!                       //图片父视图
    var cuteChildImageWarp:UIView!                  //图片子视图
    var cuteChildImage:UIImageView!                 //图片
    var hotBtn:UIButton!                            //最热推荐边上图标
    var screenScrollView:UIScrollView!              //全局滚动
    var i=0;
    var serviceCollection:UICollectionView!            //最热推荐collection层
    var sameSurnameCollectionView:UICollectionView!    //相同姓氏collection层
    var cellPicW:CGFloat=0;                                       //图片item宽度
    var collectionH:CGFloat=0;                                  //collection高度
    var flowLayoutW:CGFloat!
    var flowLayoutH:CGFloat!
    var photoTabelWarp:UIView!                            //相片展示父容器
    var photoTabelView:UITableView!                       //相片展示tabel
    var photoItem=["matrimony.jpg","baby.jpg","health.jpg","growth.jpg"]
    var tabelTextItem=["美满恩深情厚，共守白头","小宝宝萌照，可爱到掉渣","生命不息，保健不止","热爱分享，你也是达人"]
     //导航栏颜色透明
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.lt_setBackgroundColor(UIColor.blackColor().colorWithAlphaComponent(0.2))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("成功创建", "打印这个东西")
        //全局滚动
        screenScrollView=UIScrollView(frame: CGRectMake(0, 0, screen.width, screen.height))
        
        screenScrollView.showsVerticalScrollIndicator = false;  //清除滚动条
        self.view.addSubview(screenScrollView);
        
        
        playView();
        nav();
        zuire();
        photoTabel();
        newDynamic();
        screenScrollView.contentSize=CGSizeMake(screen.width, CGRectGetMaxY(newDynamicWarp.frame)+20);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //导航栏
    func nav(){
        ///搜索框容器
        let seachWarpX:CGFloat = 0;
        let seachWarpY:CGFloat = 5;
        let seachWarpW:CGFloat = screen.width-90;
        let seachWarpH:CGFloat = 30;
        seachWarp=UIView(frame: CGRectMake(seachWarpX, seachWarpY, seachWarpW, seachWarpH))
        
        ///搜索框
        seachFeild=UITextField(frame: CGRectMake(0, 0, seachWarpW, seachWarpH))
        seachFeild.placeholder="请输入你要搜索的照片";
        seachFeild.clearButtonMode=UITextFieldViewMode.WhileEditing;
        seachFeild.font=UIFont.systemFontOfSize(14)
        seachFeild.layer.cornerRadius=7;
        seachFeild.backgroundColor=UIColor.whiteColor();
        seachWarp.addSubview(seachFeild);
        self.navigationItem.titleView=seachWarp;
        
        ///照相机容器
        let cameraWarpX:CGFloat = 0;
        let cameraWarpY:CGFloat = 0;
        let cameraWarpW:CGFloat = 55;
        let cameraWarpH:CGFloat = 30;
        cameraWarp = UIView(frame: CGRectMake(cameraWarpX, cameraWarpY, cameraWarpW, cameraWarpH))
        
        ///插入照相机图片到右按钮
        cameraImage=UIButton();
        cameraImage.frame=CGRectMake(25, 0, 30, 30);
        cameraImage.setBackgroundImage(UIImage(named: "camera.png"), forState: UIControlState.Normal)
        cameraWarp.addSubview(cameraImage);
        let rightView:UIBarButtonItem = UIBarButtonItem(customView: cameraWarp)
        self.navigationItem.rightBarButtonItem = rightView;
    }
    ///最热推荐文字及下部的图片UICollectionView布局
    func zuire(){
        ///最热推荐文字
        let hotTextX:CGFloat=0;
        let hotTextY:CGFloat=CGRectGetMaxY(globalView.frame)+20
        let hotTextW:CGFloat=screen.width/2+20;
        let hotTextH:CGFloat=20;
        hotText=UILabel(frame: CGRectMake(hotTextX, hotTextY, hotTextW, hotTextH))
        hotText.text="最热推荐";
        hotText.textColor=UIColor.whiteColor()
        hotText.textAlignment=NSTextAlignment.Right;
        hotText.font=UIFont.systemFontOfSize(18)
        hotText.userInteractionEnabled=true
        let tap=UITapGestureRecognizer(target: self, action: "clickHotText")
        hotText.addGestureRecognizer(tap)
        screenScrollView.addSubview(hotText);
        
        //最热推荐图标
        
        hotBtn=UIButton(frame: CGRectMake(hotTextW+3, hotTextY, 20, 20))
        hotBtn.setBackgroundImage(UIImage(named: "zuire"), forState: UIControlState.Normal)
        hotBtn.addTarget(self, action: "action", forControlEvents: UIControlEvents.TouchUpInside)
        screenScrollView.addSubview(hotBtn)
        //最热推荐父容器
        let hotWarpX:CGFloat=10;
        let hotWarpY:CGFloat=hotTextY+50;
        let hotWarpW:CGFloat=screen.width-hotWarpX*2;
        let hotWarpH:CGFloat=screen.width+60;
        hotWarp=UIView(frame: CGRectMake(hotWarpX, hotWarpY, hotWarpW, hotWarpH))
        hotWarp.backgroundColor=UIColor.whiteColor()
        hotWarp.layer.cornerRadius=6;
        screenScrollView.addSubview(hotWarp);
        
        let flowLayout=UICollectionViewFlowLayout();
        flowLayoutW=(screen.width-50)/3;
        flowLayoutH=(screen.width-50)/3;
        flowLayout.itemSize=CGSizeMake(flowLayoutW, flowLayoutH)
        flowLayout.minimumLineSpacing=5;    //每个相邻layout的上下
        flowLayout.minimumInteritemSpacing=5;   //每个相邻layout的左右
        flowLayout.headerReferenceSize=CGSizeMake(0, 0);
        
        //创建UICollectionView
        serviceCollection=UICollectionView(frame:CGRectMake(10, 10, hotWarpW-20, (hotWarpW-20)*2/3), collectionViewLayout:flowLayout)
        serviceCollection.backgroundColor=UIColor.whiteColor();
        serviceCollection.delegate=self;
        serviceCollection.tag=100;
        serviceCollection.dataSource=self;
        serviceCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell" )
        hotWarp.addSubview(serviceCollection);
        
        //相同姓氏标签父视图
        let sameSurnameWarp=UIView(frame: CGRectMake(0, CGRectGetMaxY(serviceCollection.frame)+30, hotWarpW, 30))
        hotWarp.addSubview(sameSurnameWarp)
        
        ///相同姓氏标签前面的线条
        let sameSurnameLian:UILabel=UILabel(frame: CGRectMake(0, 15, hotWarpW, 0.5))
        sameSurnameWarp.addSubview(sameSurnameLian)
        sameSurnameLian.backgroundColor=UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        
        ///相同姓氏标签前面的波浪线条
        let sameSurnameImage:UIImageView=UIImageView(frame: CGRectMake(hotWarpW/3-30, 5.5, 30, 20))
        sameSurnameImage.image=UIImage(named: "bolian.jpg")
        sameSurnameWarp.addSubview(sameSurnameImage)
        
        ///相同姓氏标签
        let sameSurnameLabel:UILabel=UILabel(frame: CGRectMake(CGRectGetMaxX(sameSurnameImage.frame), 5, hotWarpW/3, 20))
        sameSurnameLabel.font=UIFont.systemFontOfSize(16)
        sameSurnameLabel.text="相同姓氏";
        sameSurnameLabel.textColor=UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1);
        sameSurnameLabel.backgroundColor=UIColor.whiteColor()
        sameSurnameLabel.textAlignment=NSTextAlignment.Center;
        sameSurnameWarp.addSubview(sameSurnameLabel)
        
        ///相同姓氏下面的图片
        let sameSurnameFlowLayout=UICollectionViewFlowLayout();
        let sameSurnameFlowLayoutW:CGFloat=hotWarpW/5;
        let sameSurnameFlowLayoutH:CGFloat=hotWarpW/5+30;
        sameSurnameFlowLayout.itemSize=CGSizeMake(sameSurnameFlowLayoutW, sameSurnameFlowLayoutH)
        sameSurnameFlowLayout.minimumInteritemSpacing=0 //每个相邻layout的左右
        sameSurnameFlowLayout.minimumLineSpacing=0 //每个相邻layout的上下
        sameSurnameFlowLayout.headerReferenceSize=CGSizeMake(0, 0);
        sameSurnameFlowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical//设置垂直显示
        sameSurnameFlowLayout.sectionInset = UIEdgeInsetsMake(0,0,0,0)//设置边距
        
        //创建UICollectionView
        sameSurnameCollectionView=UICollectionView(frame: CGRectMake(0, CGRectGetMaxY(sameSurnameWarp.frame)+30, hotWarpW, sameSurnameFlowLayoutH), collectionViewLayout: sameSurnameFlowLayout)
        sameSurnameCollectionView.backgroundColor=UIColor.whiteColor();
        sameSurnameCollectionView.delegate=self
        sameSurnameCollectionView.tag=200
        sameSurnameCollectionView.dataSource=self
        sameSurnameCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "sameSurnameCell")
        hotWarp.addSubview(sameSurnameCollectionView)

    }
    ///点击最热推荐标签
    func clickHotText(){
        let Nexthome = test();
        Nexthome.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
        self.navigationController!.pushViewController(Nexthome, animated: true)

    }
        ///返回多少个
    func collectionView(collectionView:UICollectionView,numberOfItemsInSection section:Int)->Int{
        var a=0
        if collectionView.tag == 100
        {
        a = 6;
        }
        if collectionView.tag == 200
        {
            a = 5;
        }
        return a;
    }
    ///返回多少组
    func numberOfSectionInCollectionView(collectiomView:UICollectionView)->Int{
        return 1;
    }
    //每个UICollectionView展示的内容(数据源)
    func collectionView(collectionView:UICollectionView,cellForItemAtIndexPath indexPath:NSIndexPath)->UICollectionViewCell
    {

        

        
        var Cell:UICollectionViewCell=UICollectionViewCell()
        if collectionView.tag==100
        {
            let cell=collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath);
            //2.图片
            let imageItem:UIImageView=UIImageView(frame: CGRectMake(0, 0,(screen.width-50)/3, (screen.width-50)/3));
            
            imageItem.image=UIImage(named: cuteChildItem[indexPath.row]);
            cell.contentView.addSubview(imageItem)
            Cell=cell;
        }
        if collectionView.tag==200
        {
            let sameSurnameCell=collectionView.dequeueReusableCellWithReuseIdentifier("sameSurnameCell", forIndexPath: indexPath)
            //1.定义父视图，容纳图片和文字
            let cellWrap=UIView(frame: CGRectMake(5, 5, (screen.width-20)/5-10, (screen.width-20)/5))
            cellWrap.backgroundColor=UIColor.whiteColor()
            sameSurnameCell.contentView.addSubview(cellWrap)
            //2.图片
            let sameSurnameImage:UIImageView=UIImageView(frame: CGRectMake(5, 5, (screen.width-20)/5-20, (screen.width-20)/5-20))
            sameSurnameImage.layer.cornerRadius=((screen.width-20)/5-20)/2
            sameSurnameImage.layer.masksToBounds=true
            sameSurnameImage.image=UIImage(named: sameSurnameImageItem[indexPath.row])
            cellWrap.addSubview(sameSurnameImage)
            
            //2.文字
            let sameSurnameText:UILabel=UILabel();
            sameSurnameText.frame=CGRectMake(5, (screen.width-20)/5-10, (screen.width-20)/5-20, 20)
            sameSurnameText.text=sameSurnameTextItem[indexPath.row]
            sameSurnameText.font=UIFont.systemFontOfSize(14)
            sameSurnameText.textAlignment=NSTextAlignment.Center
            sameSurnameText.textColor=UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
            cellWrap.addSubview(sameSurnameText)
            Cell=sameSurnameCell;
        }
        return Cell;
        
    }
    //选中后调用
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let Nexthome = Login();
        Nexthome.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
        self.navigationController!.pushViewController(Nexthome, animated: true)

    }
    //返回这个UICollectionView是否可以被选择
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    //相片展示tabel
    func photoTabel(){
        ///相片展示父容器
        photoTabelWarp=UIView()
        let photoTabelWarpX:CGFloat=0;
        let photoTabelWarpY:CGFloat=CGRectGetMaxY(hotWarp.frame)+40;
        let photoTabelWarpW:CGFloat=screen.width;
        let photoTabelWarpH:CGFloat=screen.width*1.5+60
        photoTabelWarp.frame=CGRectMake(photoTabelWarpX, photoTabelWarpY, photoTabelWarpW, photoTabelWarpH)
        photoTabelWarp.backgroundColor=UIColor.whiteColor();
        screenScrollView.addSubview(photoTabelWarp);
        //创建tabel控件
        photoTabelView=UITableView(frame: CGRectMake(10, 10, photoTabelWarpW-10, (screen.width/3+10)*4), style: UITableViewStyle.Plain)
        photoTabelView.delegate=self
        photoTabelView.dataSource=self
        photoTabelView.backgroundColor=UIColor.grayColor()
        photoTabelWarp.addSubview(photoTabelView);
        //去除分割线
        photoTabelView.separatorStyle=UITableViewCellSeparatorStyle.None;
        //tabel下部的查看更多标签与图标
        let seeMore=UIView()
        seeMore.frame=CGRectMake(0, CGRectGetMaxY(photoTabelView.frame)+10, screen.width, 40)
        photoTabelWarp.addSubview(seeMore)
        //tabel下部的查看更多标签
        let seeMoreText:UILabel=UILabel(frame: CGRectMake(screen.width/2, 10, screen.width/2-60, 20))
        seeMoreText.text="查看更多"
        seeMoreText.textAlignment=NSTextAlignment.Right
        seeMoreText.font=UIFont.systemFontOfSize(16)
        seeMoreText.userInteractionEnabled=true
        seeMoreText.textColor=UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        seeMore.addSubview(seeMoreText)
        //tabel下部的查看更多 图标
        let seeMoreImage=UIButton()
        seeMoreImage.frame=CGRectMake(screen.width-50, 5, 30, 30)
        seeMoreImage.setBackgroundImage(UIImage(named: "see.jpg"), forState: UIControlState.Normal)
        seeMore.addSubview(seeMoreImage)
    }
    
    //2.返回几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    //3.返回多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    //4.返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return screen.width/3+10;
    }
    //5.数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义标示符
        let cellIdeifier:String="cellIdeifier";
        var cell=tableView.dequeueReusableCellWithIdentifier(cellIdeifier) as? tableViewCell;
        if(cell == nil){
            cell=tableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdeifier) as? tableViewCell;
        }
        cell!.tabelCellLeftImage.image=UIImage(named: photoItem[indexPath.row])
        cell!.tabelCellLeftText.text=tabelTextItem[indexPath.row]
        //把数组的值赋给单元格
        //cell.textLabel!.text=items[indexPath.row];
        //创建cell容器
//        let cellTabelWarp:UIView=UIView()
//        cellTabelWarp.frame=CGRectMake(0, 0, screen.width, screen.width*4)
//        cellTabelWarp.backgroundColor=UIColor.grayColor()
//        cell?.contentView.addSubview(cellTabelWarp)
        return cell!;
    }
    //6.表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //释放选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        //获得点击的cell
        //let cell=tableView.cellForRowAtIndexPath(indexPath);
        //let currCell=items[indexPath.row];
        //print("当前选中了\(currCell)")
        let Nexthome = Login();
        Nexthome.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
        self.navigationController!.pushViewController(Nexthome, animated: true)

    }
    //最新动态
    func newDynamic(){
        //最新动态父容器
        newDynamicWarp=UIView()
        let newDynamicWarpX:CGFloat=10;
        let newDynamicWarpY:CGFloat=CGRectGetMaxY(photoTabelWarp.frame)+40
        let newDynamicWarpW:CGFloat=screen.width-20
        let newDynamicWarpH:CGFloat=screen.width/3+111
        newDynamicWarp.frame=CGRectMake(newDynamicWarpX, newDynamicWarpY, newDynamicWarpW,newDynamicWarpH)
        newDynamicWarp.backgroundColor=UIColor.whiteColor()
        newDynamicWarp.layer.cornerRadius=7;
        screenScrollView.addSubview(newDynamicWarp)
        //最新动态标签
        let newDynamicText:UILabel=UILabel()
        newDynamicText.frame=CGRectMake(0, 20, newDynamicWarpW, 20)
        newDynamicText.text="最新动态"
        newDynamicText.font=UIFont.systemFontOfSize(18)
        newDynamicText.textAlignment=NSTextAlignment.Center
        newDynamicWarp.addSubview(newDynamicText)
        //最新动态图片
        let newDynamicImageWarp=UIView(frame: CGRectMake(10, 60, newDynamicWarpW-20, (newDynamicWarpW-40)/3))
        newDynamicWarp.addSubview(newDynamicImageWarp)
        //循环出图片＋文字容器
        for(var i=0;i<3;i++){
            let newDynamicImage:UIImageView=UIImageView()
            let newDynamicImageY:CGFloat=0
            let newDynamicImageW:CGFloat=CGRectGetHeight(newDynamicImageWarp.frame)
            let newDynamicImageH:CGFloat=newDynamicImageW
            let newDynamicImageX:CGFloat=(10+newDynamicImageW)*CGFloat(i)
            newDynamicImage.frame=CGRectMake(newDynamicImageX, newDynamicImageY, newDynamicImageW, newDynamicImageH)
            newDynamicImage.image=UIImage(named: goddessItem[i])
            newDynamicImage.userInteractionEnabled=true
            let tap=UITapGestureRecognizer(target: self, action: "clicknewDynamicImage")
            newDynamicImage.addGestureRecognizer(tap)
            newDynamicImageWarp.addSubview(newDynamicImage)
           
            //图片上的文字
            let newDynamicImageText:UILabel=UILabel()
            let newDynamicImageTextX:CGFloat=(10+newDynamicImageW)*CGFloat(i)
            let newDynamicImageTextY:CGFloat=newDynamicImageH-20
            let newDynamicImageTextW:CGFloat=newDynamicImageW
            let newDynamicImageTextH:CGFloat=20
            newDynamicImageText.frame=CGRectMake(newDynamicImageTextX, newDynamicImageTextY, newDynamicImageTextW, newDynamicImageTextH)
            newDynamicImageText.text = goddessTextItem[i]
            newDynamicImageText.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            newDynamicImageText.textColor=UIColor.whiteColor()
            newDynamicImageText.textAlignment=NSTextAlignment.Center
            newDynamicImageWarp.addSubview(newDynamicImageText)
        }
        //全部动态按钮父视图
        let allDynamicBtn1=UIView(frame: CGRectMake(newDynamicWarpW/3, CGRectGetMaxY(newDynamicImageWarp.frame)+20, newDynamicWarpW/3+1, 31))
        allDynamicBtn1.layer.cornerRadius=15.5
        allDynamicBtn1.backgroundColor=UIColor(red: 0.96, green: 0.64, blue: 0.19, alpha: 1)
        newDynamicWarp.addSubview(allDynamicBtn1)
        //全部动态按钮
        let allDynamicBtn:UIButton = UIButton();
        allDynamicBtn.frame=CGRectMake(0.5, 0.5, newDynamicWarpW/3, 30)
        allDynamicBtn.setTitle("全部动态", forState: UIControlState.Normal)
        allDynamicBtn.layer.cornerRadius=15
        //allDynamicBtn.layer.borderColor=UIColor.redColor().CGColor;
        //allDynamicBtn.layer.borderWidth=1;
        allDynamicBtn.backgroundColor=UIColor.whiteColor()
        allDynamicBtn.setTitleColor(UIColor(red: 0.96, green: 0.64, blue: 0.19, alpha: 1), forState: UIControlState.Normal)
        allDynamicBtn1.addSubview(allDynamicBtn)
        allDynamicBtn.addTarget(self, action: "goLogin", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    ///点击最新动态里面的图片事件
    func clicknewDynamicImage(){
        let Nexthome = Login();
        Nexthome.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
        self.navigationController!.pushViewController(Nexthome, animated: true)
    }
    //如果没有登录点击跳转登录页面
    func goLogin(){
        let Nexthome = Login();
        Nexthome.hidesBottomBarWhenPushed=true;//点击后隐藏工具栏
        self.navigationController!.pushViewController(Nexthome, animated: true)
    }
    


    /** 轮播 */
    func playView(){
        let globalViewX:CGFloat=0;
        let globalViewY:CGFloat=20;
        let globalViewW:CGFloat=screen.width;
        let globalViewH:CGFloat=150;
        globalView=UIScrollView(frame: CGRectMake(globalViewX, globalViewY, globalViewW, globalViewH));
        screenScrollView.addSubview(globalView);
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
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController!.navigationBar.lt_reset()
//        self.navigationController!.navigationBar.tintColor=UIColor.appMainColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

