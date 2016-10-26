//
//  BrandTwoViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BrandTwoViewController.h"
#import "BrandTwoCollectionViewCell.h"
#import "AppTools.h"
#import "BrandModel.h"
#import "BrandDetailViewController.h"
#import "DKNightVersion.h"

@interface BrandTwoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation BrandTwoViewController
- (void)dealloc
{
    [_allArray release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //    设置每个item的大小
    flowLayout.itemSize = CGSizeMake((172.5*WIDTH)/375, (180*HEIGHT)/667);
    //    最小行间距
    flowLayout.minimumLineSpacing = (30*WIDTH)/375;
    
    //    最小列间距
    flowLayout.minimumInteritemSpacing =(2*HEIGHT)/667;
    
    //    设置item与四周边界的距离，上左下右
    flowLayout.sectionInset = UIEdgeInsetsMake((10*WIDTH)/375, (10*HEIGHT)/667, (10*WIDTH)/375, (10*HEIGHT)/667);
    
    //    设置滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    ////    设置头部区域大小
    //
    //    flowLayout.headerReferenceSize = CGSizeMake(200, 100);
    //
    ////    设置底部区域
    //
    //    flowLayout.footerReferenceSize =CGSizeMake(50, 200);
    ////看是怎么滑动的 横着划 前面的坐标有用
    
    
    
    UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:[[UIScreen mainScreen]bounds] collectionViewLayout:flowLayout];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.view addSubview: collectionView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    collectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:0.8];
    
    [collectionView release];
    
//    隐藏滑动条
    [collectionView setShowsVerticalScrollIndicator:NO];
    
    collectionView.delegate = self;
    
    collectionView.dataSource = self;
    
    
    
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        collectionView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.view.normalBackgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        
    }];
    
    
    //    注册cell
    
    [collectionView registerClass:[BrandTwoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    NSString *str = @"http://watch-cdn.idailywatch.com/api/list/cover/zh-hans?page=1&ver=iphone&app_ver=10";
    
    self.allArray = [NSMutableArray array];
    
    [AppTools getLocalDataWithURL:str Block:^(id result) {
        
        NSMutableArray *bigArray = result;
        
        for (NSMutableDictionary *dic in bigArray) {
            
            BrandModel *model = [[BrandModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
                
            [self.allArray addObject:model];
                
            [model release];
                
            
        }

        [collectionView reloadData];
        
        
    }];
    
    
}
-(void)leftButtonAction:(UIBarButtonItem *)btn
{
    [self.navigationController popViewControllerAnimated:YES];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{


    return self.allArray.count;


}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"cell";
    
    BrandTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    BrandModel *model = [self.allArray objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

//    BrandDetailViewController *detailVC = [[BrandDetailViewController alloc]init];
//    
//    BrandModel *model = [self.allArray objectAtIndex:indexPath.item];
//    
//    detailVC.model = model;
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
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
