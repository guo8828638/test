//
//  FriendshipDetailHeadTableViewCell.m
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipDetailHeadTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "FriendshipDetailModel.h"

@implementation FriendshipDetailHeadTableViewCell
- (void)dealloc
{
    [_model release];
    [_leftImageView release];
    [_authorLabel release];
    [_dateLabel release];
    [_contentLabel release];
    [_brotherImageView release];
    [_allArray release];
    [_bigArray release];
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

    
    self.bigArray = [NSMutableArray array];
    
    self.allArray = [NSMutableArray array];
    
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH/375, 10*HEIGHT/667, 50*WIDTH/375, 50*HEIGHT/667)];
    
    [self.contentView addSubview:self.leftImageView];
    
    [_leftImageView release];
    
    
    self.authorLabel = [[UILabel alloc]initWithFrame:CGRectMake(70*WIDTH/375, 15*HEIGHT/667, 100*WIDTH/375,15*HEIGHT/667)];
    
    self.authorLabel.backgroundColor = [UIColor whiteColor];
    
    self.authorLabel.font = [UIFont boldSystemFontOfSize:13];
    
    [self.contentView addSubview:self.authorLabel];
    
    [_authorLabel release];
    
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(70*WIDTH/375, 40*HEIGHT/667, 100*WIDTH/375, 15*HEIGHT/667)];
    
    self.dateLabel.textColor = [UIColor blackColor];
    
    self.dateLabel.font = [UIFont boldSystemFontOfSize:11];
    
    [self.contentView addSubview:self.dateLabel];
    
    [_dateLabel release];
    
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 70*HEIGHT/667, 355*WIDTH/375, 1000*HEIGHT/667)];
    
    self.contentLabel.numberOfLines = 0;
    
    [_contentLabel release];
    
    
}
-(void)setModel:(FriendshipDetailBigModel *)model
{
    
    
    
    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
        
    }
    
    self.authorLabel.text = self.model.authorname;
    
    self.dateLabel.text = self.model.publishtime;
    
    self.contentLabel.text = self.model.content;
    
    CGFloat heights = [FriendshipDetailHeadTableViewCell heightForContent:self.model.content];
    
//    *** 不能直接点 因为只读 所以需要重写
    CGRect frame = self.contentLabel.frame;
    
    frame.size.height= heights;
    
    self.contentLabel.frame = frame;
    
    [self.contentLabel sizeToFit];
    
    [self.contentView addSubview:self.contentLabel];

    NSURL *url = [NSURL URLWithString:self.model.headimg];
    
    [self.leftImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
    
    for (int i = 0; i<self.model.attachments.count; i++)
        
    {
        
        self.brotherImageView = [[UIImageView alloc]initWithFrame:CGRectMake(18*WIDTH/667, (80+self.contentLabel.frame.size.height+350*i)*HEIGHT/667, 355*WIDTH/375, 350*HEIGHT/667)];
        
        [self.contentView addSubview:self.brotherImageView];
        
        [self.allArray addObject:self.brotherImageView];
        
        [_brotherImageView release];

        
        
        
    }
    
    

    for (FriendshipDetailModel *model in self.model.attachments) {
        
        [self.bigArray addObject:model];
        
        
    }
    
    
    

    for (int i = 0; i<self.bigArray.count; i++) {
        
        FriendshipDetailModel *mod = self.bigArray[i];
        
        NSString *str = mod.picurl;
        
        NSURL *urlB = [NSURL URLWithString:str];
        
       [self.allArray[i] sd_setImageWithURL:urlB placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
        

        
   }
    
    
    


}
+ (CGFloat)heightForContent:(NSString *)content{
    CGSize size = CGSizeMake(365*WIDTH/375, 10000*HEIGHT/667);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil];
    CGRect frame = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return frame.size.height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
