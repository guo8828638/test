//
//  InfoModel.m
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel
- (void)dealloc
{
    [_numID release];
    [_title release];
    [_descriptions release];
    [_ad release];
    [_url release];
    [_img release];
    [super dealloc];
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}

@end
