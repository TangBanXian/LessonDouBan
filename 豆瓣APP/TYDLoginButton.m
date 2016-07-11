//
//  TYDLoginButton.m
//  APP 登录界面
//
//  Created by 唐半仙丶 on 16/6/24.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "TYDLoginButton.h"

#define Ktitle 0.3

@implementation TYDLoginButton

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.imageView.frame = CGRectMake(0, 0, 70, 70);
    
    
    
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height *(1-Ktitle);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height *Ktitle;
    CGFloat titleY = contentRect.size.height - titleHeight;
    CGFloat titleWidth = contentRect.size.width;
    
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
    
    
}

+(id)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame image:(UIImage *)image clickedImage:(UIImage *)clickImage title:(NSString *)title clickTitle:(NSString *)clickTitle  handler:(tapHandler)handler{
    
    
    
    // 创建自定义按钮
    TYDLoginButton *button = [super buttonWithType:buttonType];
    
    // 按钮坐标和尺寸
    button.frame =  frame;
    // 设置按钮字体
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    // 文字居中
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    //图片的内容模式
    button.imageView.contentMode = UIViewContentModeCenter;
    // 创建普通状态按钮图片
    [button setImage:image forState:UIControlStateNormal];
    // 设置按钮点击状态标题
    [button setImage:clickImage forState:UIControlStateHighlighted];
    
    // 设置按钮普通状态标题
    [button setTitle:title forState:UIControlStateNormal];
    // 设置按钮点击后状态标题
    [button setTitle:clickTitle forState:(UIControlStateHighlighted)];

    // 设置按钮普通状态标题颜色
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.41 green:0.48 blue:0.59 alpha:1.00] forState:(UIControlStateHighlighted)];

    // 设置按钮背颜色
    [button setBackgroundColor:[UIColor clearColor]];
    //点击方法 Block 块
    button.handler = handler;
    
    // 按钮按下后的模糊状态
    [button setAdjustsImageWhenHighlighted:NO];
    // 按钮点击事件
    [button addTarget:button action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
   
    
    return button;
    
    
    
}
#pragma mark -- btnAction点击方法
-(void)btnAction:(UIButton *)sender{
    
    if (self.handler) {
        self.handler(sender);
    }

}


@end
