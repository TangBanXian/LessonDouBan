//
//  MovieDetailRequest.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/28.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailRequest : NSObject


- (void)MovieDetailRequestWithParameter:(NSDictionary *)parameter
                                success:(SuccessResponse)success
                                failure:(FailureResponse)failure;

@end
