//
//  YKFindCarDetailTableViewCell.h
//  AutocCarApp
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKDetailCar.h"

@interface YKFindCarDetailTableViewCell : UITableViewCell

@property (nonatomic, retain)YKDetailCar *car;

@property(nonatomic, retain)UIImageView *headImageView;
@property(nonatomic, retain)UILabel *nameLabel;
@property(nonatomic, retain)UILabel *priceLabel;

@end
