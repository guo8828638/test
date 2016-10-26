//
//  YKHeadTableViewCell.m
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKHeadTableViewCell.h"

@implementation YKHeadTableViewCell

- (void)dealloc{
    [_headView release];
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
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    self.headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.headView];
    
    NSArray *array = [NSArray arrayWithObjects:@"iconfont-iconwenzhangcaozuoshoucangbukedianji.png", @"icon_history@3x.png", @"icon_hot@3x.png", nil];
    NSArray *titles = [NSArray arrayWithObjects:@"我的收藏", @"浏览历史", @"热销排行", nil];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * 375 / 3, 0, 375 / 3, 150);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1000 + i;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 20, 40, 40)];
        imageView.image = [UIImage imageNamed:[array objectAtIndex:i]];
        [button addSubview:imageView];
        [imageView release];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 60, 20)];
        title.font = [UIFont systemFontOfSize:14];
        title.text = [titles objectAtIndex:i];
        [button addSubview:title];
        [title release];
        
        [self.headView addSubview:button];
    }
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(375 / 3 - 1, 25, 2, 70)];
    imageView1.image = [UIImage imageNamed:@"sideBar_shadow_bg@2x.png"];
    [self addSubview:imageView1];
    [imageView1 release];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(375 / 3 * 2 - 1, 25, 2, 70)];
    imageView2.image = [UIImage imageNamed:@"sideBar_shadow_bg@2x.png"];
    [self addSubview:imageView2];
    [imageView2 release];
    
    [_headView release];
}

- (void)buttonAction:(UIButton *)button{
    NSLog(@"点击的是%ld", button.tag);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
