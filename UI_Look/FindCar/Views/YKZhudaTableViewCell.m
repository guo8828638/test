//
//  YKZhudaTableViewCell.m
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKZhudaTableViewCell.h"

@implementation YKZhudaTableViewCell

- (void)dealloc{
    [_car release];
    [_zhudaArray release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)createSubviews{
    self.brandView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 125)];
    self.brandView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.brandView];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * 125, 0, 375 / 3, 125);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 375 / 3, 80)];
        YKCar *car = [self.zhudaArray objectAtIndex:i];
        NSURL *url = [NSURL URLWithString:car.imgurl];
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        [button addSubview:imageView];
        [imageView release];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 375 / 3, 35)];
        label.text = car.name;
        label.textAlignment = NSTextAlignmentCenter;
        [button addSubview:label];
        [label release];
        
        [self.brandView addSubview:button];
    }
    [_brandView release];
}

- (void)setZhudaArray:(NSMutableArray *)zhudaArray{
    if (_zhudaArray != zhudaArray) {
        [_zhudaArray release];
        _zhudaArray = [zhudaArray retain];
    }
    if (_zhudaArray.count != 0) {
        [self createSubviews];
    }
}

- (void)buttonAction:(UIButton *)button{
    NSLog(@"=====%ld", button.tag);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
