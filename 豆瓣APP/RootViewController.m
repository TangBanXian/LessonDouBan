//
//  RootViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"
@interface RootViewController ()<DouBanTabBarDelegate>

@property(nonatomic,strong)DouBanTabBar *dbTabBar;

@end


@implementation RootViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.tabBar.hidden = YES;

    

    UIButton *btn1 = [self buttonWithType:(UIButtonTypeCustom) image:[UIImage imageNamed:@"paper.png"] selectedImage:[UIImage imageNamed:@"paperH.png"] title:@"活动"];
    UIButton *btn2 = [self buttonWithType:(UIButtonTypeCustom) image:[UIImage imageNamed:@"video.png"] selectedImage:[UIImage imageNamed:@"videoH.png"] title:@"电影"];
    UIButton *btn3 = [self buttonWithType:(UIButtonTypeCustom) image:[UIImage imageNamed:@"2image.png"] selectedImage:[UIImage imageNamed:@"2imageH.png"] title:@"影院"];
    UIButton *btn4 = [self buttonWithType:(UIButtonTypeCustom) image:[UIImage imageNamed:@"person.png"] selectedImage:[UIImage imageNamed:@"personH.png"] title:@"我的"];

    
    
    self.dbTabBar = [[DouBanTabBar alloc]initWithItems:@[btn1,btn2,btn3,btn4] frame:CGRectMake(0, WindowHeight-49, WindownWidth, 49)];
    
    self.dbTabBar.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.dbTabBar];
    
    
    self.dbTabBar.douBanDelegate = self;

}

-(UIButton *)buttonWithType:(UIButtonType)buttonType image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    // 未选中的图片
    [button setImage:image forState:(UIControlStateNormal)];
    // 选中后的图片
    [button setImage:selectedImage forState:(UIControlStateSelected)];
    // 标题
    [button setTitle:title forState:(UIControlStateNormal)];
    // 字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    // 按钮按下后的模糊状态
    [button setAdjustsImageWhenHighlighted:NO];
    // 未选中时字体颜色
    [button setTitleColor:[UIColor colorWithRed:0.33 green:0.21 blue:0.15 alpha:1.00] forState:UIControlStateNormal];
    // 选中时字体颜色
    [button setTitleColor:[UIColor colorWithRed:1.00 green:0.44 blue:0.81 alpha:1.00] forState:(UIControlStateSelected)];

    button.showsTouchWhenHighlighted = YES;
 
    [button setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [button setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    
    
    /**
     *  Button 自带 Image 属性的偏移量
     *
     *  @param top    距离上边缘的尺寸
     *  @param left   距离左边缘的尺寸
     *  @param bottom 距离下边缘的尺寸
     *  @param right  距离右边缘的尺寸
     *
     *  @return 图片的偏移距离
     */
    
    return button;
    
    
    
}

- (void)douBanItemDidClicked:(DouBanTabBar *)tabBar{
    
    
    self.selectedIndex = tabBar.currentSelected;
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
    
}

@end
