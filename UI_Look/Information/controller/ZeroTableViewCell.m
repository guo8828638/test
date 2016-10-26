//
//  ZeroTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "ZeroTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation ZeroTableViewCell
- (void)dealloc
{
    [_model release];
    [_leftImageView release];
    [_titleLabel release];
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
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (15*HEIGHT)/667, (100*WIDTH)/375, (100*HEIGHT)/667)];
    
    [self.contentView addSubview:self.leftImageView];
    
    [_leftImageView release];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((125*WIDTH)/375, (15*HEIGHT)/667, (250*WIDTH)/375, (50*HEIGHT)/667)];
    
    self.titleLabel.numberOfLines = 0;
    
    
    [self.contentView addSubview:self.titleLabel];
    
    [_titleLabel release];
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.leftImageView.nightBackgroundColor =[UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.titleLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.titleLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        
        
        
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
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
