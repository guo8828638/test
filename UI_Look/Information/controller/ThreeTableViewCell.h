//
//  ThreeTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface ThreeTableViewCell : UITableViewCell
@property (nonatomic,retain)FirstModel *model;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UIImageView *leftImageView;
@property (nonatomic,retain)UIImageView *midImageView;
@property (nonatomic,retain)UIImageView *rightImageView;


@end
