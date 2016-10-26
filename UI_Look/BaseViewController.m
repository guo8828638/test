//
//  BaseViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "BaseViewController.h"
#import "DKNightVersion.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    基类
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.view.normalBackgroundColor = [UIColor whiteColor];
        
        self.navigationController.navigationBar.nightBarTintColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.navigationController.navigationBar.normalBarTintColor= [UIColor whiteColor];
        
        self.tabBarController.tabBar.nightBarTintColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.tabBarController.tabBar.normalBarTintColor =[UIColor whiteColor];
        
    }];
    
    
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
