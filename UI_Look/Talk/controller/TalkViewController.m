//
//  TalkViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/16.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "TalkViewController.h"
#import "TalkTableViewCell.h"
#import "AppTools.h"
#import "TalkModel.h"
#import "UIImageView+WebCache.h"
#import "TalkDetailViewController.h"
#import "MJRefresh.h"

@interface TalkViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *myTableView;

@end

@implementation TalkViewController
- (void)dealloc
{
    [_bigArray release];
    [_keysArray release];
    [_headArray release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self showTabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"iLoveNEWS";
    
//    创建tableView
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, (603*HEIGHT)/667) style:UITableViewStyleGrouped];
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    
    self.myTableView.delegate = self;
    
    self.myTableView.dataSource =self;
    
//    轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    self.myTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, (190*HEIGHT)/667)];
    
    [self.myTableView.tableHeaderView addGestureRecognizer:tap];
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    
    [self.myTableView registerClass:[TalkTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.myTableView];
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.bigArray = [NSMutableArray array];
    
    self.keysArray = [NSMutableArray array];
    
    self.headArray = [NSMutableArray array];

    self.allArray = [NSMutableArray array];
    
    self.i = 1;
    
    [self addFooterRefresh];
    
    [self addHeaderRefresh];

    [tap release];
    
}
-(void)addHeaderRefresh
    {
        //当下拉时候会触发该方法
        [self.myTableView addHeaderWithCallback:^{
            
            NSLog(@"下拉");
            
            self.i = 1;
            //        重新请求数据
            [self getAFNetWorkingData];
            
            
        }];
        [self.myTableView headerBeginRefreshing];
        
    }
    
-(void)addFooterRefresh
    {
        //当上拉时候触发该方法
        [self.myTableView addFooterWithCallback:^{
            
            NSLog(@"上拉");
            
            self.i++;
            
            [self getAFNetWorkingData];
            
            
        }];
        
        
        
    }

-(void)getAFNetWorkingData{
   
    NSString *urlStr = [NSString stringWithFormat:@"http:watch-cdn.idailywatch.com/api/list/magazine/zh-hans?page=%ld&ver=iphone&app_ver=10",self.i];
    
    if (self.i == 1) {
        
        [AppTools getLocalDataWithURL:urlStr Block:^(id result) {
            
            [self.keysArray removeAllObjects];
            
            [self.headArray removeAllObjects];
            
            self.bigArray = result;
            
            for (NSMutableDictionary *dic in self.bigArray) {
                
                    TalkModel *model = [[TalkModel alloc]init];
                
                    [model setValuesForKeysWithDictionary:dic];
                
                if (model.guid != 14373 &&![model.cat isEqualToString:@"more"]) {
                    
                    [self.keysArray addObject:model];
                    
                    [model release];
                    
                }
                else {
                    
                    [self.headArray addObject:model];
                    
                    [model release];
                    
                    
                }
                
                    [self.allArray addObject:model];
                
                
            }
            
            TalkModel *model = [self.headArray objectAtIndex:0];
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((90*WIDTH)/375, 0, (220*WIDTH)/375, (190*HEIGHT)/667)];
            NSURL *url = [NSURL URLWithString:model.cover_thumb];
            
            [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"300-300@2x.png"]];
            
            self.myTableView.tableHeaderView.backgroundColor = [UIColor blackColor];
            
            [self.myTableView.tableHeaderView addSubview:imageView];
            
            [imageView release];

            [self.myTableView reloadData];
            
            [self.myTableView headerEndRefreshing];
            
            [self.myTableView footerEndRefreshing];

            

            
            
        }];
        
    }else
    {
    
        [AppTools getLocalDataWithURL:urlStr Block:^(id result) {
            
            self.bigArray = result;
            
            for (NSMutableDictionary *dic in self.bigArray) {
                
                TalkModel *model = [[TalkModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                if (model.guid != 14373 &&![model.cat isEqualToString:@"more"]) {
                    
                    [self.keysArray addObject:model];
                    
                    [model release];
                    
                }
                else {
                    
                    [self.headArray addObject:model];
                    
                    [model release];
                    
                }
                
                    [self.allArray addObject:model];
                
                
            }

            [self.myTableView reloadData];
            
            [self.myTableView headerEndRefreshing];
            
            [self.myTableView footerEndRefreshing];
            

        }];
    }
}

-(void)showTabBar

{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}

-(void)tapAction:(UITapGestureRecognizer *)tap
{

//    TalkDetailViewController *detailVC =[[TalkDetailViewController alloc]init];
//    
//    TalkModel *model = [self.headArray objectAtIndex:0];
//    
//    detailVC.model = model;
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
//    


}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
    
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.keysArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   static NSString *cellIdentifier = @"cell";
    
    TalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    TalkModel *model = [self.keysArray objectAtIndex:indexPath.row];
    
    cell.model = model;
    
    return cell;
    


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    TalkModel *model = [self.keysArray objectAtIndex:indexPath.row];
//    
//    TalkDetailViewController *detailVC = [[TalkDetailViewController alloc]init];
//    
//    detailVC.model = model;
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 120;

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
