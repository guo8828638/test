//
//  BrandCollectionViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandModel.h"

@interface BrandCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain)BrandModel *model;
@property (nonatomic,retain)UIImageView *headImageView;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UILabel *contentLabel;
@property (nonatomic,retain)UILabel *grayLabel;
@property (nonatomic,retain)UILabel *dateLabel;
@property (nonatomic,retain)UILabel *brandLabel;
@property (nonatomic,retain)UILabel *date1Label;
@property (nonatomic,retain) UIImage *imagebo;

@end
