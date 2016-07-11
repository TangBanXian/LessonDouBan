//
//  LoginRequest.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequest : NSObject

-(void)loginRequestWithUserName:(NSString *)userName
                       passWord:(NSString *)passWord
                        success:(SuccessResponse)success
                        failure:(FailureResponse)failure;

@end
