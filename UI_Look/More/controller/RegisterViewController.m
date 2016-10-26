//
//  RegisterViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "DataBaseSingleton.h"

@interface RegisterViewController ()
@property (nonatomic,retain)RegisterView *registerView;

@end

@implementation RegisterViewController
- (void)dealloc
{
    [_registerView release];
    [_dic release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{

//    [self hideTabBar];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.registerView = [[RegisterView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.registerView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.registerView];
    
    [[DataBaseSingleton shareDataBase]openDB];
    
    [[DataBaseSingleton shareDataBase]createLanuchFurtherUserTable];
    
    self.dic = [NSMutableDictionary dictionary];
    
    self.dic = [[DataBaseSingleton shareDataBase]selectLanuchData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(rightbuttonAction:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftbuttonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [self.navigationItem.leftBarButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"arrow_back7@2x.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [_registerView release];

    
    
    
}

-(void)leftbuttonAction:(UIButton *)btn
{

    [self.navigationController popViewControllerAnimated:YES];


}

-(void)rightbuttonAction:(UIButton *)btn1
{

    
    if ([self.registerView.textFileld1.text isEqualToString:@""]) {
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"用户名为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertV show];
        
        
    }
    
    else if ([self.registerView.textFileld2.text isEqualToString:@""]||[self.registerView.textFileld3.text isEqualToString:@""])
    {
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"密码为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertV show];
        
        
    }
    else if (![self.registerView.textFileld2.text isEqualToString:self.registerView.textFileld3.text])
    {
        
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"两次密码不一致" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertV show];
        
    }
    else if ([self.dic.allKeys containsObject:self.registerView.textFileld1.text])
    {
        
        
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"该用户已经注册过" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertV show];
        
        
        
        
    }
    
    
    else
    {
        
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"注册成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertV show];
        
        
        [[DataBaseSingleton shareDataBase]insertLanuchName:self.registerView.textFileld1.text Password:self.registerView.textFileld2.text];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
       
        
    }


    
    

    
    
    


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
