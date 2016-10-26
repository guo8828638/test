//
//  BrandViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/16.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BrandViewController.h"
#import "AppTools.h"
#import "BrandModel.h"
#import "BrandCollectionViewCell.h"
//#import "BrandCollectionReusableView.h"
#import "ChineseToPinyin.h"
#import "BrandTwoViewController.h"
#import "BrandDetailViewController.h"
#import "DataBaseSingleton.h"
#import "DKNightVersion.h"
@interface BrandViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain)UICollectionView *collectionView;


@end


@implementation BrandViewController

- (void)dealloc
{

    [_headImageView release];
    [_collectionView release];
    [_bigArray release];
    [_headLabel release];
    [super dealloc];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
//    根据单例判断图标
    
    NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"liudongnight"];
    if ([str isEqualToString:@"yes"]) {
        
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"05.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonAction:)];
        
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"04.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
        
        
    }else
    {
    
    
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"iconfont-disorder(3).png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonAction:)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"iconfont-fangwu(1).png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];

    
        
    
    }
    
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
            [defaults setObject:@"no" forKey:@"liudongnight"];

            self.view.backgroundColor = [UIColor blackColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"ILoveBrand";
    
     UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.itemSize = CGSizeMake(WIDTH, HEIGHT);
    
    flowLayout.minimumLineSpacing = 0;
    
    //设置最小列间距
    flowLayout.minimumInteritemSpacing = 0;
    
//    //设置item与四周边界的距离 上左下右
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
     self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
//    按页翻
     self.collectionView.pagingEnabled = YES;
    
     self.collectionView.delegate = self;
    
     self.collectionView.dataSource = self;
    
    //collectionView 默认背景色为白色
     self.collectionView.backgroundColor = [UIColor whiteColor];
    
//    滑动方向  只能横滑
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    [self.view addSubview: self.collectionView];
    
    [[DataBaseSingleton shareDataBase]openDB];
    
    [[DataBaseSingleton shareDataBase]createBrandTable];
    
    NSMutableArray *Array = [[DataBaseSingleton shareDataBase]selectData];
    
    self.bigArray = [NSMutableArray arrayWithArray:Array];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.navigationController.navigationBar.nightBarTintColor =  [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"05.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonAction:)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"04.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
        
        
        
    }];
    

    [self.collectionView registerClass:[BrandCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell_pe"];
    
     NSString *brandUrl = [NSString stringWithFormat:@"http://watch-cdn.idailywatch.com/api/list/cover/zh-hans?page=1&ver=iphone&app_ver=10"];
    self.bigArray = [NSMutableArray array];
    
    [AppTools getLocalDataWithURL:brandUrl Block:^(id result) {
        
       
        NSMutableArray *bigArray = result;
        
        for (NSMutableDictionary *dic in bigArray) {
            
            BrandModel *model = [[BrandModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.bigArray addObject:model];
            
            [[DataBaseSingleton shareDataBase]insertCover_landscape:model.cover_landscape Title:model.title Summary:model.summary Pubdate:model.pubdate Type:model.type Author:model.author Link_share:model.link_share];
            
            [model release];
            
        }
        
        
        [ self.collectionView reloadData];
        
        
    }];
  
}
-(void)rightButtonAction:(UIBarButtonItem *)btn
{
    
    BrandTwoViewController *two = [[BrandTwoViewController alloc]init];
    
    [self.navigationController pushViewController:two animated:YES];

    
}

-(void)leftButtonAction:(UIBarButtonItem *)btn1
{

    self.collectionView.contentSize = CGSizeMake(0, 0);
    
    [self.collectionView reloadData];



}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.bigArray.count;
    

}
//协议方法

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;


}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CollectionViewCell_pe";
    
    BrandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    BrandModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    return cell;


}
//选中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    BrandDetailViewController *detail = [[BrandDetailViewController alloc]init];
//    
//    BrandModel *model = [self.bigArray objectAtIndex:indexPath.item];
//    
//    detail.model = model;
//    
//    [self.navigationController pushViewController:detail animated:YES];
//    



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
