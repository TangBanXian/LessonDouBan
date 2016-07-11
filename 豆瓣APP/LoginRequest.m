//
//  LoginRequest.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest


-(void)loginRequestWithUserName:(NSString *)userName
                       passWord:(NSString *)passWord
                        success:(SuccessResponse)success
                        failure:(FailureResponse)failure{
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request sendDataWithUrl:LoginRequest_Url parameters:@{@"userName":userName,@"password":passWord} SuccessResponse:^(NSDictionary *dic) {
        
        
        success(dic);
    } FailureResponse:^(NSError *error) {
        
        failure(error);
    }];
    
    
    
    
    
    
}


@end
