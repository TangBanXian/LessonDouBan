//
//  TheaterMapViewController.h
//  LessonDouBan
//
//  Created by 唐半仙丶 on 16/7/1.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseViewController.h"
#import "TheaterModel.h"
@interface TheaterMapViewController : BaseViewController
//
@property (nonatomic, strong) TheaterModel *model;

@property(nonatomic,strong)NSString*cityString;
@property(nonatomic,strong)NSString*addressString;

@end
