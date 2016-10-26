//
//  FriendshipDetailBigModel.h
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendshipDetailModel.h"

@interface FriendshipDetailBigModel : NSObject
@property (nonatomic,copy)NSString *authorname;
@property (nonatomic,copy)NSString *publishtime;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *headimg;
@property (nonatomic,retain)NSMutableArray *attachments;



@end
