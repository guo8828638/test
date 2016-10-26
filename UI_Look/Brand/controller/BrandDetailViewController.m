//
//  BrandDetailViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/20.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BrandDetailViewController.h"

@interface BrandDetailViewController ()<UIWebViewDelegate>

@end

@implementation BrandDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.str = self.model.link_share;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIWebView *myWebView = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    myWebView.backgroundColor = [UIColor whiteColor];
    
    myWebView.delegate = self;
    
    NSString *Str = self.str;
    
    NSURL *url = [NSURL URLWithString:Str];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:request];
        
    [self.view addSubview:myWebView];

}
-(void)leftButtonAction:(UIBarButtonItem *)btn
{

    [self.navigationController popViewControllerAnimated:YES];

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
