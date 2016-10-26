//
//  Singleton.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "Singleton.h"
#import "MoreModel.h"
@implementation Singleton
- (void)dealloc
{
    [_dic release];
    [_allKeysArray release];
    [super dealloc];
}
+ (instancetype)shareSingleton
{
    static Singleton *singleton = nil;
    if (singleton == nil) {
        singleton = [[Singleton alloc] init];
        [singleton createBigDic];
    }
    return singleton;
}
-(void)createBigDic
{


    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"More" ofType:@"plist"];

    NSMutableDictionary *bigDic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    self.dic = [NSMutableDictionary dictionary];
    
    
    for (NSString *key in bigDic) {
        
        NSMutableArray *array = [bigDic objectForKey:key];
        
        NSMutableArray *BigArray = [NSMutableArray array];
        
        for (NSMutableDictionary *dic in array) {
            
            MoreModel *model = [[MoreModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [BigArray addObject:model];
            
            [model release];
            
        }
        
        [self.dic setObject:BigArray forKey:key];
        
        
        
    }
    
    self.allKeysArray =[NSMutableArray arrayWithArray:self.dic.allKeys];


    


}


@end
