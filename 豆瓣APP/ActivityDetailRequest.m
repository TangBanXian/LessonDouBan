//
//  ActivityDetailRequest.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest


- (void)ActivityDetailRequestWithParameter:(NSDictionary *)parameter
                                  success:(SuccessResponse)success
                                  failure:(FailureResponse)failure{
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    NSString *ID = [parameter objectForKey:@"id"];
    [request requestWithUrl:ActivityDetailRequest_Url(ID) parameters:nil SuccessResponse:^(NSDictionary *dic) {
        
        success(dic);
        
    } FailureResponse:^(NSError *error) {
        
        failure(error);
    }];
}


@end
