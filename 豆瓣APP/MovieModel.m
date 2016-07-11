//
//  MovieModel.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel
-(NSString *)description{
    
    return [NSString stringWithFormat:@"ID -> %@,imageDic ->%@",self.ID,self.images];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        
        _ID  = value;
    }
    
}



@end
