//
//  AppTools.h
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^AppToolsBlock)(id result);

@interface AppTools : NSObject

+(void)getLocalDataWithURL:(NSString *)url Block:(AppToolsBlock)block;
@end
