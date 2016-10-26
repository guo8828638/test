//
//  FriendshipDetailHeadTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendshipDetailBigModel.h"

@interface FriendshipDetailHeadTableViewCell : UITableViewCell
@property (nonatomic,retain)FriendshipDetailBigModel *model;
@property (nonatomic,retain)UIImageView *leftImageView;
@property (nonatomic,retain)UILabel *authorLabel;
@property (nonatomic,retain)UILabel *dateLabel;
@property (nonatomic,retain)UILabel *contentLabel;
@property (nonatomic,retain)UIImageView *brotherImageView;
@property (nonatomic,retain)NSMutableArray *bigArray;
@property (nonatomic,retain)NSMutableArray *allArray;

+ (CGFloat)heightForContent:(NSString *)content;

@end
