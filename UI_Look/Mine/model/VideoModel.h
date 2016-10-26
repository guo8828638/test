//
//  VideoModel.h
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject
@property (nonatomic,assign)NSInteger guid;
@property (nonatomic,copy)NSString *cover_thumb;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *pubdate;
@property (nonatomic,copy)NSString *cover;
@property (nonatomic,copy)NSString *link_share;
@property (nonatomic,copy)NSString *link_video;

@end
