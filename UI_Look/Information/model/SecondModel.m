//
//  SecondModel.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel
- (void)dealloc
{
    [_ename release];
    [_name release];
    [_img release];
    [_brandid release];
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}


@end
