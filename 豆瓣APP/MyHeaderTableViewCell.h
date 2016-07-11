//
//  MyHeaderTableViewCell.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

//MyHeaderTableViewCell的重用标识符
#define MyHeaderTableViewCell_Identify @"MyHeaderTableViewCell"

@interface MyHeaderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;


@property (strong, nonatomic) IBOutlet UILabel *userName;


@end
