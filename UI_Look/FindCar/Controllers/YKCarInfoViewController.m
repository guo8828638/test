//
//  YKCarInfoViewController.m
//  AutocCarApp
//
//  Created by dllo on 15/11/26.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKCarInfoViewController.h"
#import "YKBigModel.h"
#import "YKMiddleModel.h"
#import "YKCarInfoDetailTableViewCell.h"

@interface YKCarInfoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)YKBigModel *bigModel;

@property (nonatomic, retain)UIButton *collect;

@end

@implementation YKCarInfoViewController

- (void)dealloc{
    [_detailCar release];
    [_array release];
    [_myTableView release];
    [_imageView release];
    [_bigModel release];
    [_collect release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.detailCar.name;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 603) style:UITableViewStylePlain];
    [self.view addSubview:self.myTableView];
    [_myTableView release];
    
    //设置tableview的contentView距离上边界200
    //相对于0点,已经向下偏移了-200
    self.myTableView.contentInset = UIEdgeInsetsMake(200.0+64, 0, 0, 0);
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    NSString *urlString = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/cars/seriessummary-pm1-s%@-t-c340300.json", self.detailCar.carId];
    NSLog(@"%@",self.detailCar.carId);
    [YKAppTools getDataWithUrlStr:urlString block:^(id result) {
        NSMutableDictionary *bigDic = result;
        NSMutableDictionary *resultDic = [bigDic objectForKey:@"result"];
        self.bigModel = [YKBigModel modelWithDictionary:resultDic];
        
        //相对于0点,图片坐标应该是(0,-200)
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200.0 - 30, self.view.frame.size.width, 200)];
        NSURL *url = [NSURL URLWithString:self.bigModel.logo];
        [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        //设置imageView高度改变时宽度也跟着改变
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.myTableView addSubview:self.imageView];
        [_imageView release];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 170, 200, 20)];
        nameLabel.text = self.bigModel.name;
        nameLabel.textAlignment = NSTextAlignmentRight;
        nameLabel.textColor = [UIColor whiteColor];
        [self.imageView addSubview:nameLabel];
        [nameLabel release];
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 190, 200, 20)];
        typeLabel.textAlignment = NSTextAlignmentRight;
        typeLabel.text = self.bigModel.levelname;
        typeLabel.textColor = [UIColor whiteColor];
        [self.imageView addSubview:typeLabel];
        [typeLabel release];
        
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 210, 200, 20)];
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.text = self.bigModel.fctprice;
        priceLabel.textColor = [UIColor whiteColor];
        [self.imageView addSubview:priceLabel];
        [priceLabel release];
        
        [self.myTableView reloadData];
    } error1:^(id result) {
        
        
    }];
    
    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 667 - 49, 375, 49)];
    tabBarView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.3];
    [self.view addSubview:tabBarView];
    
    self.collect = [[UIButton alloc] initWithFrame:CGRectMake(70, 0, 49, 49)];
    [self.collect setBackgroundImage:[UIImage imageNamed:@"msg_icon_heart@2x.png"] forState:UIControlStateNormal];
    [self.collect setBackgroundImage:[UIImage imageNamed:@"msg_icon_heart_a@2x.png"] forState:UIControlStateSelected];
    [self.collect addTarget:self action:@selector(collectAct:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarView addSubview:self.collect];
    [_collect release];
    
    UIButton *share = [[UIButton alloc] initWithFrame:CGRectMake(375 / 2 + 70, 0, 49, 49)];
    [share setBackgroundImage:[UIImage imageNamed:@"icon_expressshare@2x.png"] forState:UIControlStateNormal];
    [tabBarView addSubview:share];
    [share release];
    
    [tabBarView release];
    
    [[YKDataBaseTools shareDataBase] openDB];
    NSMutableArray *array = [[YKDataBaseTools shareDataBase] selectCollectionCar];
    for (YKDetailCar *detailCar in array) {
        if ([detailCar.carId isEqualToString:self.detailCar.carId]) {
            self.collect.selected = YES;
        }
    }
}

- (void)collectAct:(UIButton *)button{
    [[YKDataBaseTools shareDataBase] openDB];
    [[YKDataBaseTools shareDataBase] createCollectionTableCar];
    
    if (button.selected) {
        [[YKDataBaseTools shareDataBase] deleteCollectionCarWithId:self.detailCar.carId];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"取消收藏" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:^{
            
            
        }];
        
        UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *actionYes) {
            
        }];
        [alertController addAction:actionYes];
    }
    else {
        [[YKDataBaseTools shareDataBase] insertCollectionCarWith:self.detailCar];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"收藏成功" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:^{
            
            
        }];
        
        UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *actionYes) {
            
        }];
        [alertController addAction:actionYes];
    }
    button.selected = !button.selected;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.bigModel.enginelist.count;
}

//指定多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    YKMiddleModel *middleModel = [self.bigModel.enginelist objectAtIndex:section];
    return middleModel.speclist.count;
}

//创建一个cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"cell";
    YKCarInfoDetailTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[YKCarInfoDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    YKMiddleModel *middleModel = [self.bigModel.enginelist objectAtIndex:indexPath.section];
    YKSmallModel *smallModel = [middleModel.speclist objectAtIndex:indexPath.row];
    cell.smallModel = smallModel;
    
    return cell;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //点击后自动取消选中置灰效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //刚开始y的偏移量初始值就是-264
//    NSLog(@"y1 === %f",scrollView.contentOffset.y);
//    CGFloat y = scrollView.contentOffset.y - 64;//加上导航栏高度,第一次是-200
//    NSLog(@"y2 === %f",y);
//    
//    if (y < -200) {
//        CGRect frame = self.imageView.frame;
//        frame.origin.y = y;//偏移了多少,
//        frame.size.height =  -y;//tablview向下偏移了多少,高度就是多少
//        self.imageView.frame = frame;
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    
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
