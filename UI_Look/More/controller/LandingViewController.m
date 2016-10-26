//
//  LandingViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "LandingViewController.h"
#import "RegisterViewController.h"
#import "DataBaseSingleton.h"
#import "DKNightVersion.h"
#import <SMS_SDK/SMSSDK.h>
#import "YJViewController.h"

@interface LandingViewController ()


@end

@implementation LandingViewController
- (void)dealloc
{
    [_passWordTextField release];
    [_mailBoxTextField release];
    [_otherImageView release];
    [_dic release];
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{

       
//    [self hideTabBar];
//

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [[DataBaseSingleton shareDataBase]openDB];
    
    self.mailBoxTextField = [[UITextField alloc]initWithFrame:CGRectMake((40*WIDTH)/375, (140*HEIGHT)/667, (300*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.mailBoxTextField.placeholder = @"用户名 :";
    
    self.mailBoxTextField.borderStyle =  UITextBorderStyleBezel;
    
    [self.view addSubview:self.mailBoxTextField];
    
    [_mailBoxTextField release];
    
    
    self.passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake((40*WIDTH)/375, (200*HEIGHT)/667, (300*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.passWordTextField.placeholder = @"密码:";
    
    self.passWordTextField.borderStyle = UITextBorderStyleBezel;
    
    self.passWordTextField.secureTextEntry  = YES;
    
    [self.view addSubview:self.passWordTextField];
    
    [_passWordTextField release];
    
    
    self.LandingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.LandingButton.frame = CGRectMake((20*WIDTH)/375, (280*HEIGHT)/667, (100*WIDTH)/375, (50*HEIGHT)/667);
    
    [self.LandingButton addTarget:self action:@selector(LandingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.LandingButton];
    
    [self.LandingButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [self.LandingButton setTitle:@"登陆" forState:UIControlStateNormal];
    
    [self.LandingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    self.soonRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.soonRegister.frame = CGRectMake((120*WIDTH)/375, (280*HEIGHT)/667, (100*WIDTH)/375, (50*HEIGHT)/667);
    
    [self.soonRegister addTarget:self action:@selector(soonRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.soonRegister];
    
    [self.soonRegister setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [self.soonRegister setTitle:@"注册" forState:UIControlStateNormal];
    
    [self.soonRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.soonRegister setBackgroundColor:[UIColor whiteColor]];
    
    
    
    UIButton *MessageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [MessageButton setTitle:@"其他方式注册" forState:UIControlStateNormal];
    
    [MessageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    MessageButton.frame = CGRectMake((220*WIDTH)/375, (280*HEIGHT)/667, (150*WIDTH)/375, (50*HEIGHT)/667);

    [MessageButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:MessageButton];

    
    
    
    
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

-(void)buttonAction:(UIButton *)btn
{

    YJViewController *YJ  = [[YJViewController alloc]init];
    
    [self.navigationController pushViewController:YJ animated:YES];


}


-(void)leftButtonAction:(UIBarButtonItem *)btn
{

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)LandingButtonAction:(UIButton *)btn
{

    
       
    self.dic = [NSMutableDictionary dictionary];
    
    self.dic = [[DataBaseSingleton shareDataBase]selectLanuchData];
    

   
    
    if (![self.dic.allKeys containsObject:self.mailBoxTextField.text]) {
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"用户名不存在" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertV show];
        
    }else
    {
        if (![[self.dic objectForKey:self.mailBoxTextField.text]isEqualToString:self.passWordTextField.text]) {
            
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertV show];

            
            
        }else
        {
        
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"登陆成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [alertV show];
            
            
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

            [userDefault setObject:self.mailBoxTextField.text forKey:@"islogin"];
            
            [self.navigationController popViewControllerAnimated:YES];
        
        
        
        }
    

    
    }
    
    



}

-(void)soonRegisterAction:(UIButton *)btn
{
   
//    跳转注册页面
    RegisterViewController *reVC = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:reVC animated:YES];
 
    
    
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
