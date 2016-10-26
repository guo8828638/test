//
//  YKFindCarDetailTableViewCell.m
//  AutocCarApp
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKFindCarDetailTableViewCell.h"

@implementation YKFindCarDetailTableViewCell

- (void)dealloc{
    [_car release];
    [_headImageView release];
    [_nameLabel release];
    [_priceLabel release];
    [super dealloc];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 50)];
    [self.contentView addSubview:self.headImageView];
    [_headImageView release];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImageView.frame.origin.x+80, self.headImageView.frame.origin.y, 200, 20)];
    [self.contentView addSubview:self.nameLabel];
    [_nameLabel release];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImageView.frame.origin.x+80, self.nameLabel.frame.origin.y+30, 200, 20)];
    self.priceLabel.textColor = [UIColor redColor];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.priceLabel];
    [_priceLabel release];
    
}

- (void)setCar:(YKDetailCar *)car{
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
    NSURL *url = [NSURL URLWithString:self.car.imgurl];
    [self.headImageView sd_setImageWithURL:url];
    self.nameLabel.text = self.car.name;
    self.priceLabel.text = self.car.price;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
