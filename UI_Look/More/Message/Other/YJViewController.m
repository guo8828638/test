//
//  YJViewController.m
//  SMS_SDKDemo
//
//  Created by 掌淘科技 on 14-6-27.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import "YJViewController.h"
//#import "SMS_HYZBadgeView.h"
#import "RegViewController.h"
//#import "SectionsViewControllerFriends.h"
//#import "SMS_MBProgressHUD+Add.h"
//#import <AddressBook/AddressBook.h>
//#import "RegisterByVoiceCallViewController.h"

#import <SMS_SDK/SMSSDK.h>
#import "LandingViewController.h"
//#import <SMS_SDK/SMSSDK+AddressBookMethods.h>
#import <SMS_SDK/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/SMSSDK+ExtexdMethods.h>


@interface YJViewController ()
{
//    SMS_HYZBadgeView* _testView;
//    SectionsViewControllerFriends* _friendsController;
}

@end

static UIAlertView* _alert1 = nil;

@implementation YJViewController

-(void)viewWillAppear:(BOOL)animated
{
    
    self.navigationController.navigationBar.hidden = NO;

    
//    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 44)];
//    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@""];
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"back", nil)
//                                                                style:UIBarButtonItemStyleDone
//                                                                  target:self
//                                                                  action:@selector(clickLeftButton:)];
//    //设置导航栏内容
//    [navigationItem setTitle:NSLocalizedString(@"verifycode", nil)];
//    [navigationBar pushNavigationItem:navigationItem animated:NO];
//    [navigationItem setLeftBarButtonItem:leftButton];
//    [self.view addSubview:navigationBar];


    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    //状态栏的屏幕设配
    CGFloat statusBarHeight=0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        statusBarHeight=20;
    }
    
    //短信验证码注册
    UIButton* regBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    regBtn.frame = CGRectMake(self.view.frame.size.width/2 - 100 , 50 + 1 * 70 + statusBarHeight, 200, 40);
    [regBtn setTitle:NSLocalizedString(@"RegisterBySMS", nil) forState:UIControlStateNormal];
    [regBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [regBtn addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    NSString *icon = [NSString stringWithFormat:@"smssdk.bundle/button5.png"];
    [regBtn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [self.view addSubview:regBtn];
    
    
  

}

-(void)clickLeftButton:(UIBarButtonItem *)btn
{
    
   
//   
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//        
//        }];
    
    //
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)submitUserInfo:(id)sender
{
    SMSSDKUserInfo* userInfo=[[SMSSDKUserInfo alloc] init];
    userInfo.avatar = @"http://123.jpg";
    userInfo.nickname = @"Jimmy";
    userInfo.uid = @"010";
    //    user.phone = @"1861
    
    //最新方法
    [SMSSDK submitUserInfoHandler:userInfo result:^(NSError *error) {
        
        if (!error)
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提交成功"
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {
           
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提交失败"
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
        
        }
        
    }];
    
}

- (void)registerUser
{
    RegViewController* reg = [[RegViewController alloc] init];
    [self presentViewController:reg animated:YES completion:^{
        
    }];
}


@end
