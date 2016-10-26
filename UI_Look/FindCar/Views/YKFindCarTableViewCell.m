//
//  YKFindCarTableViewCell.m
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKFindCarTableViewCell.h"

@implementation YKFindCarTableViewCell

- (void)dealloc{
    [_car release];
    [_headImageView release];
    [_nameLabel release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    [self.contentView addSubview:self.headImageView];
    [_headImageView release];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 375-self.headImageView.frame.origin.x-20-10, 20)];
    [self.contentView addSubview:self.nameLabel];
    [_nameLabel release];
}

- (void)setCar:(YKCar *)car{
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
    NSString *urlStr = [NSString stringWithFormat:@"http://x.autoimg.cn/app/image/brands/%@.png", self.car.carId];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.headImageView sd_setImageWithURL:url];
    self.nameLabel.text = self.car.name;
}

- (void)setImportant:(NSString *)important{
    if (_important != important) {
        [_important release];
        _important = [important retain];
    }
    NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:self.car.name];
    NSRange range = [self.car.name rangeOfString:self.important];
    [attrituteString setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:18]} range:range];
    self.nameLabel.attributedText = attrituteString;
    return;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
