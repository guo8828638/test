//
//  SecondTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"

@interface SecondTableViewCell : UITableViewCell
@property (nonatomic,retain)SecondModel *model;
@property (nonatomic,retain)UIImageView *leftImageView;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UILabel *footLabel;
@property (nonatomic,copy)NSString *importantKey;

@end
