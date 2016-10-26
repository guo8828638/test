//
//  MoreTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreModel.h"

@interface MoreTableViewCell : UITableViewCell
@property (nonatomic,retain)MoreModel *model;

@property (nonatomic,retain)UILabel* mainLabel;
@end
