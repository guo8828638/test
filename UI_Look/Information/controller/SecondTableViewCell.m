//
//  SecondTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SecondTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"


@implementation SecondTableViewCell
- (void)dealloc
{
    [_leftImageView release];
    [_titleLabel release];
    [_footLabel release];
    [_importantKey release];
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
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (120*WIDTH)/375, (100*HEIGHT)/667)];
    
    self.leftImageView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.leftImageView];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((130*WIDTH)/375, (10*HEIGHT)/667, (200*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [self.contentView addSubview:self.titleLabel];
    
    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake((130*WIDTH)/375, (60*HEIGHT)/667, (200*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.footLabel.backgroundColor = [UIColor whiteColor];
    
    self.footLabel.textColor = [UIColor brownColor];
    
    [self.contentView addSubview:self.footLabel];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
//        self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
//        self.titleLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
//
//        self.footLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
//        
//        self.footLabel.normalBackgroundColor = [UIColor whiteColor];
//        
//        self.leftImageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 60,120 , 20*HEIGHT/667*100)];
//        
//        label.backgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
//        
//        [self.contentView addSubview:label];
//        
//        [label addSubview:self.leftImageView];
//
//         self.titleLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
//        
//        self.footLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
//
        
    }];
    
    
    
}

-(void)setModel:(SecondModel *)model
{
    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
    }
    
    self.footLabel.text =  self.model.ename;
    
    NSURL *url = [NSURL URLWithString:self.model.img];
    
    [self.leftImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
    
//
//关键字高亮
    if (self.importantKey.length >0) {
        
        NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:model.name];
        NSRange range = [model.name rangeOfString:self.importantKey];
        [attrituteString setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:18]} range:range];
        self.titleLabel.attributedText = attrituteString;
        return;
        
    }
    self.titleLabel.text = self.model.name;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
