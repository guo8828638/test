//
//  TalkDetailViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"
#import "BaseViewController.h"

@interface TalkDetailViewController : BaseViewController
@property (nonatomic,retain)TalkModel *model;
@property (nonatomic,retain)UIButton *rightButton;
@property (nonatomic,assign)BOOL *isSelected;

@end
