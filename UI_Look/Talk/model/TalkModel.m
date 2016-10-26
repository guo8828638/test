//
//  TalkModel.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "TalkModel.h"

@implementation TalkModel
- (void)dealloc
{
    [_title release];
    [_summary release];
    [_cover_thumb release];
    [_pubdate release];
    [_archive_timestamp release];
    [_link_share release];
    [_cat release];
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}


@end
