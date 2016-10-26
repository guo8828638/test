//
//  SecondViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SecondViewController.h"
#import "AppTools.h"
#import "SecondModel.h"
#import "SecondTableViewCell.h"
#import "SecondDetailViewController.h"
#import "DKNightVersion.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic,retain)UITableView *myTableView;


@end

@implementation SecondViewController
- (void)dealloc
{
    
    [_bigDic release];
    [_bigArray release];
    [_keysArray release];
    [_sectionArray release];
    [_arrayRow release];
    [_importantKey release];
    [_searchArray release];
    [_mySearchBar release];
    [super dealloc];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.myTableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.searchArray = [NSMutableArray array];
    
    self.mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, WIDTH, (40*HEIGHT)/667)];
    
    self.mySearchBar.translucent = NO;
    
    self.mySearchBar.delegate = self;
    
    [self.mySearchBar setBackgroundColor:[UIColor clearColor]];
    
    [self.mySearchBar sizeToFit];
    
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
    
    [self.searchDC.searchResultsTableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"search"];
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0*HEIGHT/667, WIDTH, (603*HEIGHT)/667) style:UITableViewStylePlain];
    
    self.myTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40*HEIGHT/667)];
    self.myTableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    
    self.myTableView.delegate = self;
    
    self.myTableView.dataSource =self;
    
    self.myTableView.sectionIndexBackgroundColor = [UIColor clearColor];
    
    [self.myTableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    
//    [self setExtendedLayoutIncludesOpaqueBars:YES];
    
    
    self.bigDic = [NSMutableDictionary dictionary];
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.bigArray = [NSMutableArray array];
    
    NSString *urlStr = @"http://www.xbiao.com/app/brandlist";
    
    [AppTools getLocalDataWithURL:urlStr Block:^(id result) {
        
        NSMutableDictionary *dic = result;
        
        self.bigArray = dic.allKeys;
        
        for (int i =0; i< self.bigArray.count; i++) {
            
            self.sectionArray = [NSMutableArray array];
            
            for (NSMutableDictionary *keyDic in [dic objectForKey:self.bigArray[i]]) {
                
                SecondModel *model = [[SecondModel alloc]init];
                
                [model setValuesForKeysWithDictionary:keyDic];
                
                [self.sectionArray addObject:model];
                
                [model release];
                
                
                
            }
            
            [self.bigDic setValue:self.sectionArray forKey:self.bigArray[i]];
            
            
            
        }
        
        self.keysArray = [NSMutableArray arrayWithArray:self.bigDic.allKeys];
        
        [self.keysArray sortUsingSelector:@selector(compare:)];
        
        [self.myTableView reloadData];
        
    }];
    
    
    
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        

    }];
    
    [self.myTableView.tableHeaderView addSubview:self.mySearchBar];
    
    [self.view addSubview:self.myTableView];

    [_myTableView release];
    

    
    
}


////搜索框
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"输入框中的内容=====%@",searchText);
    
    [self.searchArray removeAllObjects];
    self.importantKey = searchText;
    for (NSString *key in self.keysArray) {
        NSMutableArray *array = [self.bigDic objectForKey:key];
        for (SecondModel *model in array) {
            //rangeOfString:方法是在movieName中搜索是否包含searchText
            //rangeOfString 前面的参数是要被搜索的字符串，后面的是要搜索的字符
            //NSNotFound 表示请求操作的某个内容没有发现
            
            if ([model.name rangeOfString:searchText].location != NSNotFound) {
                [self.searchArray addObject:model];
            }
        }
    }
   
}



-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.mySearchBar.showsCancelButton = YES;
    
    for (UIView *view in [[self.mySearchBar.subviews lastObject]subviews]) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton *btn = (UIButton *)view;
            
            [btn setTitle:@"ddd" forState:UIControlStateNormal];
            
            [btn setImage:[[UIImage imageNamed:@"iconfont-fanhui.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] forState:UIControlStateNormal];
            
            
        }
        
//        if ([view isKindOfClass:[UIView class]]) {
//            
//            UIView *views = (UIView *)view;
//            
//            views.backgroundColor = [UIColor whiteColor];
//            
//        }
//        
    }



}



-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
    
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}


-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return nil;
    }else
    {
    
    
    return self.keysArray;
        
    }
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return 1;
    }
    else
    {
    return self.keysArray.count;
        
    }
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return self.searchArray.count;
        
    }
    else
    {
    
        NSString *str = [self.keysArray objectAtIndex:section];
        
        NSMutableArray *array = [self.bigDic objectForKey:str];
        
        return array.count;
    }
 
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        static NSString *cellIdentifier = @"search";
        
        SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        SecondModel *model = [self.searchArray objectAtIndex:indexPath.row];
        
        cell.importantKey = self.importantKey;
        
        cell.model = model;
        
        return cell;
        
    }
    
    
    else{
        
    static NSString *cellIdentifier = @"cell";
        
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *key = [self.keysArray objectAtIndex:indexPath.section];
        
    self.arrayRow = [self.bigDic objectForKey:key];

    SecondModel *model = [self.arrayRow objectAtIndex:indexPath.row];
        
    cell.model = model;
        
  
    return cell;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{
    self.searchDC.active = NO;
    NSLog(@" 00000");
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return (20*HEIGHT)/667;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    else
    {
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (100*WIDTH)/375, (20*HEIGHT)/667)];
    label.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    
    NSString *str = [self.keysArray objectAtIndex:section];
    
    NSString *strText = [NSString stringWithFormat:@"    %@",str];
    
    label.text = strText;
    
    return label;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return (100*HEIGHT)/667;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        
//        SecondDetailViewController  *secondDetail = [[SecondDetailViewController alloc]init];
//        
//        SecondModel *model = [self.searchArray objectAtIndex:indexPath.row];
//        
//        secondDetail.model = model;
//        
//        [self.navigationController pushViewController:secondDetail animated:YES];

    
    }
    else
    {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    SecondDetailViewController  *secondDetail = [[SecondDetailViewController alloc]init];
//
//    NSString *key = [self.keysArray objectAtIndex:indexPath.section];
//    
//    self.arrayRow = [self.bigDic objectForKey:key];
//    
//    SecondModel *model = [self.arrayRow objectAtIndex:indexPath.row];
//    
//    secondDetail.model = model;
//    
//    [self.navigationController pushViewController:secondDetail animated:YES];
    
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
