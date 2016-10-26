//
//  YKFindCarViewController.h
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKFindCarViewController : YKBaseViewController

@property (nonatomic, retain)UISearchBar *mySearchBar;
@property (nonatomic, retain)UISearchDisplayController *searchDC;
@property (nonatomic, retain)NSMutableArray *searchArray;

@property (nonatomic, copy)NSString *important;

@end
