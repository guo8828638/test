//
//  YKCar.m
//  AutocCarApp
//
//  Created by dllo on 15/11/19.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKCar.h"

@implementation YKCar

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.carId = [NSString stringWithFormat:@"%@", value];
    }
    if ([key isEqualToString:@"img"]) {
        self.imgurl = value;
    }
    if ([key isEqualToString:@"seriesname"]) {
        self.name = value;
    }
}

@end
