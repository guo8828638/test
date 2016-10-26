//
//  FriendshipViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface FriendshipViewController : BaseViewController
@property (nonatomic,copy)NSString *lastId;
@property (nonatomic,assign)NSInteger pageNum;
@property (nonatomic,retain)NSMutableArray *bigArray;
@property (nonatomic,assign)BOOL upLoading;

@end
