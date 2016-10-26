//
//  VideoModel.m
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
- (void)dealloc
{
    [_pubdate release];
    [_title release];
    [_cover_thumb release];
    [_link_share release];
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}

@end
