
//
//  SecondDetailViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SecondDetailViewController.h"
#import "RootViewController.h"

@interface SecondDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,retain)UIView *aView;
@property (nonatomic,retain)UIView *bView;
@property (nonatomic,retain)UIView *cView;
@property (nonatomic,retain)UIView *dView;

@end

@implementation SecondDetailViewController
- (void)dealloc
{
    [_aView release];
    [_bView release];
    [_cView release];
    [_dView release];
    [super dealloc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //    分段按钮
    NSArray *array = [NSArray arrayWithObjects:@"系列",@"经销商",@"全部表款",@"简介",nil];
    
    UISegmentedControl *segmentC = [[UISegmentedControl alloc]initWithItems:array];
    
    [segmentC setTintColor:[UIColor purpleColor]];
    
    segmentC.backgroundColor = [UIColor whiteColor];
    
    segmentC.frame = CGRectMake(0, 0,WIDTH, (40*HEIGHT)/667);
    
    [self.view addSubview:segmentC];
    
    [segmentC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    //    webVie
    
   self.myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, ((667-40 -64 -40)*HEIGHT)/667)];
    
    self.myWebView.scalesPageToFit = YES;
    
    self.myWebView.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
    
    self.myWebView.backgroundColor = [UIColor whiteColor];
    
    self.myWebView.delegate = self;
    
    
    NSString *Str = [NSString stringWithFormat:@"http://www.xbiao.com/app/seriesList/bid/%@",self.model.brandid];
    
    NSURL *url = [NSURL URLWithString:Str];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.myWebView loadRequest:request];
    
    
    
    self.allMyWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, ((667-40 -64 -40)*HEIGHT)/667)];
    
    self.allMyWebView.backgroundColor = [UIColor redColor];
    
    self.allMyWebView.scrollView.pagingEnabled = YES;
    
    self.allMyWebView.scrollView.bounces = NO;
    
    
    NSString *allStr = [NSString stringWithFormat:@"http://www.xbiao.com/app/productList/bid/%@",self.model.brandid];
    
    NSURL *allUrl = [NSURL URLWithString:allStr];
    
    NSURLRequest *allRequest = [NSURLRequest requestWithURL:allUrl];
    
    [self.allMyWebView loadRequest:allRequest];
    
    self.showMyWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, ((667-40 -64 -40)*HEIGHT)/667)];
    
    self.showMyWebView.backgroundColor = [UIColor whiteColor];
    
    
    
    NSString *showStr = [NSString stringWithFormat:@"http://www.xbiao.com/app/shopList/bid/%@",self.model.brandid];
    
    NSURL *showUrl = [NSURL URLWithString:showStr];
    
    NSURLRequest *showRequest = [NSURLRequest requestWithURL:showUrl];
    
    [self.showMyWebView loadRequest:showRequest];
    
    self.inMyWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, ((667-40 -64 -40)*HEIGHT)/667)];
    
    self.inMyWebView.backgroundColor = [UIColor whiteColor];
    
    [self.inMyWebView.scrollView sizeToFit];
    
    NSString *inStr = [NSString stringWithFormat:@"http://www.xbiao.com/app/BrandIntro/bid/%@",self.model.brandid];
    
    NSURL *inUrl = [NSURL URLWithString:inStr];
    
    NSURLRequest *inRequest = [NSURLRequest requestWithURL:inUrl];
    
    [self.inMyWebView loadRequest:inRequest];
    
    
    
    //
    self.dView = [[UIView alloc]initWithFrame:CGRectMake(0, (40*HEIGHT)/667, WIDTH,  HEIGHT)];
    
    self.dView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.dView];
    
    
    self.bView = [[UIView alloc]initWithFrame:CGRectMake(0, (40*HEIGHT)/667, WIDTH,  HEIGHT)];
    
    self.bView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.bView];
    
    
    self.cView = [[UIView alloc]initWithFrame:CGRectMake(0, (40*HEIGHT)/667, WIDTH,  HEIGHT)];
    
    self.cView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.cView];
    
    
    self.aView = [[UIView alloc]initWithFrame:CGRectMake(0, (40*HEIGHT)/667, WIDTH,  HEIGHT)];
    
    self.aView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.aView];
    
    
    
    [self.aView addSubview:self.myWebView];
    
    [self.bView addSubview:self.allMyWebView];
    
    [self.cView addSubview:self.showMyWebView];
    
    [self.dView addSubview:self.inMyWebView];
    
    
    [_aView release];
    [_bView release];
    
    
    [_myWebView release];
    [_inMyWebView release];
    [_showMyWebView release];
    [_allMyWebView release];

    
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"liudongnight"];
    if ([string isEqualToString:@""]) {
        
        //字体颜色
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'gary'"];
        //页面背景色
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='black'"];
        
    }
    else
    {
        
    }
    
    
}

//分段按钮控制哪一个view在最前

-(void)segmentAction:(UISegmentedControl *)segment
{
    
    if (segment.selectedSegmentIndex == 0) {
        
        [self.view bringSubviewToFront:self.aView];
    }
    if(segment.selectedSegmentIndex == 1)
    {
        
        [self.view bringSubviewToFront:self.cView];
        
    }
    if(segment.selectedSegmentIndex == 2)
    {
        
        [self.view bringSubviewToFront:self.bView];
        
    }
    if(segment.selectedSegmentIndex == 3)
    {
        
        [self.view bringSubviewToFront:self.dView];
        
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
