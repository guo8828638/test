//
//  YKHotTableViewCell.m
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKHotTableViewCell.h"

@implementation YKHotTableViewCell

- (void)dealloc{
    [_hotArray release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)createSubviews{
    self.hotView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 165)];
    self.hotView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.hotView];
    for (int i = 0; i < 10; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(75 * (i % 5),82.5 * (i / 5), 75, 82.5);
        [self.hotView addSubview:button];
        
        YKCar *car = [self.hotArray objectAtIndex:i];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5, 5, 50, 50)];
        NSString *string = [NSString stringWithFormat:@"http:x.autoimg.cn/app/image/brands/%@.png", car.carId];
        NSURL *url = [NSURL URLWithString:string];
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        [button addSubview:imageView];
        [imageView release];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, 75, 22.5)];
        label.text = car.name;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        [button addSubview:label];
        [label release];
        
        NSInteger t = [car.carId integerValue];
        button.tag = 1000 + t;
        [button addTarget:self action:@selector(buttonCarAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    [_hotView release];
}

- (void)setHotArray:(NSMutableArray *)hotArray{
    if (_hotArray != hotArray) {
        [_hotArray release];
        _hotArray = [hotArray retain];
    }
    if (_hotArray.count != 0) {
        [self createSubviews];
    }
}

- (void)buttonCarAction:(UIButton *)button{
    NSLog(@"点击的是%ld", button.tag - 1000);
    [self.TokyoHotDelegate TokyoHot:[NSString stringWithFormat:@"%ld", button.tag - 1000]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
