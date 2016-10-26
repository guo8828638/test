//
//  FirstThreeViewController.m
//  UI_Look
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "FirstThreeViewController.h"
#import "FirstModel.h"
#import "AppTools.h"
#import "UIImageView+WebCache.h"

@interface FirstThreeViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *pageC;
@end

@implementation FirstThreeViewController
- (void)dealloc
{
    [_scrollView release];
    [_pageC release];
    [_headLabel release];
    [_footLabel release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    
    self.str = self.model.title;
    
    NSString *string = self.model.content168;
    
    self.str1 = self.model.imglink;
    
    self.str2 = self.model.imglink_2;
    
    self.str3 = self.model.imglink_3;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
    [_scrollView release];
    
    self.scrollView.contentSize = CGSizeMake(WIDTH*3, HEIGHT);
    
   self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake(185, 30, 100, 50)];
    
    self.headLabel.backgroundColor = [UIColor blackColor];
    
    self.num = 1;
    
    self.headLabel.text = @"1/3";
    
    self.headLabel.font = [UIFont boldSystemFontOfSize:16];
    
    self.headLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.headLabel];
    
    [_headLabel release];

    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH/375, 450*HEIGHT/667, 355*WIDTH/375, 100*HEIGHT/667)];
    
    self.footLabel.backgroundColor = [UIColor clearColor];
    
    self.footLabel.textColor = [UIColor whiteColor];
    
    self.footLabel.numberOfLines = 0;
    
    self.footLabel.text = string;
    
    self.footLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [self.view addSubview:self.footLabel];
    
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 150*HEIGHT/667, WIDTH, 250*HEIGHT/667)];
    
    NSURL *url1 = [NSURL URLWithString:self.str1];
    
    [imageView1 sd_setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
    
    imageView1.userInteractionEnabled = YES;
    
    [imageView1 addGestureRecognizer:tap1];
    
    [self.scrollView addSubview:imageView1];
    
    [imageView1 release];
    
    
    
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH , 150*HEIGHT/667, WIDTH, 250*HEIGHT/667)];
    
    NSURL *url2 = [NSURL URLWithString:self.str2];
    
    [imageView2 sd_setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
    
    imageView2.userInteractionEnabled = YES;
    
    [imageView2 addGestureRecognizer:tap2];
    
    [self.scrollView addSubview:imageView2];
    
    [imageView2 release];
    
    
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH*2 , 150*HEIGHT/667, WIDTH, 250*HEIGHT/667)];
    
    NSURL *url3 = [NSURL URLWithString:self.str3];
    
    [imageView3 sd_setImageWithURL:url3 placeholderImage:[UIImage imageNamed:@"TitleLogo@2x~iphone.png"]];
    
    imageView3.userInteractionEnabled = YES;
    
    [imageView3 addGestureRecognizer:tap];
    
    [self.scrollView addSubview:imageView3];
    
    [imageView3 release];
    
    
    self.scrollView.pagingEnabled = YES;
    //取消边界反弹效果(默认是开启)
    self.scrollView.bounces = NO;
    //是否显示水平滑动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //是否显示垂直滑动条
    self.scrollView.showsVerticalScrollIndicator = NO;
    //快速回到顶部
    self.scrollView.scrollsToTop = YES;
    //滚动偏移量
    self.scrollView.contentOffset = CGPointMake(0, 0);//直接显示第二张图片
    self.scrollView.delegate = self;
    
    
    
    self.pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(175/2*WIDTH/375, 567*HEIGHT/667 ,200*WIDTH/375, 60*HEIGHT/667)];
    self.pageC.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pageC];
    [_pageC release];
    //设置页码个数
    self.pageC.numberOfPages = 3;
    //设置当前页码颜色
    self.pageC.currentPageIndicatorTintColor = [UIColor cyanColor];
    //设置未选中页码颜色
    self.pageC.pageIndicatorTintColor = [UIColor blueColor];
    //设置当前选中页码
    self.pageC.currentPage = 0;//下标
    
    //核心方法
    [self.pageC addTarget:self action:@selector(pageAction:) forControlEvents: UIControlEventValueChanged];
    
    
}
-(void)tapAction:(UITapGestureRecognizer *)tap
{
    
    NSLog(@"dasds");
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    
}
- (void)pageAction:(UIPageControl *)pageC
{
    //打印当前页码下标
    NSLog(@"currentPage = %ld", pageC.currentPage);
    
    //    self.scrollView.contentOffset = CGPointMake(WIDTH * pageC.currentPage, 0);(用户体验不好)
    [self.scrollView setContentOffset:CGPointMake(WIDTH * pageC.currentPage, 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"减速停止时触发");
    //(页码跟随图片)
    self.pageC.currentPage = scrollView.contentOffset.x / WIDTH;
    
    self.headLabel.text = [NSString stringWithFormat:@"%.f/3",self.scrollView.contentOffset.x/WIDTH+1];
    
    
    
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
