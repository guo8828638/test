//
//  FriendshipDetailTwoModel.m
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipDetailTwoModel.h"

@implementation FriendshipDetailTwoModel
- (void)dealloc
{
    [_newstypeanme release];
    [_newsauthor release];
    [_title release];
    [_summary release];
    [_headimg release];
    [_createtime release];
    [_img release];
    [super dealloc];
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}


@end
