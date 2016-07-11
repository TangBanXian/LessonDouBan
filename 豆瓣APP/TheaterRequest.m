//
//  TheaterRequest.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "TheaterRequest.h"

@implementation TheaterRequest



- (void)TheaterRequestWithParameter:(NSDictionary *)parameterDic
                      success:(SuccessResponse)success
                      failure:(FailureResponse)failure{
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request requestWithUrl:TheaterRequest_Url parameters:parameterDic SuccessResponse:^(NSDictionary *dic) {
        
        success(dic);
        
    } FailureResponse:^(NSError *error) {
        
        failure(error);
    }];
    
    
    
    
    
}



@end
