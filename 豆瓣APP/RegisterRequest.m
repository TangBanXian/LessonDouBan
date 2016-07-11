//
//  RegisterRequest.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest


- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avator:(UIImage *)image
                 success:(SuccessResponse)success
                 failure:(FailureResponse)faiure{
    
    
    NSDictionary *parameter = @{@"userName":name,@"password":password};
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request sendImageWithUrl:RegisterRequest_Url parameters:parameter image:image SuccessResponse:^(NSDictionary *dic) {
        
        success(dic);
    
        
         } FailureResponse:^(NSError *error) {
        
        faiure(error);
    }];
    
}

@end
