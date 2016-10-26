//
//  YKFindCarView.h
//  AutocCarApp
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKFindCarDetailTableViewCell.h"

@protocol YKFindCarViewDelegate <NSObject>

- (void)changeMi:(NSString *)mi;
- (void)changeNi:(NSString *)ni;

- (void)carInfoGo:(YKDetailCar *)detailCar;

@end

@interface YKFindCarView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)YKDetailCar *car;
@property (nonatomic, retain)NSMutableDictionary *dic;
@property (nonatomic, retain)UITableView *myTableView;

@property (nonatomic, retain)UISegmentedControl *segmentC;

@property (nonatomic, assign)id<YKFindCarViewDelegate>YKFindViewDelegate;

@property (nonatomic, copy)NSString *this;

@end
