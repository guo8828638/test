//
//  BrandCollectionViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BrandCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"
#import "UIImage+GIF.h"

@implementation BrandCollectionViewCell
- (void)dealloc
{
    [_titleLabel release];
    [_headImageView release];
    [_contentLabel release];
    [_grayLabel release];
    [_dateLabel release];
    [_brandLabel release];
    [_date1Label release];
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
    
    if (![self.model.author isEqualToString:@" "]) {
        
        
//        
//        NSString *name = @"WLA0ZJ7CB]S]VBEG~%)RF%3.gif";
//        NSString *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:name ofType:nil];
//        NSData *imageData = [NSData dataWithContentsOfFile:filePath];
//        self.imagebo = [UIImage sd_animatedGIFWithData:imageData];
        
        
        self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,(500*HEIGHT)/667)];
        
        [self.contentView addSubview:self.headImageView];
        
        [_headImageView release];
        
        
        
        self.grayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (485*HEIGHT)/667, WIDTH, (217*HEIGHT)/667)];
        
        self.grayLabel.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
        
        [self.contentView addSubview:self.grayLabel];
        
        [_grayLabel release];
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((60*WIDTH)/375, (485*HEIGHT)/667, (290*WIDTH)/375, (70*HEIGHT)/667)];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        
        [self.contentView addSubview:self.titleLabel];
        
        [_titleLabel release];
        
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake((60*WIDTH)/375, (530*HEIGHT)/667, (300*WIDTH)/375, (50*HEIGHT)/667)];
        
        self.contentLabel.backgroundColor = [UIColor clearColor];
        
        self.contentLabel.tintColor = [UIColor blackColor];
        
        self.contentLabel.font = [UIFont boldSystemFontOfSize:13];
        
        self.contentLabel.numberOfLines = 2;
        
        [self.contentView addSubview:self.contentLabel];
        
        [_contentLabel release];
        
        self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (510*HEIGHT)/667, (40*WIDTH)/375, (20*HEIGHT)/667)];
        
        self.dateLabel.font = [UIFont boldSystemFontOfSize:14];
        
        self.dateLabel.numberOfLines = 1;
        
        [self.contentView addSubview:self.dateLabel];
        
        [_dateLabel release];
        
        self.date1Label = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (530*HEIGHT)/667, (80*WIDTH)/667, (20*HEIGHT)/667)];
        
        self.date1Label.font = [UIFont boldSystemFontOfSize:14];
        
        self.date1Label.numberOfLines = 1;
        
        [self.contentView addSubview:self.date1Label];
        
        [_date1Label release];
        
        @weakify(self);
        [self addColorChangedBlock:^{
            @strongify(self);
            
        
            self.contentView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
            
            self.titleLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

            self.contentLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

            self.grayLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

            self.dateLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

            self.dateLabel.normalBackgroundColor = [UIColor whiteColor];
            
            self.brandLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

            self.date1Label.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

            self.date1Label.normalBackgroundColor = [UIColor whiteColor];
            
            self.titleLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

            self.grayLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

            self.date1Label.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

            self.dateLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

            self.contentLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];

            
        }];

    }
    



}
-(void)setModel:(BrandModel *)model
{

    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
        
    }

    
  
        NSURL *url = [NSURL URLWithString:self.model.cover_landscape];
    
        [self.headImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
//    TitleLogo@2x~iphone.png
    
//    [self.headImageView sd_setImageWithURL:url placeholderImage:self.imagebo];
    
        self.titleLabel.text = self.model.title;
        
        self.contentLabel.text = self.model.summary;
        
        NSString *str =self.model.pubdate;
        
        NSArray *array = [str componentsSeparatedByString:@","];
        
        NSString *str1 = [array objectAtIndex:0];
        
        NSArray *array1 = [str1 componentsSeparatedByString:@" "];
        
        NSString *headStr = [array1 objectAtIndex:1];
        
        NSString *footStr = [array1 objectAtIndex:0];
        
        self.dateLabel.text = headStr;
        
        self.date1Label.text =footStr;

    

}

@end
