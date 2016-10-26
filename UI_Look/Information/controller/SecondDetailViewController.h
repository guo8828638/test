//
//  SecondDetailViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"
#import "BaseViewController.h"

@interface SecondDetailViewController : BaseViewController
@property (nonatomic,retain)SecondModel *model;
@property (nonatomic,copy)NSString *str1;
@property (nonatomic,retain)UIWebView *myWebView;
@property (nonatomic,retain)UIWebView *allMyWebView;
@property (nonatomic,retain)UIWebView *showMyWebView;
@property (nonatomic,retain)UIWebView *inMyWebView;


@end
