//
//  YKFindCarViewController.m
//  AutocCarApp
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKFindCarViewController.h"
#import "YKFindCarTableViewCell.h"
#import "YKHotTableViewCell.h"
#import "YKZhudaTableViewCell.h"
#import "YKHeadTableViewCell.h"
#import "YKFindCarView.h"
#import "YKCarInfoViewController.h"

@interface YKFindCarViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, YKFindCarViewDelegate, YKHotTableViewCellDelegate>

@property (nonatomic, retain)UITableView *myTableView;

@property (nonatomic, retain)NSMutableArray *allKeysArray;
@property (nonatomic, retain)NSMutableDictionary *listDic;
@property (nonatomic, retain)NSMutableArray *hotArray;
@property (nonatomic, retain)NSMutableArray *zhudaArray;

@property (nonatomic, retain)YKFindCarView *findCarView;

@property (nonatomic, retain)NSMutableDictionary *infoDic;

@end

@implementation YKFindCarViewController

- (void)dealloc{
    [_myTableView release];
    [_allKeysArray release];
    [_listDic release];
    [_hotArray release];
    [_zhudaArray release];
    [_mySearchBar release];
    [_searchDC release];
    [_searchArray release];
    [_findCarView release];
    [_infoDic release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"汽车品牌";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"bar_btn_icon_search@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAct:)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.allKeysArray = [NSMutableArray array];
    self.listDic = [NSMutableDictionary dictionary];
    self.hotArray = [NSMutableArray array];
    self.zhudaArray = [NSMutableArray array];
    self.searchArray = [NSMutableArray array];
    self.infoDic = [NSMutableDictionary dictionary];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.myTableView];
    
    self.mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    self.mySearchBar.delegate = self;
    [self.mySearchBar setPlaceholder:@"搜索品牌"];
    /*
     UISearchDisplayController 是苹果专为 UITableView 搜索封装的一个类。
     里面内置了一个 UITableView 用于显示搜索的结果。它可以和一个需要搜索功能的
     controller关联起来
     */
    self.searchDC = [[UISearchDisplayController alloc] initWithSearchBar:self.mySearchBar contentsController:self];
    self.searchDC.active = NO;
    self.searchDC.searchResultsDataSource = self;
    self.searchDC.searchResultsDelegate = self;
    [self.searchDC.searchResultsTableView registerClass:[YKFindCarTableViewCell class] forCellReuseIdentifier:@"search"];
    self.myTableView.tableHeaderView = self.mySearchBar;
    
    [self.myTableView registerClass:[YKHeadTableViewCell class] forCellReuseIdentifier:@"head"];
    [self.myTableView registerClass:[YKHotTableViewCell class] forCellReuseIdentifier:@"hot"];
    [self.myTableView registerClass:[YKZhudaTableViewCell class] forCellReuseIdentifier:@"zhuda"];
    [self.myTableView registerClass:[YKFindCarTableViewCell class] forCellReuseIdentifier:@"find"];
    
     NSString *url = @"http://app.api.autohome.com.cn/autov5.0.0/2sc/2scbrands-pm2-ts0.json";
    [YKAppTools getDataWithUrlStr:url block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resuluDic = [bigDic objectForKey:@"result"];
        NSMutableArray *array = [resuluDic objectForKey:@"brandlist"];
        for (NSMutableDictionary *dic in array) {
            [self.allKeysArray addObject:[dic objectForKey:@"letter"]];
            
            NSMutableArray *cars = [dic objectForKey:@"list"];
            NSMutableArray *modelArray = [NSMutableArray array];
            for (NSMutableDictionary *modelDic in cars) {
                YKCar *car = [YKCar modelWithDictionary:modelDic];
                [modelArray addObject:car];
            }
            [self.listDic setValue:modelArray forKey:[dic objectForKey:@"letter"]];
        }
        [self.myTableView reloadData];
        
    } error1:^(id result) {
        
        
    }];
    
    NSString *urlStr = @"http://app.api.autohome.com.cn/autov5.0.0/dealer/hotbrands-pm1.json";
    [YKAppTools getDataWithUrlStr:urlStr block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        NSMutableArray *array = [resultDic objectForKey:@"list"];
        
        for (NSMutableDictionary *dic in array) {
            YKCar *car = [YKCar modelWithDictionary:dic];
            [self.hotArray addObject:car];
        }
        [self.myTableView reloadData];
    } error1:^(id result) {
        
        
    }];
    
    NSString *urlStr1 = @"http://ad.app.autohome.com.cn/autov5.0.0/ad/infoad.ashx?appid=2&platform=1&version=5.0.1&networkid=0&adtype=1&provinceid=0&cityid=0&lng=0.0&lat=0.0&pageindex=1&deviceid=a7fb60caea57f5d9c96dd918b13d01e70cde6c86&idfa=415B8C49-140C-4F64-AAD2-08C948427D1E&devicebrand=apple&devicemodel=iPhone";
    [YKAppTools getDataWithUrlStr:urlStr1 block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        NSMutableArray *array = [resultDic objectForKey:@"list"];
        
        for (NSMutableDictionary *dic in array) {
            YKCar *car = [YKCar modelWithDictionary:dic];
            [self.zhudaArray addObject:car];
        }
        [self.myTableView reloadData];
    } error1:^(id result) {
        
        
    }];
    
    self.findCarView = [[YKFindCarView alloc] initWithFrame:CGRectMake(375, 64, 225, 603 - 49)];
    self.findCarView.backgroundColor = [UIColor whiteColor];
    self.findCarView.YKFindViewDelegate = self;
    [self.view addSubview:self.findCarView];
    [_findCarView release];
}

- (void)rightBarButtonItemAct:(UIBarButtonItem *)barButtonItem{

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
    }
    else{
        return 3 + self.allKeysArray.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSLog(@"%ld", self.searchArray.count);
        return self.searchArray.count;
    }
    else{
    
        if (section < 3) {
            return 1;
        }
        else{
            NSString *key = [self.allKeysArray objectAtIndex:section - 3];
            NSMutableArray *array = [self.listDic objectForKey:key];
            return array.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        static NSString *cellIdentifier = @"search";
        YKFindCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        YKCar *car = [self.searchArray objectAtIndex:indexPath.row];
        cell.car = car;
        cell.important = self.important;
        NSLog(@"cell.important = %@", cell.important);
        NSLog(@"走到这里了");
        return cell;
    }
    else{
        if (indexPath.section == 0) {
            static NSString *cellIdentifier = @"head";
            YKHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            return cell;
        }
        else if (indexPath.section == 1) {
            static NSString *cellIdentifier = @"hot";
            YKHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            cell.hotArray = self.hotArray;
            cell.TokyoHotDelegate = self;
            return cell;
        }
        else if (indexPath.section == 2) {
            static NSString *cellIdentifier = @"zhuda";
            YKZhudaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            cell.zhudaArray = self.zhudaArray;
            return cell;
        }
        else {
            static NSString *cellIdentifier = @"find";
            YKFindCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            NSString *key = [self.allKeysArray objectAtIndex:indexPath.section - 3];
            NSMutableArray *array = [self.listDic objectForKey:key];
            YKCar *car = [array objectAtIndex:indexPath.row];
            cell.car = car;
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 0;
    }
    else{
        if (section == 0) {
            return 0;
        }
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 60;
    }
    else{
        if (indexPath.section == 0) {
            return 100;
        }
        if (indexPath.section == 1) {
            return 165;
        }
        if (indexPath.section == 2) {
            return 125;
        }
        return 60;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
        
        UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 50)] autorelease];
        view.backgroundColor = [UIColor whiteColor];
    
        UILabel *labelx = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 15)];
        labelx.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        [view addSubview:labelx];
        [labelx release];
    
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 375, 35)];
        label.backgroundColor = [UIColor whiteColor];
        if (section == 1) {
            label.text = @"热门品牌";
        }
        if (section == 2) {
            label.text = @"主打品牌";
        }
        if (section > 2) {
            NSString *key = [self.allKeysArray objectAtIndex:section - 3];
            label.text = key;
        }
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
        [view addSubview:label];
        [label release];
    
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 49, 355, 1)];
        imageView.image = [UIImage imageNamed:@"spring_line@2x.png"];
        [view addSubview:imageView];
        [imageView release];
    
        return view;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//输入文字就会触发
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"输入框中的内容=====%@",searchText);
    [self.searchArray removeAllObjects];
    for (NSString *key in self.allKeysArray) {
        NSMutableArray *array = [self.listDic objectForKey:key];
        for (YKCar *car in array) {
            //rangeOfString:方法是在movieName中搜索是否包含searchText
            //rangeOfString 前面的参数是要被搜索的字符串，后面的是要搜索的字符
            //NSNotFound 表示请求操作的某个内容没有发现
            if ([car.name rangeOfString:searchText].location != NSNotFound) {
                [self.searchArray addObject:car];
                self.important = searchText;
            }
        }
    }
    NSLog(@"%@", self.searchArray);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
    }
    else {
        if (indexPath.section > 2) {
            [UIView animateWithDuration:0.3 animations:^{
                
                self.findCarView.frame = CGRectMake(150, 64, 225, 603 - 49);
            }];
            self.findCarView.segmentC.selectedSegmentIndex = 0;
            NSString *key = [self.allKeysArray objectAtIndex:indexPath.section - 3];
            NSMutableArray *array = [self.listDic objectForKey:key];
            YKCar *car = [array objectAtIndex:indexPath.row];
            NSString *urlString = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/cars/seriesprice-pm1-b%@-t1.json", car.carId];
            self.findCarView.this = car.carId;
            [YKAppTools getDataWithUrlStr:urlString block:^(id result) {
                NSMutableDictionary *bigDic = result;
                NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
                NSMutableArray *array = [resultDic objectForKey:@"fctlist"];
                [self.infoDic removeAllObjects];
                for (NSMutableDictionary *dic in array) {
                    NSString *name = [dic objectForKey:@"name"];
                    NSMutableArray *carsArray = [NSMutableArray array];
                    NSMutableArray *smallDic = [dic objectForKey:@"serieslist"];
                    for (NSMutableDictionary *small in smallDic) {
                        YKDetailCar *car = [YKDetailCar modelWithDictionary:small];
                        [carsArray addObject:car];
                    }
                    [self.infoDic setValue:carsArray forKey:name];
                }
                self.findCarView.dic = self.infoDic;
            } error1:^(id result) {
                
                
            }];
        }
    }
}

- (void)changeMi:(NSString *)mi{
    NSString *urlString = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/cars/seriesprice-pm1-b%@-t1.json", mi];
    [YKAppTools getDataWithUrlStr:urlString block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        NSMutableArray *array = [resultDic objectForKey:@"fctlist"];
        [self.infoDic removeAllObjects];
        for (NSMutableDictionary *dic in array) {
            NSString *name = [dic objectForKey:@"name"];
            NSMutableArray *carsArray = [NSMutableArray array];
            NSMutableArray *smallDic = [dic objectForKey:@"serieslist"];
            for (NSMutableDictionary *small in smallDic) {
                YKDetailCar *car = [YKDetailCar modelWithDictionary:small];
                [carsArray addObject:car];
            }
            [self.infoDic setValue:carsArray forKey:name];
        }
        self.findCarView.dic = self.infoDic;
    } error1:^(id result) {
        
        
    }];
}

- (void)changeNi:(NSString *)ni{
    NSString *urlString = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/cars/seriesprice-pm1-b%@-t2.json", ni];
    [YKAppTools getDataWithUrlStr:urlString block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        NSMutableArray *array = [resultDic objectForKey:@"fctlist"];
        [self.infoDic removeAllObjects];
        for (NSMutableDictionary *dic in array) {
            NSString *name = [dic objectForKey:@"name"];
            NSMutableArray *carsArray = [NSMutableArray array];
            NSMutableArray *smallDic = [dic objectForKey:@"serieslist"];
            for (NSMutableDictionary *small in smallDic) {
                YKDetailCar *car = [YKDetailCar modelWithDictionary:small];
                [carsArray addObject:car];
            }
            [self.infoDic setValue:carsArray forKey:name];
        }
        self.findCarView.dic = self.infoDic;
    } error1:^(id result) {
        
        
    }];
}

- (void)carInfoGo:(YKDetailCar *)detailCar{
    YKCarInfoViewController *carInfoVC = [[YKCarInfoViewController alloc] init];
    carInfoVC.detailCar = detailCar;
    NSLog(@"%@", detailCar.carId);
    [self.navigationController pushViewController:carInfoVC animated:YES];
    [carInfoVC release];
}

- (void)viewDidAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

- (void)TokyoHot:(NSString *)carId{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.findCarView.frame = CGRectMake(150, 64, 225, 603 - 49);
    }];
    NSString *urlString = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/cars/seriesprice-pm1-b%@-t1.json", carId];
    self.findCarView.this = carId;
    [YKAppTools getDataWithUrlStr:urlString block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        NSMutableArray *array = [resultDic objectForKey:@"fctlist"];
        [self.infoDic removeAllObjects];
        for (NSMutableDictionary *dic in array) {
            NSString *name = [dic objectForKey:@"name"];
            NSMutableArray *carsArray = [NSMutableArray array];
            NSMutableArray *smallDic = [dic objectForKey:@"serieslist"];
            for (NSMutableDictionary *small in smallDic) {
                YKDetailCar *car = [YKDetailCar modelWithDictionary:small];
                [carsArray addObject:car];
            }
            [self.infoDic setValue:carsArray forKey:name];
        }
        self.findCarView.dic = self.infoDic;
    } error1:^(id result) {
        
        
    }];
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
