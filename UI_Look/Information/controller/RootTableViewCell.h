//
//  RootTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoTableViewModel.h"

@interface RootTableViewCell : UITableViewCell

@property (nonatomic,retain)UIImageView *leftimageView;
@property (nonatomic,retain)UILabel *contentLabel;
@property (nonatomic,retain)UILabel *dateLabel;
@property (nonatomic,retain)UILabel *brandLabel;
@property (nonatomic,retain)InfoTableViewModel *model;

@end
