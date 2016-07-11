//
//  MovieRequest.h
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MovieRequest : NSObject


- (void)movieRequestWithParameter:(NSDictionary *)parameterDic
                    success:(SuccessResponse)success
                    failure:(FailureResponse)failure;




@end
