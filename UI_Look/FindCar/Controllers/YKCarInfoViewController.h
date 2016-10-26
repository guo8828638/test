//
//  YKCarInfoViewController.h
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKDetailCar.h"

@interface YKCarInfoViewController : YKBaseViewController

@property (nonatomic, retain)YKDetailCar *detailCar;

@property(nonatomic,retain)NSMutableArray *array;

@property(nonatomic,retain)UITableView *myTableView;
@property(nonatomic,retain)UIImageView *imageView;



@end
