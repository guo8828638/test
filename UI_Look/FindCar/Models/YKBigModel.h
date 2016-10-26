//
//  YKBigModel.h
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKMiddleModel.h"

@interface YKBigModel : YKBaseModel

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *logo;
@property (nonatomic, copy)NSString *levelname;
@property (nonatomic, copy)NSString *fctprice;
@property (nonatomic, retain)NSMutableArray *paramlist;

@property (nonatomic, retain)NSMutableArray *enginelist;

@end
