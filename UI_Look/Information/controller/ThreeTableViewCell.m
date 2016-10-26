//
//  ThreeTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "ThreeTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation ThreeTableViewCell
- (void)dealloc
{
    [_model release];
    [_leftImageView release];
    [_midImageView release];
    [_rightImageView release];
    [super dealloc];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubViews];
    }
    
    return self;
    
    
}
-(void)createSubViews
{
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 320, 60)];
    
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.numberOfLines = 0;
    
    [_titleLabel release];
    
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (60*HEIGHT)/667, (115*WIDTH)/375, (80*HEIGHT)/667)];
    
    self.leftImageView.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:self.leftImageView];
    
    [_leftImageView release];
    
    
    self.midImageView = [[UIImageView alloc]initWithFrame:CGRectMake((130*WIDTH)/375, (60*HEIGHT)/667, (115*WIDTH)/375, (80*HEIGHT)/667)];
    
    [self.contentView addSubview:self.midImageView];
    
    [_midImageView release];
    
    
    self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake((250*WIDTH)/375, (60*HEIGHT)/667, (115*WIDTH)/375,(80*HEIGHT)/667)];
    
    [self.contentView addSubview:self.rightImageView];
    
    [_rightImageView release];
    
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.titleLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.rightImageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        self.midImageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        self.leftImageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.titleLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        
        
        
        
    }];
    
    
    
}
-(void)setModel:(FirstModel *)model
{
    
    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
    }
    
    
    self.titleLabel.text = self.model.title;
    
    NSURL *url = [NSURL URLWithString:self.model.imglink];
    
    [self.leftImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
    
    NSURL *urlMid = [NSURL URLWithString:self.model.imglink_2];
    
    [self.midImageView sd_setImageWithURL:urlMid placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
    
    NSURL *urlRight = [NSURL URLWithString:self.model.imglink_3];
    
    [self.rightImageView sd_setImageWithURL:urlRight placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
