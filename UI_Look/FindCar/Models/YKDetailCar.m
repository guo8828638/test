//
//  YKDetailCar.m
//  AutocCarApp
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKDetailCar.h"

@implementation YKDetailCar

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.carId = [NSString stringWithFormat:@"%@", value];
    }
}

@end
