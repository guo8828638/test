//
//  RootViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface RootViewController : BaseViewController
@property (nonatomic,assign)CGFloat w;
//@property (nonatomic,retain)NSMutableArray *imageArray;
@property (nonatomic,retain)NSMutableArray *modelArray;
@property (nonatomic,retain)NSMutableArray *tableViewArray;
@property (nonatomic,retain)NSMutableArray *tableViewModelArray;
@property (nonatomic,retain)UIWebView *webView;



@property (nonatomic, retain)NSArray *imageArray;
@property (nonatomic, retain)UIScrollView *downScrollView;
@property (nonatomic, assign)CGFloat cgf;
@property (nonatomic, retain)NSTimer *timer;
@property (nonatomic, retain)UIPageControl *pageC;


@end
