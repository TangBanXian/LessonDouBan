//
//  DouBanTabBar.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "DouBanTabBar.h"

@interface DouBanTabBar ()

@property(nonatomic,strong)UIButton *button;

@end

@implementation DouBanTabBar


- (id)initWithItems:(NSArray *)items frame:(CGRect)frame{
    
    
    //设置tabbar背景图片
    [self setBackgroundColor:[UIColor colorWithRed:0.46 green:0.60 blue:0.69 alpha:1.00]];
    
    self = [super init];
    if (self) {
        
        self.frame = frame;
        
        for (int i = 0; i < items.count; i++) {
            
            UIButton *btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width / items.count;
            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake( i * width, 0, width, height);
            
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:(UIControlEventTouchUpInside )];
            [self addSubview:btn];
            
        }
        //进入界面是显示第一个界面
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.allItems = items;
        

    }
    
    return self;
}

- (void)btnClicked:(UIButton *)btn{
    
    self.currentSelectedItem = btn;
    for (int i = 0; i < self.allItems.count; i++) {
        
        UIButton *tempBtn = (UIButton *)self.allItems[i];
        if (btn == tempBtn) {
            self.currentSelected = i;
            //选中状态
            tempBtn.selected = YES;
            
        }else{
            
            tempBtn.selected = NO;
            
        }
        
    }
    
    if (_douBanDelegate) {
        
        [_douBanDelegate douBanItemDidClicked:self];
    }
}



@end
