//
//  WMPageConst.h
//  WMPageController
//
//  Created by yutao on 15/6/13.
//  Copyright (c) 2015年 yq. All rights reserved.
//



//  标题的颜色(选中/非选中) (P.S.标题颜色是可动画的)
#define WMTitleColorSelected [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1]
#define WMTitleColorNormal   [UIColor colorWithRed:0 green:0 blue:0 alpha:1]
//  导航菜单栏的背景颜色
#define WMMenuBGColor        [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.8]


//  标题的尺寸(选中/非选中)
static CGFloat const WMTitleSizeSelected = 16.0f;
static CGFloat const WMTitleSizeNormal   = 15.0f;
//  导航菜单栏的高度
static CGFloat const WMMenuHeight        = 30.0f;
//  导航菜单栏每个item的宽度
static CGFloat const WMMenuItemWidth     = 65.0f;


static NSString *const WMControllerDidAddToSuperViewNotification = @"WMControllerDidAddToSuperViewNotification";

static NSString *const WMControllerDidFullyDisplayedNotification = @"WMControllerDidFullyDisplayedNotification";

