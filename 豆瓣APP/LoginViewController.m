//
//  LoginViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "RegisterViewController.h"
#import "TYDLoginButton.h"

#define KWidth  self.view.frame.size.width





@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;

@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@property (strong, nonatomic) IBOutlet UIButton *loginButton;


//快速登录视图
@property(nonatomic,strong)UIView *loginView;

@property(nonatomic,strong)UIImageView *backImageView;

@end



@implementation LoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    

    

    [self quickLoginView];
}


#pragma mark -- 登录按钮
- (IBAction)LoginClicked:(UIButton *)sender {
    //登录
    [self login];
    
}
#pragma mark -- 注册按钮
- (IBAction)registerClicked:(id)sender {
    
    //注册
    [self registerC];
}
-(void)registerC{
    
    //跳转到登录界面
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    RegisterViewController *loginVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    //模态样式
    loginVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:loginVC animated:YES completion:^{
        
        
    }];

    
    
}


-(void)login{
    
    
    //验证判断用户名密码
    
    if ([self.userNameField.text length] == 0) {
        NSLog(@"用户名为空");
        
    }else if ([self.passWordField.text length] == 0){
        
        NSLog(@"密码为空");
        
    }else{
        
        LoginRequest *request = [[LoginRequest alloc]init];
        
        [request loginRequestWithUserName:self.userNameField.text passWord:self.passWordField.text success:^(NSDictionary *dic) {
            
            
            NSLog(@"登录成功 %@",dic);

            NSString *code = [[dic objectForKey:@"code"]stringValue];
            
            if ([code isEqualToString:@"1103"]) {
                
                
                NSString *avatar = [[dic objectForKey:@"data"]objectForKey:@"avatar"];
                NSString *userID = [[dic objectForKey:@"data"]objectForKey:@"userID"];
                
                //保存头像的 id 到本地
                [[NSUserDefaults standardUserDefaults]setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults]setObject:userID forKey:@"userID"];
                //立即保存
                [[NSUserDefaults standardUserDefaults]synchronize];

                
                //登录成功后跳转
                [self dismissViewControllerAnimated:YES completion:^{
                    
                    
                    
                }];
                
                
            }else if([code isEqualToString:@"1102"]){
                
                
                
            [self alertWithTitle:@"消息" message:@"登录用户不存在!" alertAction:(UIAlertActionStyleDefault)];
                
            };
            
            
            
        } failure:^(NSError *error) {
            
     
           [self alertWithTitle:@"消息" message:@"登录失败!" alertAction:(UIAlertActionStyleDefault)];
        }];

    }
    
    
    
    
}

//第三方分享
- (IBAction)thirdPartyToShare:(id)sender {
    
    
    
    
    
    
    
}

#pragma mark --- 弹窗封装


-(UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message alertAction:(UIAlertActionStyle)alertAction{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertControllerStyleAlert 在屏幕中间
    //UIAlertControllerStyleActionSheet 在屏幕底部
    
    UIAlertAction *Destructive = [UIAlertAction actionWithTitle:@"确定" style:alertAction handler:^(UIAlertAction * _Nonnull action) {
        /*
         UIAlertActionStyleDefault,
         UIAlertActionStyleCancel,
         UIAlertActionStyleDestructive
         */
        
    }];
    
    // 显示
    [self presentViewController:alert animated:YES completion:nil];
    
    [alert addAction:Destructive];
    
    return alert;
    
}
    

//快速登录视图
-(void)quickLoginView{
    
    
    self.loginButton.layer.cornerRadius = 8.0;
    
    
    //快速登录视图
    self.loginView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - 180, KWidth, 180)];
    
    self.loginView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.loginView];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.loginView.frame.size.width / 2 - 40, 0, 80, 20)];
    
    label.text = @"快速登录";
    //文字居中
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:14];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    [self.loginView addSubview:label];
    
    
    //添加 Label 两边的 ImageVeiw right
    
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(60, 10, 103, 1)];
    
    leftImage.image = [UIImage imageNamed:@"login_register_left_line"];
    
    [self.loginView  addSubview:leftImage];
    
    UIImageView *rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+5, leftImage.frame.origin.y, 103, 1)];
    
    rightImage.image = [UIImage imageNamed:@"login_register_right_line"];
    
    [self.loginView  addSubview:rightImage];
    
    
    
    
    
    
    TYDLoginButton *sinaButton = [TYDLoginButton buttonWithType:(UIButtonTypeCustom) frame:CGRectMake(label.frame.origin.x , CGRectGetMaxY(label.frame)+20, 70, 100) image:[UIImage imageNamed:@"login_sina_icon"] clickedImage:[UIImage imageNamed:@"login_sina_icon_click"] title:@"新浪微博" clickTitle:@"新浪微博" handler:^(UIButton *sender) {
        
        NSLog(@"新浪微博 点击方法");
    }];
    
    [self.loginView addSubview:sinaButton];
    
    
    TYDLoginButton *qqButton = [TYDLoginButton buttonWithType:(UIButtonTypeCustom) frame:CGRectMake(CGRectGetMinX(sinaButton.frame)-sinaButton.frame.size.width*2, sinaButton.frame.origin.y, sinaButton.frame.size.width, sinaButton.frame.size.height) image:[UIImage imageNamed:@"login_QQ_icon"] clickedImage:[UIImage imageNamed:@"login_QQ_icon_click"] title:@"QQ登录" clickTitle:@"QQ登录" handler:^(UIButton *sender) {
        
        NSLog(@"QQ登录 点击方法");
    }];
    
    [self.loginView addSubview:qqButton];
    
    
    
    
    TYDLoginButton *tecentButton = [TYDLoginButton buttonWithType:(UIButtonTypeCustom) frame:CGRectMake(CGRectGetMinX(sinaButton.frame) + 140,sinaButton.frame.origin.y , sinaButton.frame.size.width, sinaButton.frame.size.height) image:[UIImage imageNamed:@"login_tecent_icon"] clickedImage:[UIImage imageNamed:@"login_tecent_icon_click"] title:@"腾讯微博" clickTitle:@"腾讯微博" handler:^(UIButton *sender) {
        
        
        NSLog(@"腾讯微博 点击方法");
    }];
    
    [self.loginView addSubview:tecentButton];
}


- (IBAction)popButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    
}


@end
