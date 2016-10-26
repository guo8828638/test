//
//  YKMiddleModel.m
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKMiddleModel.h"

@implementation YKMiddleModel

- (void)dealloc{
    [_speclist release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)setSpeclist:(NSMutableArray *)speclist{
    if (_speclist != speclist) {
        [_speclist release];
        _speclist = [speclist retain];
    }
    NSMutableArray *array = [NSMutableArray array];
    for (NSMutableDictionary *dic in speclist) {
        YKSmallModel *smallModel = [YKSmallModel modelWithDictionary:dic];
        [array addObject:smallModel];
    }
    _speclist = [[NSMutableArray alloc] initWithArray:array];
}

@end
