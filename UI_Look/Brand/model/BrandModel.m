//
//  BrandModel.m
//  UI_Look
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BrandModel.h"

@implementation BrandModel
- (void)dealloc
{
    [_cover_landscape release];
    [_title release];
    [_summary release];
    [_author release];
    [_link_share release];
    [super dealloc];
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}

@end
