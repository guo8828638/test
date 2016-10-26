//
//  TalkTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "TalkTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation TalkTableViewCell
- (void)dealloc
{
    [_leftImageView release];
    [_headLabel release];
    [_midLabel release];
    [_footLabel release];
    [_model release];
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

    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (10*HEIGHT)/667, (80*WIDTH)/375, (90*HEIGHT)/667)];
    
    [self.contentView addSubview:self.leftImageView];
    
    [_leftImageView release];
    
    
    self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake((90*WIDTH)/375, (10*HEIGHT)/667, (270*WIDTH)/375, (20*HEIGHT)/667)];
    
    [self.contentView addSubview:self.headLabel];
    
    self.headLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [_headLabel release];
    
    self.midLabel = [[UILabel alloc]initWithFrame:CGRectMake((100*WIDTH)/375, (35*HEIGHT)/667, (200*WIDTH)/375, (10*HEIGHT)/667)];
    
    self.midLabel.font = [UIFont boldSystemFontOfSize:11];
    
    [self.contentView addSubview:self.midLabel];
    
    [_midLabel release];
    
    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake((100*WIDTH)/375, (50*HEIGHT)/667, (270*WIDTH)/375, (60*HEIGHT)/667)];
    
    self.footLabel.numberOfLines = 0;
    
    self.footLabel.font = [UIFont boldSystemFontOfSize:13];
    
    [self.contentView addSubview:self.footLabel];
    
    [_footLabel release];
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.headLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.midLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        self.footLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        
        
    }];


}

-(void)setModel:(TalkModel *)model
{
    if (_model != model) {
        
        [_model release];
        
        _model  = [model retain];
        
    }


    self.headLabel.text = self.model.title;
    
    self.midLabel.text = self.model.pubdate;
    
    self.footLabel.text = self.model.summary;
    
    NSURL *url = [NSURL URLWithString:self.model.cover_thumb];
    
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
