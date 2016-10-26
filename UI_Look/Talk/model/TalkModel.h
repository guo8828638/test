//
//  TalkModel.h
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkModel.h"

@interface TalkModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *pubdate;
@property (nonatomic,copy)NSString *summary;
@property (nonatomic,copy)NSString *cover_thumb;
@property (nonatomic,assign)NSInteger guid;
@property (nonatomic,copy)NSString *archive_timestamp;
@property (nonatomic,copy)NSString *link_share;
@property (nonatomic,copy)NSString *cat;
@end
