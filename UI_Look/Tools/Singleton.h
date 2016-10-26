//
//  Singleton.h
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
+(instancetype)shareSingleton;
@property (nonatomic,retain)NSMutableDictionary *dic;
@property (nonatomic,retain)NSMutableArray *allKeysArray;

@end
