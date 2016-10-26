//
//  InfoDetailViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/17.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "InfoDetailViewController.h"
#import "DKNightVersion.h"

@interface InfoDetailViewController ()<UIWebViewDelegate>

@end

@implementation InfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.str = self.model.contentid;
    
    UIWebView *myWebView = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    myWebView.backgroundColor = [UIColor whiteColor];
    myWebView.delegate = self;
    
    NSString *Str = [NSString stringWithFormat:@"http://www.xbiao.com/app/showarticle/id/%@",self.str];
    
    NSURL *url = [NSURL URLWithString:Str];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:request];
    
    [self.view addSubview:myWebView];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"liudongnight"];
        if ([string isEqualToString:@"yes"]) {
    
            
            //字体颜色
            [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'gary'"];
            //页面背景色
            [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='black'"];
            
        }
        else
        {
           
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
