//
//  RegisterViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"
@interface RegisterViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;

//系统照片选择器
@property(nonatomic,strong)UIImagePickerController *imagePC;
//
@property (strong, nonatomic) IBOutlet UIImageView *registerImageView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self initLayout];
}


-(void)initLayout{
    
    self.imagePC = [[UIImagePickerController alloc]init];
    
    self.imagePC.delegate = self;
    
    self.registerButton.layer.cornerRadius = 8.0;

    //设置圆角
    self.registerImageView.layer.masksToBounds = YES;
    self.registerImageView.layer.cornerRadius = self.registerImageView.bounds.size.width/2.0;
    

    self.registerImageView.userInteractionEnabled = YES;
    //imageVIew的点击方法
    [self.registerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openClick:)]];


    
}
//imageVIew的点击方法
#pragma mark --- 打开相册
-(void)openClick:(UITapGestureRecognizer *)sender{
    
 
    //创建图片控制器
    UIImagePickerController * pc = [[UIImagePickerController alloc]init] ;
    pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    
    //是否允许被编辑
    pc.allowsEditing = YES;
    
    //代理，这时候遵循一下代理
    pc.delegate = self;//因为delegete遵守了两个协议，这里只需要一个协议，只遵守了一个
    
    
    //animated是否要动画
    [self presentViewController:pc animated:YES completion:^{
        
    }];

    
    
}
#pragma mark -- 图片选择器
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *selectImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    
    
    self.registerImageView.image = selectImage;
    
    
    //退出
    [self dismissViewControllerAnimated:YES completion:^{
        
    } ];
    
}





- (IBAction)registerBtn:(id)sender {
    
   
    RegisterRequest *request = [[RegisterRequest alloc] init];
    [request registerWithName:self.userNameTextField.text password:self.passWordTextField.text avator:self.registerImageView.image success:^(NSDictionary *dic) {
        
        NSLog(@"注册成功 = %@",dic);
        
        NSString *code = [[dic objectForKey:@"code"]stringValue];
        
        if ([code isEqualToString:@"1005"]) {
            
            NSString *avatar = [[dic objectForKey:@"data"]objectForKey:@"avatar"];
            NSString *userID = [[dic objectForKey:@"data"]objectForKey:@"userID"];
            
            
            //保存头像的 id 到本地
            [[NSUserDefaults standardUserDefaults]setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults]setObject:userID forKey:@"userID"];
            //立即保存
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            //注册成功后界面消失
            [self dismissViewControllerAnimated:YES completion:^{
                
                
            }];
            
        }
        
        
    } failure:^(NSError *error) {
        
        
        NSLog(@"注册失败 = %@",error);
        
     
        
    }];
    
    //界面消失
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
}





- (IBAction)popButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
