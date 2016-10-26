//
//  VideoDetailViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoDetailViewController : BaseViewController
@property (nonatomic,retain)VideoModel *model;

@end
