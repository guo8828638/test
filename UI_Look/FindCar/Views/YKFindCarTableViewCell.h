//
//  YKFindCarTableViewCell.h
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKCar.h"

@interface YKFindCarTableViewCell : UITableViewCell

@property (nonatomic, retain)YKCar *car;

@property (nonatomic, retain)UIImageView *headImageView;
@property (nonatomic, retain)UILabel *nameLabel;

@property (nonatomic, copy)NSString *important;

@end
