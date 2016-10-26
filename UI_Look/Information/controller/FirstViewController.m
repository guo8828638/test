//
//  FirstViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FirstViewController.h"
#import "ZeroTableViewCell.h"
#import "ThreeTableViewCell.h"
#import "MJRefresh.h"
#import "AppTools.h"
#import "FirstModel.h"
#import "FirstDetailViewController.h"
#import "DKNightVersion.h"
#import "FirstThreeViewController.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign)NSInteger i;
@property (nonatomic,retain)UITableView *myTableView;
@end

@implementation FirstViewController
- (void)dealloc
{
    [_myTableView release];
    [_bigArray release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{

    [self addHeaderRefresh];
    
    [self.myTableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.myTableView];
    
    [self.myTableView registerClass:[ZeroTableViewCell class] forCellReuseIdentifier:@"one"];
    
    [self.myTableView registerClass:[ThreeTableViewCell class] forCellReuseIdentifier:@"three"];
    
    self.myTableView.delegate = self;
    
    self.myTableView.dataSource =self;
    
    self.bigArray = [NSMutableArray array];
    
    [self addFooterRefresh];
    
    [self addHeaderRefresh];
    
    self.i = 0;
    
    [_myTableView release];
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.myTableView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.myTableView.normalBackgroundColor = [UIColor whiteColor];
        
      
    }];
    
    
    
}
-(void)addHeaderRefresh
{
    //当下拉时候会触发该方法
    [self.myTableView addHeaderWithCallback:^{
        
        NSLog(@"下拉");
        self.i = 0;
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

-(void)getAFNetWorkingData
{

    NSString *urlStr = [NSString stringWithFormat:@"http:api.watchnews.app887.com/api/Articles.action?keyword=&npc=%ld&opc=20&type=行业资讯&uid=2564",self.i];
    
    
    if (self.i == 0) {
        
//        删除拥有model的array
                
        [AppTools getLocalDataWithURL:urlStr Block:^(id result) {
            
            [self.bigArray removeAllObjects];
            
                NSMutableDictionary *biggestDic = result;
            
                NSMutableDictionary *dic1 = [biggestDic objectForKey:@"root"];
            
                NSMutableArray *array = [dic1 objectForKey:@"list"];
            
                for (NSMutableDictionary *dic3 in array) {
                        
                    FirstModel *model = [[FirstModel alloc]init];
                        
                    [model setValuesForKeysWithDictionary:dic3];
                        
                    [self.bigArray addObject:model];
                    
                    [model release];
                    
                }
                
            
            [self.myTableView reloadData];
            
            [self.myTableView headerEndRefreshing];
            
            [self.myTableView footerEndRefreshing];
            
            
            
            
        }];
        
        
        
    }else
    {
    
       [AppTools getLocalDataWithURL:urlStr Block:^(id result) {
           
           NSMutableDictionary *biggestDic = result;
               
               NSMutableDictionary *dic1 = [biggestDic objectForKey:@"root"];
                   
                   NSMutableArray *array = [dic1 objectForKey:@"list"];
                   
                   for (NSMutableDictionary *dic3 in array) {
                       
                       FirstModel *model = [[FirstModel alloc]init];
                       
                       [model setValuesForKeysWithDictionary:dic3];
                       
                       [self.bigArray addObject:model];
                       
                       [model release];
                       
                       
                       
                   
               }
               
               

           
           
           [self.myTableView reloadData];
           
           [self.myTableView headerEndRefreshing];
           
           [self.myTableView footerEndRefreshing];
           

           

           
       }];
    
    
    

    
}

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

    FirstModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    if (model.TYPESETTING == 0) {
        
        static  NSString *cellIdentifier = @"one";
        
        ZeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        cell.model = model;
        
        return cell;
        
        
    }else{
        
         static  NSString *cellIdentifier = @"three";
        
        ThreeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        cell.model = model;
        
        return cell;
        
    }




}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    FirstModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    if (model.TYPESETTING ==0) {
        
        return (130*HEIGHT)/667;
        
    }else
    {
    
    
        return (150*HEIGHT)/667;
    }
    
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FirstModel *model = [self.bigArray objectAtIndex:indexPath.row];
    
    if (model.TYPESETTING == 0) {
        
        FirstDetailViewController *fdVC = [[FirstDetailViewController alloc]init];
        
        fdVC.model = model;
        
        [self.navigationController pushViewController:fdVC animated:YES];
        
    }else
    {
    
    
        FirstThreeViewController *VC = [[FirstThreeViewController alloc]init];
        
        VC.model = model;
        
        [self presentViewController:VC animated:YES completion:^{
            
            
        }];
        
    
    
    
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
