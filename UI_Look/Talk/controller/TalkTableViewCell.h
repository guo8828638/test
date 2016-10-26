//
//  TalkTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"

@interface TalkTableViewCell : UITableViewCell
@property (nonatomic,retain)TalkModel *model;
@property (nonatomic,retain)UIImageView *leftImageView;
@property (nonatomic,retain)UILabel *headLabel;
@property (nonatomic,retain)UILabel *midLabel;
@property (nonatomic,retain)UILabel *footLabel;

@end
