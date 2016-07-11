//
//  ActivityModel.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/27.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel


-(NSString *)description{
    
    
    return [NSString stringWithFormat:@"ID -- %@, Owner -- %@",self.ID,self.user];
}


//找不到 Key 对象的 Value 时调用这个方法
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
        
    }else if ([key isEqualToString:@"owner"]){
        OwnerModel *model = [[OwnerModel alloc]init];
        [model setValuesForKeysWithDictionary:value];
        
         _user = model;
        
        
    }
    
}

@end
