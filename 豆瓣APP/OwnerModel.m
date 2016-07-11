//
//  OwnerModel.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel

-(NSString *)description{
    
    
    
    return [NSString stringWithFormat:@"ID - %@",self.ID];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString: @"id"]) {
        _ID = value;
    }
    
}

@end
