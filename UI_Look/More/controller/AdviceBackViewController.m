//
//  AdviceBackViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "AdviceBackViewController.h"
#import "AdviceBackView.h"
#import "DKNightVersion.h"
#import "MBProgressHUD.h"
#import <MessageUI/MFMailComposeViewController.h>
@interface AdviceBackViewController ()<MFMailComposeViewControllerDelegate>
@property (nonatomic,retain)AdviceBackView *aView;

@end

@implementation AdviceBackViewController
- (void)dealloc
{
    [_aView release];
    [_HUD release];
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{

//    [self hideTabBar];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (![MFMailComposeViewController canSendMail]) {
        
        NSLog(@"11111");
        UIAlertView *wAlertView = [[UIAlertView alloc]initWithTitle:@"不能发送邮件"
                                                            message:@"请检查邮件设置"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [wAlertView show];
        
        return;
}
    
    
    
    
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc]init];
    
     controller.mailComposeDelegate = self;
    
     [controller setSubject:@"请联系我们"];
    
     [controller setToRecipients:[NSArray arrayWithObject:@"82370361@qq.com"]];

    [controller setCcRecipients:@[@"1055009238@qq.com"]];
        
//    设置正文内容
    
    NSString *emailContent = @"lanou3g";
    
//    是否为HTML格式
    
    [controller setMessageBody:emailContent isHTML:NO];
    
     [self presentViewController:controller animated:YES completion:^{
          
          ;
          
      }];
    
     [controller release];
    

    
    
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:controller completion:^{
        ;
        
    }];
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


-(void)rightButtonAction:(UIBarButtonItem *)btn
{

    if (self.aView.inPutField.text.length < 8) {
        
        self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        
        [self.navigationController.view addSubview:self.HUD];
        
        //显示的文字
        self.HUD.labelText = @"发送失败    ";
        
        //是否有遮罩
        self.HUD.dimBackground = NO;
        
        self.HUD.labelFont = [UIFont boldSystemFontOfSize:22];
        
        self.HUD.backgroundColor = [UIColor clearColor];
        
        //提示框的样式
        self.HUD.mode = MBProgressHUDModeCustomView;
        
        [self.HUD show:YES];
        
        //两秒之后隐藏
        [self.HUD hide:YES afterDelay:0.5];
        
        [_HUD release];

        
    }else
    {
        
    [self.navigationController popViewControllerAnimated:YES];
        
    self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        
    [self.navigationController.view addSubview:self.HUD];
        
    //显示的文字
    self.HUD.labelText = @"发送成功    ";
        
    //是否有遮罩
    self.HUD.dimBackground = NO;
        
    self.HUD.labelFont = [UIFont boldSystemFontOfSize:22];
        
    self.HUD.backgroundColor = [UIColor clearColor];
        
    //提示框的样式
    self.HUD.mode = MBProgressHUDModeCustomView;
        
    [self.HUD show:YES];
        
    //两秒之后隐藏
    [self.HUD hide:YES afterDelay:0.5];
        
    [_HUD release];

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
