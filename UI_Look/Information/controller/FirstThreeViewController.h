//
//  FirstThreeViewController.h
//  UI_Look
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface FirstThreeViewController : UIViewController

@property (nonatomic,retain)FirstModel *model;
@property (nonatomic,copy)NSString *str;
@property (nonatomic,copy)NSString *str1;
@property (nonatomic,copy)NSString *str2;
@property (nonatomic,copy)NSString *str3;
@property (nonatomic,assign)NSInteger num;
@property (nonatomic,retain)UILabel *headLabel;
@property (nonatomic,retain)UILabel *footLabel;


@end
