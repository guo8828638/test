//
//  FrontViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/24.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FrontViewController.h"
#import "AppDelegate.h"

@interface FrontViewController ()<UIScrollViewDelegate>
@property (nonatomic, retain) UIPageControl *pageC;
@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation FrontViewController
- (void)dealloc
{
    [_scrollView release];
    [_pageC release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [_scrollView release];
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:@"1C744D4E763E6BAD266322D63BE5DA16.png",@"B482D9312D5CC4462CD2B6C32E137236",@"54F45DB0DEA741C55DECE945A7EB0875.png",nil];

    self.scrollView.contentSize = CGSizeMake(WIDTH*imageArray.count, 0);
    
    for (int i =0; i<imageArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i, (-15*HEIGHT)/667, WIDTH, HEIGHT)];
        
        imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
        
        [self.scrollView addSubview:imageView];
        
        [imageView release];

        
    }
    
 
    //设置按页滑动
    self.scrollView.pagingEnabled = YES;
    //取消边界反弹效果(默认是开启)
    self.scrollView.bounces = NO;
    //是否显示水平滑动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //是否显示垂直滑动条
    self.scrollView.showsVerticalScrollIndicator = NO;
    //快速回到顶部
    self.scrollView.scrollsToTop = YES;
    
    self.scrollView.directionalLockEnabled = YES;

    self.scrollView.contentOffset = CGPointMake(0, 0);//直接显示第二张图片
    
    self.scrollView.delegate = self;
    

    self.pageC = [[UIPageControl alloc] initWithFrame:CGRectMake((175*WIDTH/375)/2, HEIGHT - 90*HEIGHT/667, 200*WIDTH/375, 62*HEIGHT/667)];
    self.pageC.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pageC];
    
    //设置页码个数
    self.pageC.numberOfPages = imageArray.count;
    //设置当前页码颜色
    self.pageC.currentPageIndicatorTintColor = [UIColor colorWithRed:209 green:186 blue:116 alpha:1.00];
    //设置未选中页码颜色
    self.pageC.pageIndicatorTintColor = [UIColor cyanColor];
    //设置当前选中页码
    self.pageC.currentPage = 0;//下标

    //核心方法
    [self.pageC addTarget:self action:@selector(pageAction:) forControlEvents: UIControlEventValueChanged];
    
    [_pageC release];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(890*WIDTH/375, 595*HEIGHT/667, 100*WIDTH/375, 50*HEIGHT/667);
    
    btn.alpha = 0.5;
    
    btn.backgroundColor = [UIColor clearColor];
    
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.scrollView addSubview:btn];


}
-(void)buttonAction:(UIButton *)btn
{
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeRootViewController" object:@"1"];
    
}
//滑动图片时点也跟着动(在减速停止中实现)
- (void)pageAction:(UIPageControl *)pageC
{
    //打印当前页码下标
    NSLog(@"currentPage = %ld", pageC.currentPage);
    
    [self.scrollView setContentOffset:CGPointMake(WIDTH * pageC.currentPage, 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"减速停止时触发");
    //(页码跟随图片)
    self.pageC.currentPage = scrollView.contentOffset.x / WIDTH;
    
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
