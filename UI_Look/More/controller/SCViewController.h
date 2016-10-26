//
//  SCViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface SCViewController : BaseViewController
@property (nonatomic,retain) NSMutableArray *SCarray;
@property (nonatomic,retain)UILabel *label;
@property (nonatomic,retain) UIImageView *imageView;
-(void)reload;

@end
