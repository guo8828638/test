//
//  YKBigModel.m
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKBigModel.h"

@implementation YKBigModel

- (void)dealloc{
    [_enginelist release];
    [_paramlist release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)setEnginelist:(NSMutableArray *)enginelist{
    if (_enginelist != enginelist) {
        [_enginelist release];
        _enginelist = [enginelist retain];
    }
    NSMutableArray *array = [NSMutableArray array];
    for (NSMutableDictionary *dic in enginelist) {
        YKMiddleModel *middleModel = [YKMiddleModel modelWithDictionary:dic];
        [array addObject:middleModel];
    }
    _enginelist = [[NSMutableArray alloc] initWithArray:array];
}

@end
