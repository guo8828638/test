//
//  MoreTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "DKNightVersion.h"

@implementation MoreTableViewCell
- (void)dealloc
{
    [_mainLabel release];
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

    self.mainLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 8*HEIGHT/667, WIDTH, (35*HEIGHT)/667)];
    
    [self.contentView addSubview:self.mainLabel];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        
       
        @strongify(self);
        
        self.mainLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.mainLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.contentView.normalBackgroundColor = [UIColor whiteColor];
        
        
    }];
    
    [_mainLabel release];
    

}

-(void)setModel:(MoreModel *)model
{

   
    if (_model != model) {
        
        [_model release];
        _model = [model retain];
        
    }
    
    self.mainLabel.text = [NSString stringWithFormat:@"   %@",self.model.name];



}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
