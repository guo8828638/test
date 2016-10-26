//
//  FriendshipDetailViewController.h
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendshipModel.h"

@interface FriendshipDetailViewController : UIViewController
@property (nonatomic,retain)FriendshipModel *model;
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,retain)UIImageView *backImageView;
@property (nonatomic,retain)UILabel *leftLabel;
@property (nonatomic,retain)UILabel *rightLabel;
@property (nonatomic,retain)UILabel *editLabel;
@property (nonatomic,retain)UILabel *peopleLabel;
@property (nonatomic,retain)UIImageView *SBImageView;
@property (nonatomic,retain)UILabel *SBlabel;
@property (nonatomic,retain)UILabel *dateLabel;
@property (nonatomic,retain)UILabel *contentLabel;
@property (nonatomic,retain)UILabel *backLabel;
@property (nonatomic,retain)UILabel *kbnrLabel;
@property (nonatomic,retain)UILabel *sepLabel;
@property (nonatomic,retain)NSMutableArray *bigArray;

@end
