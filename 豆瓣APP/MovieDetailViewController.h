//
//  MovieDetailViewController.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/7/2.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "BaseViewController.h"
#import "MovieDetailModel.h"
#import "MovieModel.h"
@interface MovieDetailViewController : BaseViewController


@property(nonatomic,strong)MovieDetailModel *detailModel;
//
@property (nonatomic, strong) MovieModel *model;
//
@property (nonatomic, strong) NSMutableArray *movieDetailArray;

//图片
@property (strong, nonatomic) IBOutlet UIImageView *largeImageView;
//评分
@property (strong, nonatomic) IBOutlet UILabel *rating;
//发布时间
@property (strong, nonatomic) IBOutlet UILabel *pubdate;
//动画时长
@property (strong, nonatomic) IBOutlet UILabel *durationsLabel;
//类型
@property (strong, nonatomic) IBOutlet UILabel *genresLabel;
//国家
@property (strong, nonatomic) IBOutlet UILabel *countries;
//简介
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;


@end
