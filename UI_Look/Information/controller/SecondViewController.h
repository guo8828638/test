//
//  SecondViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SecondViewController : BaseViewController
@property (nonatomic,retain)NSMutableDictionary *bigDic;
@property (nonatomic,retain) NSMutableArray *sectionArray;
@property (nonatomic,retain) NSArray *bigArray;
@property (nonatomic,retain) NSMutableArray *keysArray;
@property (nonatomic,retain)NSMutableArray *arrayRow;
@property (nonatomic,retain)NSMutableArray *searchArray;
@property (nonatomic,retain)UISearchBar *mySearchBar;
@property (nonatomic,retain)UISearchDisplayController *searchDC;
@property (nonatomic,copy)NSString *importantKey;


@end
