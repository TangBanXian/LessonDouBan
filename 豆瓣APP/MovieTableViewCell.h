//
//  MovieTableViewCell.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/30.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

#define MovieTableViewCell_Identifier @"MovieTableViewCell_Identifier"

@interface MovieTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *movieImageView;
//电影名称
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//星级
@property (strong, nonatomic) IBOutlet UILabel *starsLabel;
//上映日期
@property (strong, nonatomic) IBOutlet UILabel *pubdateLabel;
//
@property (nonatomic, strong) MovieModel *model;

@end
