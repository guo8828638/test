//
//  RootTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "RootTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation RootTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubViews];
    }
    
    return self;
    
    
}

-(void)createSubViews
{

    self.leftimageView = [[UIImageView alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (15*HEIGHT)/667, (80*WIDTH)/375, (90*HEIGHT)/667)];
    
    self.leftimageView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.leftimageView];
    
    [_leftimageView release];
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake((110*WIDTH)/375, (-20*HEIGHT)/667, (260*WIDTH)/375, (150*HEIGHT)/667)];
    
    self.contentLabel.backgroundColor = [UIColor whiteColor];
    
    self.contentLabel.numberOfLines=0;
    
    self.contentLabel.font =[UIFont boldSystemFontOfSize:18];

    [self.contentView addSubview:self.contentLabel];
    
    [_contentLabel release];


    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake((110*WIDTH)/375, (112*HEIGHT)/667, (100*WIDTH)/375, (15*HEIGHT)/667)];
    
    self.dateLabel.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.dateLabel];
    
    [_dateLabel release];
    
    
    self.brandLabel = [[UILabel alloc]initWithFrame:CGRectMake((250*WIDTH)/375,(110*HEIGHT)/667, (120*WIDTH)/375, (15*HEIGHT)/667)];
    
    self.brandLabel.backgroundColor = [UIColor whiteColor];
    
    self.brandLabel.textAlignment =  NSTextAlignmentRight;
    
    [self.contentView addSubview:self.brandLabel];
    
    [_brandLabel release];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.leftimageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.contentLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.brandLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.dateLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        self.dateLabel.normalBackgroundColor = [UIColor whiteColor];
        
        self.contentLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        self.brandLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        self.dateLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

        
        
        
    }];


}

-(void)setModel:(InfoTableViewModel *)model
{
    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
    }

   
    self.contentLabel.text = self.model.title;
    
    NSString *str = self.model.updatetime;
    
    NSArray *array = [str componentsSeparatedByString:@" "];
    
    self.dateLabel.text = [array objectAtIndex:0];
    
    self.brandLabel.text = self.model.brand_name;
    
    NSURL *url = [NSURL URLWithString:self.model.img];
    
    [self.leftimageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
    
    
    
    

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
