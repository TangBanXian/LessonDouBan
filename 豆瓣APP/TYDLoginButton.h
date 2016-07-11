//
//  TYDLoginButton.h
//  APP 登录界面
//
//  Created by 唐半仙丶 on 16/6/24.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

//block
typedef void(^tapHandler)(UIButton *sender);

@interface TYDLoginButton : UIButton

@property(nonatomic,strong)tapHandler handler;





+(id)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame image:(UIImage *)image clickedImage:(UIImage *)clickImage title:(NSString *)title clickTitle:(NSString *)clickTitle  handler:(tapHandler)handler;








@end
