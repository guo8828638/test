//
//  VideoViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "VideoDetailViewController.h"

@interface VideoViewController : BaseViewController
@property (nonatomic,retain)NSMutableArray *bigArray;
@property (nonatomic,retain)NSMutableArray *keysArray;
@property (nonatomic,assign)NSInteger i;
@property (nonatomic,retain)VideoDetailViewController *detailVC;

@end
