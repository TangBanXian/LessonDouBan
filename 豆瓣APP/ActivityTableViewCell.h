//
//  ActivityTableViewCell.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

#define ActivityTableViewCell_Identifier @"ActivityTableViewCell_Identifier"

@interface ActivityTableViewCell : UITableViewCell

//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//时间
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//地址
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
//类型
@property (weak, nonatomic) IBOutlet UILabel *activityTypeLabel;
// 感兴趣
@property (weak, nonatomic) IBOutlet UILabel *interestedNumberLabel;
// 参加人数
@property (weak, nonatomic) IBOutlet UILabel *joinedNumberLabel;
// 图片
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property(nonatomic,strong)ActivityModel *model;
@end
