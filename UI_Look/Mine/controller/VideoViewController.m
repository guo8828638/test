//
//  VideoViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "VideoViewController.h"
#import "AppTools.h"
#import "VideoCollectionViewCell.h"
#import "VideoModel.h"
#import "VideoCollectionReusableView.h"
#import "VideoDetailViewController.h"
#import "MJRefresh.h"
#import "DKNightVersion.h"
#import "TalkDetailViewController.h"


@interface VideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,jumpDelegate>

@property (nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)VideoCollectionReusableView *reView;

@end

@implementation VideoViewController
- (void)dealloc
{
    [_bigArray release];
    [_keysArray release];
    [_collectionView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //    每个section内设置的大小
    
    flowLayout.sectionInset = UIEdgeInsetsMake((10*WIDTH)/375, (10*HEIGHT)/667, (20*WIDTH)/375, (10*HEIGHT)/667);
    
    flowLayout.itemSize = CGSizeMake((172*WIDTH)/375, (178*HEIGHT)/667);
    
    flowLayout.minimumLineSpacing = (30*HEIGHT)/667;
    
    //设置最小列间距
    flowLayout.minimumInteritemSpacing = (20*WIDTH)/375;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
    
    [self.collectionView setShowsVerticalScrollIndicator:NO];

    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
    
    //collectionView 默认背景色为白色
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    [self.view addSubview: self.collectionView];
    
    [ self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell_pe"];
    
    [ self.collectionView registerClass:[VideoCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableView"];
    
    self.navigationItem.title = @"ILoveVIDEOS";
    
    self.keysArray = [NSMutableArray array];
    
    self.i = 1;
    
    self.bigArray = [NSMutableArray array];
    
    [self addFooterRefresh];
    
    [self addHeaderRefresh];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.collectionView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.collectionView.normalBackgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.8];
        
        
        
    }];
    
    [self.collectionView release];
    [flowLayout release];
    
}
-(void)addHeaderRefresh
{
        //当下拉时候会触发该方法
    [self.collectionView addHeaderWithCallback:^{
            
            NSLog(@"下拉");
            self.i = 1;
            //        重新请求数据
            [self getAFNetWorkingData];
            
            
        }];
        [self.collectionView headerBeginRefreshing];
        
    }
    
    -(void)addFooterRefresh
    {
        //当上拉时候触发该方法
        [self.collectionView addFooterWithCallback:^{
            
            NSLog(@"上拉");
            
            self.i++;
            
            [self getAFNetWorkingData];
            
            
        }];
        
        
        
    }
    
    
  
-(void)getAFNetWorkingData{
    
    NSString *brandUrl = [NSString stringWithFormat:@"http://watch-cdn.idailywatch.com/api/list/video/zh-hans?page=%ld&ver=iphone&app_ver=10",self.i];
    
    if (self.i == 1) {
        
        [AppTools getLocalDataWithURL:brandUrl Block:^(id result) {
            
            [self.bigArray removeAllObjects];
            
            [self.keysArray removeAllObjects];
            
            NSMutableArray *poArray = result;
            
            for (NSMutableDictionary *dic in poArray) {
                
                VideoModel *model = [[VideoModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                if (model.guid != 15957) {
                    
                    [self.bigArray addObject:model];
                    
                    [model release];
                    
                    
            }
                
    else
                {
                    
                    [self.keysArray addObject:model];
                    
                    [model release];
                    
                    
                }
                
                
                
            }
            
            
            [ self.collectionView reloadData];
            [self.collectionView headerEndRefreshing];
            [self.collectionView footerEndRefreshing];

            
            
        }];

        
    }else{
    
    [AppTools getLocalDataWithURL:brandUrl Block:^(id result) {
        
        NSMutableArray *poArray = result;
        
        for (NSMutableDictionary *dic in poArray) {
            
          VideoModel *model = [[VideoModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            if (model.guid != 15957) {
                
                [self.bigArray addObject:model];
                
                [model release];
                
            }else
            {
            
                [self.keysArray addObject:model];
                
                [model release];
            
            
            }
            
            
            
        }
        
        
        [self.collectionView reloadData];
        [self.collectionView headerEndRefreshing];
        [self.collectionView footerEndRefreshing];

        
        
    }];
    
    
    }
    
    
    [_reView release];
    
}
-(void)presentToViewController:(VideoModel *)model
{
    
    
    
//    self.detailVC = [[VideoDetailViewController alloc]init];
//    
//    self.detailVC.model = model;
//    
//    [self presentViewController:self.detailVC animated:YES completion:nil];

    
   
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width*WIDTH)/375, (200*HEIGHT)/667);
        
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
       
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        VideoCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionReusableView" forIndexPath:indexPath];
        
        header.jump = self;
        return header;
        
    }
    
    return nil;
}




-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    return self.bigArray.count;
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    static NSString *cellIdentifier = @"CollectionViewCell_pe";
    
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    VideoModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    return cell;
    
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{

    return (5*WIDTH)/375;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    VideoModel *model = [self.bigArray objectAtIndex:indexPath.item];
    
    VideoDetailViewController *detailVC = [[VideoDetailViewController alloc]init];
    
    detailVC.model = model;
    
    [self presentViewController:detailVC animated:YES completion:nil];


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
