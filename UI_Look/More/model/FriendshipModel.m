//
//  FriendshipModel.m
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipModel.h"

@implementation FriendshipModel
- (void)dealloc
{
    [_title release];
    [_img release];
    [_Typeid release];
    [_Typename release];
    [_lastid release];
    [_createtime release];
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"typeid"]) {
        
        self.Typeid = value;
    }
    if ([key isEqualToString:@"typename"]) {
        
        self.Typename = value;
    }
    if ([key isEqualToString:@"id"]) {
        
        self.ID = value;
    }
    
    
    
}



@end
