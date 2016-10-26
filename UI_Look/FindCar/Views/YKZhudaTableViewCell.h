//
//  YKZhudaTableViewCell.h
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKCar.h"

@interface YKZhudaTableViewCell : UITableViewCell

@property (nonatomic, retain)NSMutableArray *zhudaArray;
@property (nonatomic, retain)YKCar *car;
@property (nonatomic, retain)UIView *brandView;

@end
