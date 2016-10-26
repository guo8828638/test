//
//  AboutUsViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "AboutUsViewController.h"
#import "DKNightVersion.h"

@interface AboutUsViewController ()

@property (nonatomic,retain)UILabel *label;

@end

@implementation AboutUsViewController
-(void)viewWillAppear:(BOOL)animated
{
//    [self hideTabBar];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc]initWithFrame:[[UIScreen  mainScreen]bounds]];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.label.text = @"欢迎访问82370361@qq.com！";
    
    [self.view addSubview:self.label];
    
    self.navigationItem.title = @"关于我们";
    
    [_label release];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.label.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.label.nightTextColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.000];
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
    
    }];
    
    
    
}
//隐藏tabbar
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    
    self.tabBarController.tabBar.hidden = YES;
    
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
