//
//  MyHeaderTableViewCell.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "MyHeaderTableViewCell.h"

#import "RegisterViewController.h"

@interface MyHeaderTableViewCell ()



@end

@implementation MyHeaderTableViewCell

- (void)awakeFromNib {


    //设置圆角
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.size.width/2.0;


  

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
