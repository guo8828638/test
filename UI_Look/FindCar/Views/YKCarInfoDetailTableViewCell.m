//
//  YKCarInfoDetailTableViewCell.m
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKCarInfoDetailTableViewCell.h"

@implementation YKCarInfoDetailTableViewCell

- (void)dealloc{
    [_smallModel release];
    [_nameLabel release];
    [_priceLabel release];
    [_minpriceLabel release];
    [_attentionLabel release];
    [_attentionSlider release];
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
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 270, 20)];
    [self.contentView addSubview:self.nameLabel];
    [_nameLabel release];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.nameLabel.frame.origin.y+self.nameLabel.frame.size.height+15, 230, 20)];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.priceLabel];
    [_priceLabel release];
    
    self.minpriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-68, self.nameLabel.frame.origin.y+self.nameLabel.frame.size.height+14, 100, 21)];
    self.attentionLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.minpriceLabel];
    [_minpriceLabel release];
    
    
    self.attentionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.priceLabel.frame.origin.y+self.priceLabel.frame.size.height+15, 50, 20)];
    self.attentionLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.attentionLabel];
    [_attentionLabel release];
    
    self.attentionSlider = [[UISlider alloc] initWithFrame:CGRectMake(70, self.priceLabel.frame.origin.y + self.priceLabel.frame.size.height + 18, 200, 10)];
    [self.contentView addSubview:self.attentionSlider];
    [_attentionSlider release];
    self.attentionSlider.userInteractionEnabled = NO;
}

-(void)setSmallModel:(YKSmallModel *)smallModel{
    if (_smallModel != smallModel) {
        [_smallModel release];
        _smallModel = [smallModel retain];
    }
    self.nameLabel.text = self.smallModel.name;
    NSString *str = [NSString stringWithFormat:@"指导价:%@               参考低价:", self.smallModel.price];
    self.priceLabel.text = str;
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.textColor = [UIColor lightGrayColor];
    NSString *str1 = [NSString stringWithFormat:@"%@", self.smallModel.minprice];
    self.minpriceLabel.text = str1;
    self.minpriceLabel.textAlignment = NSTextAlignmentLeft;
    self.minpriceLabel.textColor = [UIColor redColor];
    self.attentionLabel.text = @"关注度:";
    self.attentionLabel.textColor = [UIColor lightGrayColor];
    
    NSInteger attention = [self.smallModel.attention integerValue];
    self.attentionSlider.value = (CGFloat)attention / 100;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
