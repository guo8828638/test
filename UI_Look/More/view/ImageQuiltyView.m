//
//  ImageQuiltyView.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "ImageQuiltyView.h"
#import "DKNightVersion.h"

@implementation ImageQuiltyView
- (void)dealloc
{
    [_aLabel release];
    [_bLabel release];
    [_cLabel release];
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

    self.aLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 40*HEIGHT/667, WIDTH, 30*HEIGHT/667)];
    
    self.aLabel.text = @"自动选择";
    
    [self addSubview:self.aLabel];
    
    [_aLabel release];
    
    
    self.bLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 90*HEIGHT/667, WIDTH, 30*HEIGHT/667)];
    
    self.bLabel.text = @"高品质图片";
    
    [self addSubview:self.bLabel];
    
    [_bLabel release];
    
    
    
    self.cLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 140*HEIGHT/667, WIDTH, 30*HEIGHT/667)];
    
    self.cLabel.text = @"低品质图片";
    
    [self addSubview:self.cLabel];
    
    [_cLabel release];
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.aLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.bLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.cLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.aLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.bLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        self.cLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];



        
    }];
    
    





}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
