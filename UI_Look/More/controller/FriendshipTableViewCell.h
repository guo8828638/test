//
//  FriendshipTableViewCell.h
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendshipModel.h"
@interface FriendshipTableViewCell : UITableViewCell
@property (nonatomic,retain)FriendshipModel *model;
@property (nonatomic,retain)UIImageView *backImageView;
@property (nonatomic,retain)UILabel *headLabel;
@property (nonatomic,retain)UILabel *midLabel;
@property (nonatomic,retain)UILabel *footLabel;

@end
