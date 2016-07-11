//
//  ActivityViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityRequest.h"
#import "ActivityModel.h"
#import "ActivityDetailViewController.h"

@implementation ActivityViewController


-(void)viewDidLoad{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    [self.activityTabView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identifier];
    
    self.activityArray = [NSMutableArray array];
    
    ActivityRequest *request = [[ActivityRequest alloc]init];
    
    __weak typeof (self) weakSelf = self;
    
    [request activityRequestWithParameter:nil success:^(NSDictionary *dic) {
        
        NSArray *array =dic[@"events"];
        
        for (NSDictionary *tempDic in array) {
            
            ActivityModel *model = [ActivityModel new];
            
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.activityArray addObject:model];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.activityTabView reloadData];
                
            });
            
        }
        
    
    } failure:^(NSError *error) {
        
        NSLog(@"error = %@",error);
    }];
}

//必须实现的两个方法 面试考默写
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.activityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identifier];
    
    
    
    ActivityModel *model = self.activityArray[indexPath.row];
    
    cell.model = model;

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return 200;
    
   
    
}


#pragma mark --- 点击cell跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    ActivityModel *model = self.activityArray[indexPath.row];

    [self performSegueWithIdentifier:@"activityDetail" sender:model];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        
        
        ActivityDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.model = sender;
        
        
    }
    
    
}


@end

