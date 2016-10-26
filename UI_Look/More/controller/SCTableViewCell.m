//
//  SCTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SCTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation SCTableViewCell
- (void)dealloc
{
    [_leftImageView release];
    [_titleLabel release];
    [_summaryLabel release];
    [_model release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews
{


    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (20*HEIGHT)/667, (90*WIDTH)/375, (90*HEIGHT)/667)];
    
    [self.contentView addSubview:self.leftImageView];
    
    [_leftImageView release];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((110*WIDTH)/375, (20*HEIGHT)/667, (250*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [self.contentView addSubview:self.titleLabel];
    
    [_titleLabel release];
    
    
    self.summaryLabel = [[UILabel alloc]initWithFrame:CGRectMake((125*WIDTH)/375, (40*HEIGHT)/667, (250*WIDTH)/375, (90*HEIGHT)/667)];
    
    self.summaryLabel.font = [UIFont boldSystemFontOfSize:13];
    
    [self.contentView addSubview:self.summaryLabel];
    
    self.summaryLabel.numberOfLines= 0;
    
    [_summaryLabel release];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.leftImageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.titleLabel.nightBackgroundColor =[UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.summaryLabel.nightBackgroundColor= [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.titleLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.summaryLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        
        
    }];






}
-(void)setModel:(TalkModel *)model
{


    if (_model != model ) {
        
        [_model release];
        
        _model = [model retain];
    }

    
    self.titleLabel.text = self.model.title;
    
    self.summaryLabel.text = self.model.summary;
    
    NSURL *url = [NSURL URLWithString:self.model.cover_thumb];
    
    [self.leftImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];

    

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
