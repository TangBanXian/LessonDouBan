//
//  RegisterRequest.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject


- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avator:(UIImage *)image
                 success:(SuccessResponse)success
                 failure:(FailureResponse)faiure;
@end
