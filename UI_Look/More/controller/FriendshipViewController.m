//
//  FriendshipViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FriendshipViewController.h"
#import "DKNightVersion.h"
#import "FriendshipTableViewCell.h"
#import "AppTools.h"
#import "MJRefresh.h"
#import "FriendshipModel.h"
#import "FriendshipDetailViewController.h"
@interface FriendshipViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *myTableView;

@end

@implementation FriendshipViewController
- (void)dealloc
{
    [_myTableView release];
    [_lastId release];
    [_bigArray release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{

    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"玩车";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    
    self.myTableView.delegate = self;
    
    self.myTableView.dataSource = self;
    
    [self.myTableView registerClass:[FriendshipTableViewCell class] forCellReuseIdentifier:@"one"];
    
    [self.view addSubview:self.myTableView];
    
    self.bigArray = [NSMutableArray array];

    self.upLoading = NO;
    
    [self addFooterRefresh];
    
    [self addHeaderRefresh];

    [_myTableView release];
    

    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.myTableView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
    
    }];
    
}
-(void)addHeaderRefresh
{
//    __block FriendshipViewController *vc = self;
    //当下拉时候会触发该方法
    [self.myTableView addHeaderWithCallback:^{
        
        NSLog(@"下拉");
        
        self.lastId = @"0";
        
        self.pageNum = 0;
        
        self.upLoading = NO;
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
        
        self.pageNum++;
        
        self.upLoading = YES;

        [self getAFNetWorkingData];
        
        
    }];
    
    
    
}
-(void)getAFNetWorkingData{
 
    
    NSString *tableviewUrl = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/fastnewslist-pm1-b0-l0-s20-lastid%@.json",self.lastId];
    
    [AppTools getLocalDataWithURL:tableviewUrl Block:^(id result) {
        
        NSMutableDictionary *bigDic = result;
        
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        
        NSMutableArray *listArray = [resultDic objectForKey:@"list"];
        
        if (self.upLoading ==NO) {
            
            [self.bigArray removeAllObjects];
            
            
        }

        
        for (NSMutableDictionary *dic in listArray) {
            
            FriendshipModel *model = [[FriendshipModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.bigArray addObject:model];
            
            self.lastId = model.lastid;
          
            [model release];
            
            
        }
        
        
        [self.myTableView reloadData];
        
        [self.myTableView headerEndRefreshing];
        
        [self.myTableView footerEndRefreshing];
        
        
    }];
    
   
    
    
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

    static NSString *cellIdentifier = @"one";
    
    FriendshipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    FriendshipModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    cell.model= model;
    
    return cell;
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 270*HEIGHT/667;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FriendshipModel *model = [self.bigArray objectAtIndex:indexPath.row];
    
    FriendshipDetailViewController *VC = [[FriendshipDetailViewController alloc]init];
    
    VC.model = model;
    
    [self.navigationController pushViewController:VC animated:YES];
    

}
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    
    self.tabBarController.tabBar.hidden = YES;
    
}


-(void)leftButtonAction:(UIBarButtonItem *)btn
{

    [self.navigationController popViewControllerAnimated:YES];

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
