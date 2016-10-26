//
//  FriendshipTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@implementation FriendshipTableViewCell
- (void)dealloc
{
    [_headLabel release];
    [_midLabel release];
    [_footLabel release];
    [_backImageView release];
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

    self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 5*HEIGHT/667, 150*WIDTH/375, 30*HEIGHT/667)];
    
    self.headLabel.backgroundColor = [UIColor whiteColor];
    
    self.headLabel.font = [UIFont boldSystemFontOfSize:12];
    
    self.headLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.headLabel];
    
    [_headLabel release];
    
    
    self.midLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 30*HEIGHT/667, 200*WIDTH/375, 30*HEIGHT/667)];
    
    self.midLabel.backgroundColor = [UIColor whiteColor];
    
    self.midLabel.font = [UIFont boldSystemFontOfSize:14];
    
    self.midLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.midLabel];
    
    [_midLabel release];
    
    
    self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH/375, 60*HEIGHT/667, 350*WIDTH/375, 180*HEIGHT/667)];
    
    [self.contentView addSubview:self.backImageView];
    
    [_backImageView release];

    
    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 240*HEIGHT/667, 100*WIDTH/375, 30*HEIGHT/667)];
    
    self.footLabel.backgroundColor = [UIColor whiteColor];
    
    self.footLabel.font = [UIFont boldSystemFontOfSize:12];
    
    self.footLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.footLabel];
    
    [_footLabel release];

    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
     self.headLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
     self.footLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
     self.midLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

     self.contentView.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
    
     self.headLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

     self.midLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
     self.footLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.footLabel.normalBackgroundColor = [UIColor whiteColor];
        
        
    }];

    
    
    

}
-(void)setModel:(FriendshipModel *)model
{

    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
    }

    
    self.headLabel.text = self.model.Typename;
    
    self.midLabel.text =self.model.title;
    
    self.footLabel.text = self.model.createtime;
    
    NSURL *url = [NSURL URLWithString:self.model.img];
    
    [self.backImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
    

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
