//
//  ViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ViewController.h"
#import "ActivityRequest.h"
#import "ActivityDetailRequest.h"
#import "ActivityModel.h"
#import "MovieRequest.h"
#import "MovieDetailRequest.h"
#import "MovieModel.h"
#import "TheaterRequest.h"
#import "TheaterModel.h"

@interface ViewController ()
//活动数组
@property(nonatomic,strong)NSMutableArray *activityArray;
//电影数组
@property(nonatomic,strong)NSMutableArray *movieArray;
//影院数组
@property(nonatomic,strong)NSMutableArray *theaterArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.activityArray  = [[NSMutableArray alloc]init];
    self.movieArray = [[NSMutableArray alloc]init];
    self.theaterArray = [[NSMutableArray alloc]init];


//    [self requetActivityData];
//    [self requestActivityDetailDataWith:@"26865955"];
//    [self requetMovieData];
    [self requestMovieDetailDataWith:@"10604893"];
//    [self requetTheaterData];


}
//活动接口解析
-(void)requetActivityData{
    
    ActivityRequest *activity = [[ActivityRequest alloc]init];
    __weak typeof(self) weakSelf = self;
    [activity activityRequestWithParameter:nil success:^(NSDictionary *dic) {
        
        NSArray *events = [dic objectForKey:@"events"];
        
        
        
        for (NSDictionary *tempDic in events) {
            
            ActivityModel *model = [[ActivityModel alloc]init];
            
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.activityArray addObject:model];
            
      
        }
        
        NSLog(@"activity ==%@",weakSelf.activityArray);
        
        
    } failure:^(NSError *error) {
        NSLog(@"activity error == %@",error);
        
    }];

    
}
//活动详情解析

-(void)requestActivityDetailDataWith:(NSString *)ID{
    
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc]init];
    
    [request ActivityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        
        NSLog(@"ActivityDetail = %@",dic);
    } failure:^(NSError *error) {
        
        NSLog(@"ActivityDetail error = %@",error);
    }];
    
    
    
}

//电影接口解析
-(void)requetMovieData{
    
    MovieRequest *movie = [[MovieRequest alloc]init];
    
    __weak typeof(self) weakSelf = self;
    
    [movie movieRequestWithParameter:nil success:^(NSDictionary *dic) {
        
//        NSString *movieTitle = [dic objectForKey:@"title"];
        
        NSArray *entries = [dic objectForKey:@"entries"];
        
        for (NSDictionary *tempDic in entries) {
            
            MovieModel *model = [[MovieModel alloc]init];
            
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.movieArray addObject:model];
        }
        
        
        NSLog(@"movie ==%@",weakSelf.movieArray);
    } failure:^(NSError *error) {
        NSLog(@"movie error == %@",error);
        
    }];
    
    
}

//电影详情解析
-(void)requestMovieDetailDataWith:(NSString *)ID{
    
    MovieDetailRequest *request = [[MovieDetailRequest alloc]init];
    
    [request MovieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        
        NSLog(@"ActivityDetail = %@",dic);
    } failure:^(NSError *error) {
        
        NSLog(@"ActivityDetail error = %@",error);
    }];
    
    
    
}



//影院接口解析
-(void)requetTheaterData{
    
    TheaterRequest *theater = [[TheaterRequest alloc]init];
    [theater TheaterRequestWithParameter:nil success:^(NSDictionary *dic) {
        
        NSLog(@"theater ==%@",dic);
    } failure:^(NSError *error) {
        NSLog(@"theater error == %@",error);
        
    }];

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
