//
//  InfoDetailViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoTableViewModel.h"
#import "BaseViewController.h"

@interface InfoDetailViewController : BaseViewController
@property (nonatomic,retain)InfoTableViewModel *model;
@property (nonatomic,copy)NSString *str;

@end
