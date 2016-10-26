//
//  FriendshipDetailBigModel.m
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipDetailBigModel.h"


@implementation FriendshipDetailBigModel
- (void)dealloc
{
    [_authorname release];
    [_publishtime release];
    [_content release];
    [_headimg release];
    [_attachments release];
    [super dealloc];
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}


-(void)setAttachments:(NSMutableArray *)attachments
{

    if (_attachments != attachments) {
        
        [_attachments release];
        
        _attachments = [attachments retain];
    }
    

    NSMutableArray *array = [NSMutableArray array];
    for (NSMutableDictionary *dic in attachments) {
        
        FriendshipDetailModel *smallModel = [[FriendshipDetailModel alloc]init];
        
        [smallModel setValuesForKeysWithDictionary:dic];
        
        [array addObject:smallModel];
   
    }
    _attachments = [[NSMutableArray alloc] initWithArray:array];
    
    

}



@end
