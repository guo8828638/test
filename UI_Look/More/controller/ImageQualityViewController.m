//
//  ImageQualityViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "ImageQualityViewController.h"
#import "DKNightVersion.h"
@interface ImageQualityViewController ()

@end

@implementation ImageQualityViewController
- (void)dealloc
{
    [_aLabel release];
    [_bLabel release];
    [_cLabel release];
    [_aView release];
    [_imageView release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{

    [self hideTabBar];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIButton *abutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    abutton.backgroundColor = [UIColor whiteColor];
    
    [abutton setTitle:@"自动选择" forState:UIControlStateNormal];
    
    [abutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    abutton.frame = CGRectMake(-13*WIDTH/375, 20*HEIGHT/667,120, 30*HEIGHT/667);
    
    [abutton addTarget:self action:@selector(abuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:abutton];
    
    
//    根据单例让对号移动
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *str = [userDefaults objectForKey:@"qu"];
    
    if ([str isEqualToString:@""]) {
        
        self.aView =[[UIView alloc]initWithFrame:CGRectMake(300, 10, 30, 30)];
        
        self.aView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview: self.aView];
        
        [_aView release];
        
        
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-duihao.png"]];
        
        self.imageView.frame = CGRectMake(0, 0, 30, 30);
        
        [self.aView addSubview:self.imageView];
        
        [_imageView release];

        
    }else if ([str isEqualToString:@"1"])
    
    {
    
        
        self.aView =[[UIView alloc]initWithFrame:CGRectMake(300, 110, 30, 30)];
        
        self.aView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview: self.aView];
        
        [_aView release];
        
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-duihao.png"]];
        
        self.imageView.frame = CGRectMake(0, 0, 30, 30);
        
        [self.aView addSubview:self.imageView];
        
        [_imageView release];


        
        
    
    
    }else if ([str isEqualToString:@"2"])
    {
    
        self.aView =[[UIView alloc]initWithFrame:CGRectMake(300, 10, 30, 30)];
        
        self.aView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview: self.aView];
        
        [_aView release];
        
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-duihao.png"]];
        
        self.imageView.frame = CGRectMake(0, 0, 30, 30);
        
        [self.aView addSubview:self.imageView];
        
        [_imageView release];

    
    
    }else
    {
    
        self.aView =[[UIView alloc]initWithFrame:CGRectMake(300, 60, 30, 30)];
        
        self.aView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview: self.aView];
        
        [_aView release];
        
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-duihao.png"]];
        
        self.imageView.frame = CGRectMake(0, 0, 30, 30);
        
        [self.aView addSubview:self.imageView];
        
        [_imageView release];

    }
   
    
    
    UIButton *bbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    bbutton.backgroundColor = [UIColor whiteColor];
    
    [bbutton setTitle:@"高品质图片" forState:UIControlStateNormal];
    
    [bbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    bbutton.frame = CGRectMake(-5*WIDTH/375, 70*HEIGHT/667,120, 30*HEIGHT/667);
    
    [bbutton addTarget:self action:@selector(bbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bbutton];
    
    
    
    UIButton *cbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    cbutton.backgroundColor = [UIColor whiteColor];
    
    [cbutton setTitle:@"低品质图片" forState:UIControlStateNormal];
    
    [cbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    cbutton.frame = CGRectMake(-5*WIDTH/375, 120*HEIGHT/667,120, 30*HEIGHT/667);
    
    [cbutton addTarget:self action:@selector(cbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cbutton];

    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        abutton.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        bbutton.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        cbutton.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.aView.nightBackgroundColor =[UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.imageView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
    }];

}
//button点击方法
-(void)abuttonAction:(UIButton *)btn
{

    [UIView animateWithDuration:0.1 animations:^{
        
        self.aView.frame = CGRectMake(300*WIDTH/375, 10*HEIGHT/667, 30*WIDTH/375, 30*HEIGHT/667);
        
    }];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:@"2" forKey:@"qu"];

}
-(void)bbuttonAction:(UIButton *)btn
{
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.aView.frame = CGRectMake(300*WIDTH/375, 60*HEIGHT/667, 30*WIDTH/375, 30*HEIGHT/667);
        
    }];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:@"3" forKey:@"qu"];
    
}
-(void)cbuttonAction:(UIButton *)btn
{
    
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.aView.frame = CGRectMake(300*WIDTH/375, 110*HEIGHT/667, 30*WIDTH/375, 30*HEIGHT/667);
        
    }];
    
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:@"1" forKey:@"qu"];
    
    
}



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
