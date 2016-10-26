//
//  RootViewController.m
//  UI_Look
///Users/dllo/Desktop/UIA段/UIA段_精仿腕表之家/UIA段_精仿腕表之家/Resource/EAIntroView-master/EAIntroView.xcodeproj
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "RootViewController.h"
#import "SDCycleScrollView.h"
#import "InfoModel.h"
#import "AppTools.h"
#import "InfoTableViewModel.h"
#import "RootTableViewCell.h"
#import "MJRefresh.h"
#import "InfoDetailViewController.h"
#import "DKNightVersion.h"
#import "UIImageView+WebCache.h"
@interface RootViewController ()<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *infoTableView;

@property(nonatomic,assign)NSInteger i;

@end

@implementation RootViewController
- (void)dealloc
{
    [_imageArray release];
    [_modelArray release];
    [_webView release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"das";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self addHeaderRefresh];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.infoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    
    self.infoTableView.backgroundColor = [UIColor whiteColor];
    
    self.infoTableView.delegate = self;
    
    self.infoTableView.dataSource = self;
    
    [self.infoTableView registerClass:[RootTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.infoTableView.minimumZoomScale = 1;
    
    [self.view addSubview:self.infoTableView];
    
//    头部区域
    self.infoTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, (180*HEIGHT)/667)];
    
    self.infoTableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    self.tableViewModelArray = [NSMutableArray array];
    
    self.modelArray = [NSMutableArray array];
    
    self.i = 0;


    [self addFooterRefresh];
    
    [self addHeaderRefresh];

    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.infoTableView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.infoTableView.normalBackgroundColor = [UIColor whiteColor];
        
        self.infoTableView.tableHeaderView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
      
    }];
    
    [_infoTableView.tableHeaderView release];
    
    [_infoTableView release];
    
}
-(void)addHeaderRefresh
{
    //当下拉时候会触发该方法
    [self.infoTableView addHeaderWithCallback:^{
        
        NSLog(@"下拉");
        self.i = 0;
        //        重新请求数据
        [self getAFNetWorkingData];
        
    }];
    [self.infoTableView headerBeginRefreshing];
    
}

-(void)addFooterRefresh
{
    //当上拉时候触发该方法
    [self.infoTableView addFooterWithCallback:^{
        
        NSLog(@"上拉");
        
        self.i++;
        
        [self getAFNetWorkingData];
        
    }];
}

-(void)getAFNetWorkingData{
    
    NSString *tableviewUrl = [NSString stringWithFormat:@"http://www.xbiao.com/app/articlelist?&pages=%ld&type=1&time=1439802437825",self.i];
    
    if (self.i == 0) {
        
        [AppTools getLocalDataWithURL:tableviewUrl Block:^(id result) {
            
            
                NSMutableArray *tableViewArray = result;
            
            for (NSMutableDictionary *dic in tableViewArray) {
                
                InfoTableViewModel *model = [[InfoTableViewModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.tableViewModelArray addObject:model];
                
                [model release];
                
                
            }
            
            [self.infoTableView reloadData];
            [self.infoTableView headerEndRefreshing];
            [self.infoTableView footerEndRefreshing];
            
            
        }];
    }else
    {
    
    [AppTools getLocalDataWithURL:tableviewUrl Block:^(id result) {
        
       
            NSMutableArray  *tableViewArray = result;
        
        for (NSMutableDictionary *dic in tableViewArray) {
            
            InfoTableViewModel *model = [[InfoTableViewModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.tableViewModelArray addObject:model];
            
            [model release];
            
            
        }
        
        [self.infoTableView reloadData];
        [self.infoTableView headerEndRefreshing];
        [self.infoTableView footerEndRefreshing];

        
    }];
        
    }
    
   
    
//    轮播图
    NSString *urlStr = @"http://www.xbiao.com/app/articleimage";
    
    [AppTools getLocalDataWithURL:urlStr Block:^(id result) {
        
        [self.modelArray removeAllObjects];
        
        NSMutableArray  *imageArray = result;
        
        for (NSMutableDictionary *dic in imageArray) {
            
            InfoModel *infomodel = [[InfoModel alloc]init];
            
            [infomodel setValuesForKeysWithDictionary:dic];
            
            [self.modelArray addObject:infomodel];
            
            [infomodel release];
            
            
        }
        
        InfoModel *infomodelOne = [self.modelArray objectAtIndex:1];
        InfoModel *infomodelTwo = [self.modelArray objectAtIndex:2];
        InfoModel *infomodelThree =[self.modelArray objectAtIndex:3];
        InfoModel *infomodelFour = [self.modelArray objectAtIndex:4];
        
        
        NSString *str1 = infomodelOne.img;
        NSString *str2 = infomodelTwo.img;
        NSString *str3 = infomodelThree.img;
        NSString *str4 = infomodelFour.img;
            
        
        NSString *titleStr1 = infomodelOne.title;
        NSString *titleStr2 = infomodelTwo.title;
        NSString *titleStr3 = infomodelThree.title;
        NSString *titleStr4 = infomodelFour.title;

        
        
        NSArray *imagesURLStrings = @[
                                      str1,
                                      str2,
                                      str3,
                                      str4
                                    
                                      ];
        NSLog(@"%@",str1);
        
        // 情景三：图片配文字
        NSArray *titles = @[titleStr1,
                            titleStr2,
                            titleStr3,
                            titleStr4
                            ];
        
        
        self.imageArray = @[str4,
                            str1,
                            str2,
                            str3,
                            str4,
                            str1];
        
        
        CGFloat w = self.view.bounds.size.width;
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, (w*WIDTH)/375, (180*HEIGHT)/667) imageURLStringsGroup:nil]; // 模拟网络延时情景
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView2.delegate = self;
        cycleScrollView2.titlesGroup = titles;
        cycleScrollView2.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        //    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
        [self.infoTableView.tableHeaderView addSubview:cycleScrollView2];
        
        //             --- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
        });
        
        
        // 清除缓存
        [cycleScrollView2 clearCache];
   
    
    }];
    
}
//- (void)buttonPlay{
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nstimerAct) userInfo:nil repeats:YES];
//}
//
//- (void)nstimerAct{
//    self.cgf += WIDTH;
//    if (self.cgf == WIDTH) {
//        self.cgf += WIDTH;
//    }
//    self.pageC.currentPage = self.cgf / WIDTH - 1;
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        self.downScrollView.contentOffset = CGPointMake(self.cgf, 0);
//    }];
//        if (self.cgf == WIDTH * (self.imageArray.count -1)) {
//            self.downScrollView.contentOffset = CGPointMake(self.cgf, 0);
//            self.cgf = 0;
//            [self.timer invalidate];
//            self.pageC.currentPage = 0;
//            [self buttonPlay];
//        }
//}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if (scrollView.tag == 10001) {
//        if (scrollView.contentOffset.x == (self.imageArray.count -1) * WIDTH) {
//            scrollView.contentOffset = CGPointMake(WIDTH, 0);
//        }
//        if (scrollView.contentOffset.x == 0) {
//            scrollView.contentOffset = CGPointMake((self.imageArray.count-2) * WIDTH, 0);
//        }
//        
//    }
//    self.cgf = self.downScrollView.contentOffset.x;
//    self.pageC.currentPage = scrollView.contentOffset.x / WIDTH - 1;
//    [self buttonPlay];
//}
////手接触屏幕时触发
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [self.timer invalidate];
//}





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewModelArray.count;


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    InfoTableViewModel *inf = [self.tableViewModelArray objectAtIndex:indexPath.row];
    
    cell.model = inf;
    
    return cell;


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{

    return (140*HEIGHT)/667;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    InfoDetailViewController *info = [[InfoDetailViewController alloc]init];
//    
//    InfoTableViewModel *inf = [self.tableViewModelArray objectAtIndex:indexPath.row];
//    
//    info.model = inf;
//    
//    [self.navigationController pushViewController:info animated:YES];




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
