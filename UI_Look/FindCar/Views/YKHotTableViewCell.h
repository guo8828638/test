//
//  YKHotTableViewCell.h
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKCar.h"

@protocol YKHotTableViewCellDelegate <NSObject>

- (void)TokyoHot:(NSString *)carId;

@end

@interface YKHotTableViewCell : UITableViewCell

@property (nonatomic, retain)NSMutableArray* hotArray;
@property (nonatomic, retain)UIView *hotView;

@property (nonatomic, assign)id<YKHotTableViewCellDelegate>TokyoHotDelegate;

@end
