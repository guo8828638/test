//
//  FriendshipDetailViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/28.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipDetailViewController.h"
#import "AppTools.h"
#import "FriendshipDetailTwoModel.h"
#import "FriendshipDetailBigModel.h"
#import "FriendshipDetailHeadTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DKNightVersion.h"

@interface FriendshipDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)UITableView *myTableView;
@end

@implementation FriendshipDetailViewController
- (void)dealloc
{
    [_model release];
    [_backImageView release];
    [_leftLabel release];
    [_rightLabel release];
    [_editLabel release];
    [_peopleLabel release];
    [_SBImageView release];
    [_SBlabel release];
    [_dateLabel release];
    [_contentLabel release];
    [_backLabel release];
    [_kbnrLabel release];
    [_sepLabel release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.ID = self.model.ID;
    
    self.bigArray = [NSMutableArray array];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    self.myTableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    
    self.myTableView.delegate = self;
    
    self.myTableView.dataSource = self;
    
    self.myTableView.contentInset = UIEdgeInsetsMake(200*WIDTH/375, 0, 0, 0);
        
    [self.view addSubview:self.myTableView];
    
    self.myTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 280*HEIGHT/667)];
    
    self.myTableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    
    
    self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -200*HEIGHT/667, WIDTH, 200*HEIGHT/667)];

    self.backImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.myTableView.tableHeaderView addSubview:self.backImageView];
    
    
    
    self.backLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -8*HEIGHT/667, WIDTH, 50*HEIGHT/667)];
    
    self.backLabel.backgroundColor = [UIColor blackColor];
    
    self.backLabel.alpha = 0.5;
    
    [self.myTableView.tableHeaderView addSubview:self.backLabel];
    
   
    
    self.leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 0, 80*WIDTH/375, 20*HEIGHT/667)];
    
    self.leftLabel.backgroundColor = [UIColor clearColor];
    
    self.leftLabel.font = [UIFont boldSystemFontOfSize:15];
    
    self.leftLabel.textColor = [UIColor whiteColor];
    
    [self.myTableView.tableHeaderView addSubview:self.leftLabel];
    
  
    
    self.rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(90*WIDTH/375, 0, 200*WIDTH/375, 20*HEIGHT/667)];
    
    self.rightLabel.backgroundColor = [UIColor clearColor];
    
    self.rightLabel.textColor = [UIColor whiteColor];

    self.rightLabel.font = [UIFont boldSystemFontOfSize:15];
    
    [self.myTableView.tableHeaderView addSubview:self.rightLabel];
    
    

    self.editLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 20*HEIGHT/667, 100*WIDTH/375, 20*HEIGHT/667)];
    
    self.editLabel.font = [UIFont boldSystemFontOfSize:12];
    
    self.editLabel.textColor = [UIColor whiteColor];

    self.editLabel.backgroundColor = [UIColor clearColor];
    
    [self.myTableView.tableHeaderView addSubview:self.editLabel];
    
    
    
    self.peopleLabel = [[UILabel alloc]initWithFrame:CGRectMake(110*WIDTH/375, 20*HEIGHT/667, 120*WIDTH/375, 20*HEIGHT/667)];
    
    self.peopleLabel.backgroundColor = [UIColor clearColor];
    
    self.peopleLabel.font = [UIFont boldSystemFontOfSize:12];
    
    self.peopleLabel.textColor = [UIColor whiteColor];
    
    [self.myTableView.tableHeaderView addSubview:self.peopleLabel];
    
    
    
    self.kbnrLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40*HEIGHT/667, WIDTH, 20*HEIGHT/667)];
    
    self.kbnrLabel.backgroundColor = [UIColor grayColor];
    
    self.kbnrLabel.alpha = 0.8;
    
    self.kbnrLabel.text = @"   快报内容";
    
    self.kbnrLabel.font = [UIFont boldSystemFontOfSize:12];
    
    [self.myTableView.tableHeaderView addSubview:self.kbnrLabel];
    
  
    
    self.SBImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH/375, 70*HEIGHT/667, 50*WIDTH/375, 50*HEIGHT/667)];
    
    [self.myTableView.tableHeaderView addSubview: self.SBImageView];
    
 
    
    self.SBlabel = [[UILabel alloc]initWithFrame:CGRectMake(75*WIDTH/375, 75*HEIGHT/667, 100*WIDTH/375, 15*HEIGHT/667)];
    
    [self.myTableView.tableHeaderView addSubview: self.SBlabel];
    
    self.SBlabel.font = [UIFont boldSystemFontOfSize:14];
    
    self.SBlabel.textColor = [UIColor blackColor];
    
    [_SBlabel release];
    
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(75*WIDTH/375, 100*HEIGHT/667, 100*WIDTH/375, 10*HEIGHT/667)];
    
    [self.myTableView.tableHeaderView addSubview: self.dateLabel];
    
    self.dateLabel.font = [UIFont boldSystemFontOfSize:12];
    
    self.dateLabel.textColor = [UIColor lightGrayColor];
    
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 120*HEIGHT/667, 355*WIDTH/375, 150*HEIGHT/667)];
    
    self.contentLabel.backgroundColor = [UIColor whiteColor];
    
    self.contentLabel.numberOfLines = 0;
    
    [self.myTableView.tableHeaderView addSubview: self.contentLabel];
    
    UIButton *buttonTop = [UIButton buttonWithType:UIButtonTypeCustom];
    
    buttonTop.frame = CGRectMake(345*WIDTH/375, 577*HEIGHT/667, 20*WIDTH/375, 30*HEIGHT/667);
    
    [buttonTop addTarget:self action:@selector(buttonTopAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonTop setBackgroundImage:[UIImage imageNamed:@"iconfont-fanhuidingbu(1).png"] forState:UIControlStateNormal];
    
    buttonTop.titleLabel.text = @"返回顶部";
    
    buttonTop.titleLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:buttonTop];

    
   
    self.sepLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 260*HEIGHT/667, WIDTH, 20*HEIGHT/667)];
    
    self.sepLabel.backgroundColor = [UIColor grayColor];
    
    self.sepLabel.alpha = 0.8;
    
    [self.myTableView.tableHeaderView addSubview: self.sepLabel];
    

    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.leftLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.rightLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.editLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.myTableView.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.view.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.peopleLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.SBlabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.dateLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.contentLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.backLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.kbnrLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.sepLabel.nightBackgroundColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.leftLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.rightLabel.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.editLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.peopleLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.SBlabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.dateLabel.nightTextColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.contentLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        self.backLabel.nightTextColor =  [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.kbnrLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        
        self.sepLabel.nightTextColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha: 1.000];
        
        
        self.dateLabel.normalBackgroundColor = [UIColor clearColor];
        
    }];

    
   
     NSString *url = [NSString stringWithFormat:@"http://cont.app.autohome.com.cn/autov5.0.0/content/News/fastnewscontent-n%@-lastid0-o1.json", self.ID];
    
    [AppTools getLocalDataWithURL:url Block:^(id result) {
        
        NSMutableDictionary *bigDic = result;
        
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        
        NSMutableDictionary *newsdataDic = [resultDic objectForKey:@"newsdata"];
        
        FriendshipDetailTwoModel *headmodel = [[FriendshipDetailTwoModel alloc]init];
        
        [headmodel setValuesForKeysWithDictionary:newsdataDic];
        
         NSURL *url = [NSURL URLWithString:headmodel.img];
        
        [self.backImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        
        self.leftLabel.text = headmodel.newstypeanme;
        
        self.rightLabel.text = headmodel.title;
        
        NSString *str1 = [NSString stringWithFormat:@"编辑: %@",headmodel.newsauthor];
        
        self.editLabel.text = str1;
        
        NSString *str2 = [NSString stringWithFormat:@"%ld位观众",headmodel.reviewcount];
        
        self.peopleLabel.text = str2;
        
        NSURL *urlSB = [NSURL URLWithString:headmodel.headimg];

        [self.SBImageView sd_setImageWithURL:urlSB placeholderImage:[UIImage imageNamed:@""]];
        
        self.SBlabel.text = headmodel.newsauthor;
        
        self.dateLabel.text = headmodel.createtime;
        
        self.contentLabel.text = headmodel.summary;
        
        NSMutableArray *messagelistArray = [resultDic objectForKey:@"messagelist"];
        
        for (NSMutableDictionary *dic in messagelistArray) {
            
            FriendshipDetailBigModel *bigModel = [[FriendshipDetailBigModel alloc]init];
            
            [bigModel setValuesForKeysWithDictionary:dic];
            
            [self.bigArray addObject:bigModel];
            
            [bigModel release];
            
            
        }

        [_myTableView reloadData];
        

        
    }];
    
    

    [_sepLabel release];
    [_contentLabel release];
    [_dateLabel release];
    [_SBImageView release];
    [_kbnrLabel release];
    [_leftLabel release];
    [_editLabel release];
    [_rightLabel release];
    [_backLabel release];
    [_leftLabel release];
    [_myTableView release];
    
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.frame = CGRectMake(10*WIDTH/375, 30*HEIGHT/667, 40*WIDTH/375, 20*HEIGHT/667);
    
    backButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    
    backButton.backgroundColor = [UIColor clearColor];
    
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];

    

    
}

-(void)buttonTopAction:(UIButton *)btn
{

    self.myTableView.contentOffset = CGPointMake(0, 0);

    
}


-(void)backButtonAction:(UIButton *)btn
{

    
    [self.navigationController popViewControllerAnimated:YES];


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    FriendshipDetailBigModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
   CGFloat height = [FriendshipDetailHeadTableViewCell heightForContent:model.content];
    
    return (70+height+80+model.attachments.count*350)*HEIGHT/667;
    
    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.bigArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    FriendshipDetailHeadTableViewCell *cell = [[[FriendshipDetailHeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]autorelease];
    
    FriendshipDetailBigModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    return cell;



}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat y = scrollView.contentOffset.y;
    
    if (y < -200*HEIGHT/667) {
        
        CGRect frame = self.backImageView.frame;
        
        frame.origin.y = y;
        
        frame.size.height = -y;
        
        self.backImageView.frame =frame;
                
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
