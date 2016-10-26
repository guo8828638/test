//
//  VideoCollectionReusableView.h
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@protocol jumpDelegate <NSObject>

-(void)presentToViewController:(VideoModel *)model;

@end


@interface VideoCollectionReusableView : UICollectionReusableView

@property (nonatomic,retain)NSMutableArray *headArray;
@property (nonatomic,retain)UIImageView *backImageView;


@property (nonatomic,assign)id<jumpDelegate>jump;

@end
