//
//  SevenModel.m
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SevenModel.h"

@implementation SevenModel
- (void)dealloc
{
    [_contentid release];
    [_title release];
    [_comment_count release];
    [_img release];
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}


@end
