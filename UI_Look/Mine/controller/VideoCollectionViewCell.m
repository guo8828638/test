//
//  VideoCollectionViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "VideoCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation VideoCollectionViewCell
- (void)dealloc
{
    [_backImageView release];
    [_backLabel release];
    [_headLabel release];
    [_footLabel release];
    [_model release];
    [super dealloc];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createSubViews];
        
    }
    
    return self;
}

-(void)createSubViews
{
    
    
    self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (173*WIDTH)/375, (150*HEIGHT)/667)];
    
    [self.contentView addSubview:self.backImageView];
    
    self.backImageView.userInteractionEnabled = YES;
    
    [_backImageView release];
    
    
    self.backLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (150*HEIGHT)/667, (170*WIDTH)/375, (50*HEIGHT)/667)];
    
    self.backLabel.backgroundColor =[UIColor whiteColor];
    
    [self.contentView addSubview:self.backLabel];
    
    [_backLabel release];
    
    
    self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (150*HEIGHT)/667, (165*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.headLabel.textColor = [UIColor blackColor];
    
    self.headLabel.numberOfLines = 2;
    
    self.headLabel.font = [UIFont boldSystemFontOfSize:12];
    
    self.headLabel.textAlignment =  NSTextAlignmentLeft;
    
    [self.contentView addSubview:self.headLabel];
    
    [_headLabel release];
    
    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (185*HEIGHT)/667, (165*WIDTH)/375, (15*HEIGHT)/667)];
    
    self.footLabel.font = [UIFont boldSystemFontOfSize:10];
    
    self.footLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.footLabel];
    
    [_footLabel release];
    

    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.headLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        self.footLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.backLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        self.backImageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.headLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.footLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        self.headLabel.normalBackgroundColor = [UIColor whiteColor];
        
        self.footLabel.normalBackgroundColor = [UIColor whiteColor];
        
        self.backLabel.normalBackgroundColor = [UIColor whiteColor];
        
        
        
    }];

    
    
    
    
}
-(void)setModel:(VideoModel *)model
{
    if (_model != model) {
        
        [_model release];
        
        _model  = [model retain];
        
        
    }
    
    
    
    self.headLabel.text = [NSString stringWithFormat:@"%@",self.model.title];
    
    self.footLabel.text = [NSString stringWithFormat:@"  %@",self.model.pubdate];
    
    self.footLabel.textColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.0];
    
    NSURL *url = [NSURL URLWithString:self.model.cover_thumb];
    
     [self.backImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
    
}

@end
