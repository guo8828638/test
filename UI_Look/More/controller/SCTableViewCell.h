//
//  SCTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"

@interface SCTableViewCell : UITableViewCell
@property (nonatomic,retain)TalkModel *model;
@property (nonatomic,retain)UIImageView *leftImageView;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UILabel *summaryLabel;

@end
