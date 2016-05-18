//
//  Login.swift
//  TimeMachine
//
//  Created by nevermore on 15/10/27.
//  Copyright © 2015年 nmore. All rights reserved.
//
import Foundation
import UIKit
class Login:UIViewController {
    var viewWarp:UIView!            //父视图
    var userField:UITextField?
    var passwordField:UITextField?
    var loginBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
               initView()  ;
    }
    //初始化ui控件
    func initView(){
        self.title="登录"
        whole();
    }
    func whole(){
        //父视图
        viewWarp=UIView()
        let viewWarpX:CGFloat=0
        let viewWarpY:CGFloat=0
        let viewWarpW:CGFloat=screen.width
        let viewWarpH:CGFloat=screen.height
        viewWarp.frame=CGRectMake(viewWarpX, viewWarpY, viewWarpW, viewWarpH)
        self.view.addSubview(viewWarp)
        //添加背景图
        let wholeBg:UIImageView=UIImageView()
        wholeBg.frame=CGRectMake(viewWarpX,0, viewWarpW, viewWarpH)
        wholeBg.image=UIImage(named: "Bg6.jpeg")
        viewWarp.addSubview(wholeBg)
        //头像位置
        let headImageWarp=UIView()
        let headImageWarpX:CGFloat=screen.width/2-50
        let headImageWarpY:CGFloat=84
        let headImageWarpW:CGFloat=100
        let headImageWarpH:CGFloat=100
        headImageWarp.frame=CGRectMake(headImageWarpX, headImageWarpY, headImageWarpW, headImageWarpH)
        headImageWarp.layer.cornerRadius=headImageWarpH/2
        headImageWarp.layer.borderWidth=2
        headImageWarp.layer.borderColor=UIColor(red: 0.60, green: 0.81, blue: 0.82, alpha: 1).CGColor
        headImageWarp.backgroundColor=UIColor(red: 0.22, green: 0.56, blue: 0.72, alpha: 0.5)
        viewWarp.addSubview(headImageWarp)
        //插入头像图片
        let headImage:UIImageView=UIImageView()
        let headImageX:CGFloat=5
        let headImageY:CGFloat=5
        let headImageW:CGFloat=90
        let headImageH:CGFloat=90
        headImage.layer.cornerRadius=headImageH/2
        headImage.image=UIImage(named: "jiqimao.jpg")
        headImage.frame=CGRectMake(headImageX, headImageY, headImageW, headImageH)
        headImageWarp.addSubview(headImage)
        headImage.layer.masksToBounds=true;
        //用户名输入文本框
        userField=UITextField()
        let userFieldX:CGFloat=20
        let userFieldY:CGFloat=CGRectGetMaxY(headImageWarp.frame)+20
        let userFieldW:CGFloat=screen.width-40
        let userFieldH:CGFloat=40
        userField?.frame=CGRectMake(userFieldX, userFieldY, userFieldW, userFieldH)
        userField?.placeholder="用户名／邮箱／手机号"
        userField?.clearButtonMode=UITextFieldViewMode.WhileEditing
        userField?.layer.cornerRadius=userFieldH/2
        userField?.font=UIFont.systemFontOfSize(14)
        userField?.keyboardType=UIKeyboardType.NumberPad
        userField?.userInteractionEnabled=true
        userField?.addTarget(self, action: "clickUser:", forControlEvents: UIControlEvents.EditingDidEnd)
        userField?.backgroundColor=UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        viewWarp.addSubview(userField!)
        //添加用户图标
        let userImageWarp=UIView()
        userImageWarp.frame=CGRectMake(0, 0, 80, 40)
        let userImage:UIImageView=UIImageView()
        userImage.frame=CGRectMake(30, 5, 30, 30)
        userImage.image=UIImage(named: "yonghu.png")
        userImageWarp.addSubview(userImage)
        userField?.leftView=userImageWarp
        userField?.leftViewMode = .Always
        //密码输入文本框
        passwordField=UITextField()
        let passwordFieldX:CGFloat=20
        let passwordFieldY:CGFloat=CGRectGetMaxY(userField!.frame)+10
        let passwordFieldW:CGFloat=screen.width-40
        let passwordFieldH:CGFloat=40
        passwordField?.frame=CGRectMake(passwordFieldX, passwordFieldY, passwordFieldW, passwordFieldH)
        passwordField?.placeholder="请输入密码"
        passwordField!.secureTextEntry=true
        passwordField?.layer.cornerRadius=passwordFieldH/2
        passwordField?.clearButtonMode=UITextFieldViewMode.WhileEditing
        passwordField?.backgroundColor=UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        passwordField?.font=UIFont.systemFontOfSize(14)
        //插入密码图标
        let passwordImageWarp=UIView()
        passwordImageWarp.frame=CGRectMake(0, 0, 80, 40)
        let passwordImage:UIImageView=UIImageView()
        passwordImage.frame=CGRectMake(30, 3, 30, 30)
        passwordImage.image=UIImage(named: "mima.png")
        passwordImageWarp.addSubview(passwordImage)
        passwordField?.leftView=passwordImageWarp
        passwordField?.leftViewMode = .Always
        viewWarp.addSubview(passwordField!)
        //记住密码按钮＋文字
        let RememberPasswordBtn:UIButton=UIButton()
        RememberPasswordBtn.frame=CGRectMake(50, CGRectGetMaxY(passwordField!.frame)+10, 30, 30)
        RememberPasswordBtn.setBackgroundImage(UIImage(named: "iconfont-unchecked.png"), forState: UIControlState.Normal)
        RememberPasswordBtn.setBackgroundImage(UIImage(named: "iconfont-success.png"), forState: UIControlState.Selected)
        RememberPasswordBtn.addTarget(self, action: "check:", forControlEvents: UIControlEvents.TouchUpInside)
        RememberPasswordBtn.selected=false;
        viewWarp.addSubview(RememberPasswordBtn)
        let RememberPasswordText:UILabel=UILabel()
        RememberPasswordText.frame=CGRectMake(85, CGRectGetMaxY(passwordField!.frame)+15, screen.width/2-75, 20)
        RememberPasswordText.text="记住密码"
        RememberPasswordText.textColor=UIColor.whiteColor()
        RememberPasswordText.font=UIFont.systemFontOfSize(16)
        viewWarp.addSubview(RememberPasswordText)
        //自动登录按钮＋文字
        let automaticLoginBtn:UIButton=UIButton()
        automaticLoginBtn.frame=CGRectMake(screen.width/2+30, CGRectGetMaxY(passwordField!.frame)+10, 30, 30)
        automaticLoginBtn.setBackgroundImage(UIImage(named: "iconfont-unchecked.png"), forState: UIControlState.Normal)
        automaticLoginBtn.setBackgroundImage(UIImage(named: "iconfont-success.png"), forState: UIControlState.Selected)
        automaticLoginBtn.addTarget(self, action: "check:", forControlEvents: UIControlEvents.TouchUpInside)
        automaticLoginBtn.selected=false;
        viewWarp.addSubview(automaticLoginBtn)
        let automaticLoginText:UILabel=UILabel()
        automaticLoginText.frame=CGRectMake(CGRectGetMaxX(automaticLoginBtn.frame)+5, CGRectGetMaxY(passwordField!.frame)+15, screen.width/2-75, 20)
        automaticLoginText.text="自动登录"
        automaticLoginText.textColor=UIColor.whiteColor()
        automaticLoginText.font=UIFont.systemFontOfSize(16)
        viewWarp.addSubview(automaticLoginText)
        //登录按钮
        loginBtn=UIButton()
        let loginBtnX:CGFloat=userFieldX
        let loginBtnY:CGFloat=CGRectGetMaxY(automaticLoginText.frame)+20
        let loginBtnW:CGFloat=userFieldW
        let loginBtnH:CGFloat=userFieldH
        loginBtn.frame=CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH)
        loginBtn.layer.cornerRadius=loginBtnH/2
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.71, alpha: 1)
        loginBtn.addTarget(self, action: "clickLoginBtn", forControlEvents: UIControlEvents.TouchUpInside)
        viewWarp.addSubview(loginBtn)
        //快速注册
        let FastRegistrationLabel=UILabel()
        let FastRegistrationLabelX:CGFloat=50
        let FastRegistrationLabelY:CGFloat=CGRectGetMaxY(loginBtn.frame)+15
        let FastRegistrationLabelW:CGFloat=80
        let FastRegistrationLabelH:CGFloat=20
        FastRegistrationLabel.frame=CGRectMake(FastRegistrationLabelX, FastRegistrationLabelY, FastRegistrationLabelW, FastRegistrationLabelH)
        FastRegistrationLabel.text="快速注册"
        FastRegistrationLabel.font=UIFont.systemFontOfSize(16)
        FastRegistrationLabel.textColor=UIColor.whiteColor()
        FastRegistrationLabel.userInteractionEnabled=true
//        //点击事件
//        let tap=UITapGestureRecognizer(target: self, action: "clickFastRegistrationLabel:");
//        FastRegistrationLabel.addGestureRecognizer(tap);
        FastRegistrationLabel.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"sss:"));
        viewWarp.addSubview(FastRegistrationLabel)
        //找回密码
        let RetrievePasswordLabel:UILabel=UILabel()
        RetrievePasswordLabel.frame=CGRectMake(screen.width/2+30, FastRegistrationLabelY, 80, 20)
        RetrievePasswordLabel.text="找回密码"
        RetrievePasswordLabel.font=UIFont.systemFontOfSize(16)
        RetrievePasswordLabel.userInteractionEnabled=true
        RetrievePasswordLabel.textColor=UIColor.whiteColor()
        //点击事件
//        let tap1=UITapGestureRecognizer(target: self, action: "clickRetrievePasswordLabel");
//        RetrievePasswordLabel.addGestureRecognizer(tap1);
        viewWarp.addSubview(RetrievePasswordLabel)
    }
    ///用户名输入变化事件
    func clickUser(sender:UITextField){
        //关闭键盘
        self.view.endEditing(true);
        sender.resignFirstResponder()
        let textcount=sender.text?.characters.count
        if textcount==0{
            loginBtn.enabled=false
            loginBtn.backgroundColor=UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1)
            let Alert:UIAlertView=UIAlertView(title: "提醒", message: "用户名不能为空", delegate: nil, cancelButtonTitle: "确定")
            //显示提醒视图
            Alert.show()
        }else if textcount==11{
            loginBtn.enabled=true
            loginBtn.backgroundColor=UIColor(red: 0.33, green: 0.77, blue: 0.71, alpha: 1)
            let alertVC = UIAlertController(title: "温馨提示", message: "手机输入合法", preferredStyle:UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "确定", style: .Default , handler:{Void in
                print("点击确定执行的函数主体部分");
            });
            let alertAction2 = UIAlertAction(title: "取消", style: .Cancel, handler:{Void in
                print("点击取消执行的函数主体部分");
            })
            
            alertVC.addAction(alertAction);
            alertVC.addAction(alertAction2);
            self .presentViewController(alertVC, animated: true, completion: nil)
        }else{
            loginBtn.enabled=false
            loginBtn.backgroundColor=UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1)
            let alertVC = UIAlertController(title: "", message: "BMKMapView控件初始化完成", preferredStyle:UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "确定", style: .Default , handler:{Void in
                print("点击确定执行的函数主体部分");
            });
            let alertAction2 = UIAlertAction(title: "取消", style: .Cancel, handler:{Void in
                print("点击取消执行的函数主体部分");
            })
            
            alertVC.addAction(alertAction);
            alertVC.addAction(alertAction2);
            self .presentViewController(alertVC, animated: true, completion: nil)        }
        print("13")
    }
    //点击打勾按钮
    func check(sender:UIButton)->Bool{
        let isbool=sender.selected
        if(isbool==false){
            sender.selected=true
        }else{
            sender.selected=false
        }
        return isbool;
    }
    //点击登录按钮
    func clickLoginBtn(){
        
        ///请求地址
        let URL="http://192.168.1.145:8000/front/doLogin.xhtml";
        ///会员名
        let memberName=userField?.text
        ///密码
        let memberPwd=passwordField?.text
        ///开始请求
        request(.POST, URL, parameters:["memberName":"\(memberName!)","passWord":"\(memberPwd!)"])
            .responseJSON{Response in
                if Response.result.error != nil {
                    print("服务器异常")
                }
                if Response.result.value != nil {
                    ///解析JSON数据
                    var jsonResult=JSON(Response.result.value!)
                    print(jsonResult)
                    if jsonResult["success"]=="success" {
                        let alertVC = UIAlertController(title: "温馨提示", message: "登录成功", preferredStyle:UIAlertControllerStyle.Alert)
                        let alertAction = UIAlertAction(title: "确定", style: .Default , handler:{Void in
                            print("点击确定执行的函数主体部分");
                        });
                        let alertAction2 = UIAlertAction(title: "取消", style: .Cancel, handler:{Void in
                            print("点击取消执行的函数主体部分");
                        })
                        alertVC.addAction(alertAction);
                        alertVC.addAction(alertAction2);
                        self .presentViewController(alertVC, animated: true, completion: nil)
                        print("登录成功")
                        
                    }else {
                        print("账号或密码错误")
                    }
                    let name=jsonResult["nickName"]
                    print("name........\(name)")
        }
    }
   }
    //点击快速注册标签
    func sss(sender:UITapGestureRecognizer){
        let reg = Regist();
        self.navigationController?.pushViewController(reg, animated: true)
        print("注册");
    }
    ///显示提示框
    func showAlert(){
        let alertVC = UIAlertController(title: "温馨提示", message: "。。。。", preferredStyle:UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "确定", style: .Default , handler:{Void in
            print("点击确定执行的函数主体部分");
        });
        let alertAction2 = UIAlertAction(title: "取消", style: .Cancel, handler:{Void in
            print("点击取消执行的函数主体部分");
        })
        
        alertVC.addAction(alertAction);
        alertVC.addAction(alertAction2);
        self .presentViewController(alertVC, animated: true, completion: nil)
    }
    //点击找回密码标签
    func clickRetrievePasswordLabel(){
        let Jump=updatePasswordOne()
        self.navigationController?.pushViewController(Jump, animated: true)
    }

}