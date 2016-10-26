//
//  YKCarInfoDetailTableViewCell.h
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKSmallModel.h"

@interface YKCarInfoDetailTableViewCell : UITableViewCell

@property (nonatomic, retain)YKSmallModel *smallModel;

@property (nonatomic, retain)UILabel *nameLabel;
@property (nonatomic, retain)UILabel *priceLabel;
@property (nonatomic, retain)UILabel *minpriceLabel;
@property (nonatomic, retain)UILabel *attentionLabel;

@property (nonatomic, retain)UISlider *attentionSlider;

@end
