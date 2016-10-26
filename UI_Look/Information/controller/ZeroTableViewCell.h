//
//  ZeroTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"


@interface ZeroTableViewCell : UITableViewCell
@property (nonatomic,retain)FirstModel *model;
@property (nonatomic,retain)UIImageView *leftImageView;
@property (nonatomic,retain)UILabel *titleLabel;

@end
