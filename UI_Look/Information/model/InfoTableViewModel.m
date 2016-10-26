//
//  InfoTableViewModel.m
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "InfoTableViewModel.h"

@implementation InfoTableViewModel
- (void)dealloc
{
    [_brand_name release];
    [_title release];
    [_contentid release];
    [_url release];
    [_img release];
    [_updatetime release];
    [super dealloc];
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}

@end
