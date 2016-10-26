//
//  VideoCollectionViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
@interface VideoCollectionViewCell : UICollectionViewCell

@property (nonatomic,retain)VideoModel *model;
@property (nonatomic,retain)UIImageView *backImageView;
@property (nonatomic,retain)UILabel *headLabel;
@property (nonatomic,retain)UILabel *footLabel;
@property (nonatomic,retain)UILabel *backLabel;


@end
