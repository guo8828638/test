//
//  VideoCollectionReusableView.m
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "VideoCollectionReusableView.h"
#import "AppTools.h"
#import "VideoModel.h"
#import "UIImageView+WebCache.h"
#import "VideoDetailViewController.h"
@interface VideoCollectionReusableView()


@property (nonatomic,retain)UILabel *label;

@end

@implementation VideoCollectionReusableView
- (void)dealloc
{
    [_headArray release];
    [_backImageView release];
    [super dealloc];
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];

        [self addGestureRecognizer:tap];
        
        self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,200*HEIGHT/667)];
        
        self.backgroundColor = [UIColor blackColor];
        
        [self addSubview:self.backImageView];
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 170*HEIGHT/667, WIDTH, 30*HEIGHT/667)];
        
        self.label.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
        
        self.label.textAlignment = NSTextAlignmentCenter;
        
        self.label.textColor = [UIColor whiteColor];
        
        self.label.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:self.label];

        self.userInteractionEnabled = YES;
        
        NSString *brandUrl = [NSString stringWithFormat:@"http://watch-cdn.idailywatch.com/api/list/video/zh-hans?page=1&ver=iphone&app_ver=10"];
        
        self.headArray = [NSMutableArray array];
        
        [AppTools getLocalDataWithURL:brandUrl Block:^(id result) {
            
            NSMutableArray *bigArray = result;
            
            for (NSMutableDictionary *dic in bigArray) {
                
                VideoModel *model = [[VideoModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                if (model.guid == 15957) {
                    
                    [self.headArray addObject:model];
                    
                    [model release];
                    
                }
                
                
            }
            
            
            VideoModel *model = [self.headArray objectAtIndex:0];
            
            NSURL *url = [NSURL URLWithString:model.cover];
            
            [self.backImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
            
            self.label.text = model.title;
            
        }];  
    }
    return self;
}
-(void)tapAction:(UITapGestureRecognizer *)tap
{

    VideoModel *model1 = [self.headArray objectAtIndex:0];
    
    [self.jump presentToViewController:model1];


}



@end
