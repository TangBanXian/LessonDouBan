//
//  TheaterTableViewCell.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/7/1.
//  Copyright © 2016年 Tang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TheaterModel.h"
#define TheaterTableViewCell_Idetity @"TheaterTableViewCell_Idetity"

@interface TheaterTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@property (nonatomic, strong)TheaterModel *model;

@end
