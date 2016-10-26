//
//  BrandTwoCollectionViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BrandTwoCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation BrandTwoCollectionViewCell
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


    self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (172*WIDTH)/375, (200*HEIGHT)/667)];
    
    [self.contentView addSubview:self.backImageView];
    
    self.backImageView.userInteractionEnabled = YES;
    
    [_backImageView release];
    
    
    self.backLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (93*HEIGHT)/375, (173*WIDTH)/375, (34*HEIGHT)/667)];
    
    self.backLabel.backgroundColor =[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.9];
    
    [self.contentView addSubview:self.backLabel];
    
    [_backLabel release];
    
    
    self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (168*HEIGHT)/667, (150*WIDTH)/375, (20*HEIGHT)/667)];
    
    self.headLabel.textColor = [UIColor whiteColor];
    
    self.headLabel.font = [UIFont boldSystemFontOfSize:13];
    
    [self.contentView addSubview:self.headLabel];
    
    [_headLabel release];
    
    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (183*HEIGHT)/667, (130*WIDTH)/375, (20*HEIGHT)/667)];
    
    self.footLabel.font = [UIFont boldSystemFontOfSize:10];
    
    self.footLabel.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.footLabel];
    
    [_footLabel release];

    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.backLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.headLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        self.footLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.headLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.footLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
        
        self.backLabel.normalBackgroundColor = [UIColor lightGrayColor];
        
        self.footLabel.normalBackgroundColor = [UIColor clearColor];
        
        self.headLabel.normalTextColor = [UIColor whiteColor];
        
        self.footLabel.normalTextColor = [UIColor whiteColor];
        
        
    }];






}

-(void)setModel:(BrandModel *)model
{
    if (_model != model) {
        
        [_model release];
        
        _model  = [model retain];
        
        
    }
    
    
    
    self.headLabel.text = self.model.title;
    
    self.footLabel.text = self.model.pubdate;
    
    NSURL *url = [NSURL URLWithString:self.model.cover_landscape];
    
    [self.backImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
    



}


@end
