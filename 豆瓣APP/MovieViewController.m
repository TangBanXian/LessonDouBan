//
//  MovieViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "MovieRequest.h"
#import "MovieModel.h"
#import "MovieDetailViewController.h"
@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation MovieViewController



-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.movieTabView.dataSource = self;
    self.movieTabView.delegate = self;
    
    
    [self.movieTabView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MovieTableViewCell_Identifier];
    
   
    
    self.movieArray = [NSMutableArray array];
    MovieRequest *request = [[MovieRequest alloc]init];
    __weak typeof (self) weakSelf = self;
    [request movieRequestWithParameter:nil success:^(NSDictionary *dic) {
        
        NSLog(@"success -> %@",dic);
        
        NSArray *array = dic[@"entries"];
        
        for (NSDictionary *tempDic in array) {
            
            MovieModel *model = [[MovieModel alloc]init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.movieArray addObject:model];
            
            NSLog(@"解析成功");
            dispatch_async(dispatch_get_main_queue(), ^{

           [weakSelf.movieTabView reloadData];
                
    });
        }
        
        
    } failure:^(NSError *error) {
        NSLog(@"解析失败");
        
    }];


    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.movieArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell_Identifier];
    
    MovieModel *model = self.movieArray[indexPath.row];
    
    cell.model = model;
    
    
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
;
    MovieModel *model = self.movieArray[indexPath.row];
    [self performSegueWithIdentifier:@"movieDetail" sender:model];

    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"movieDetail"]) {
        
        
        MovieDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.model = sender;
        
        
    }
    
    
}


@end
