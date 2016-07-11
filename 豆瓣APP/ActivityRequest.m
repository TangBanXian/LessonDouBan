//
//  ActivityRequest.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ActivityRequest.h"

@implementation ActivityRequest


-(void)activityRequestWithParameter:(NSDictionary *)paramenterDic success:(SuccessResponse)success failure:(FailureResponse)failure{
    
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request requestWithUrl:ActivityRequest_Url parameters:paramenterDic SuccessResponse:^(NSDictionary *dic) {
        
        success(dic);
        
    } FailureResponse:^(NSError *error) {
        
        failure(error);
    }];
    
}


@end
