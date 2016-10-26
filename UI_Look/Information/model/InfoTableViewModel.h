//
//  InfoTableViewModel.h
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoTableViewModel : NSObject
@property (nonatomic,copy)NSString *contentid;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *url; //webView
@property (nonatomic,copy)NSString *img; //img
@property (nonatomic,copy)NSString *brand_name;
@property (nonatomic,copy)NSString *updatetime;


@end
