//
//  BrandDetailViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandModel.h"
#import "BaseViewController.h"

@interface BrandDetailViewController : BaseViewController
@property (nonatomic,retain)BrandModel *model;
@property (nonatomic,copy)NSString *str;

@end
