
//
//  TalkDetailViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/21.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "TalkDetailViewController.h"
#import "DataBaseSingleton.h"
#import "UMSocial.h"
#import "DKNightVersion.h"
#import "MBProgressHUD.h"

@interface TalkDetailViewController ()<UIWebViewDelegate,UIAlertViewDelegate,UMSocialUIDelegate,UIScrollViewDelegate>
//@property (nonatomic,copy)NSString *str;
@property (nonatomic,retain)MBProgressHUD *HUD;

@end

@implementation TalkDetailViewController
- (void)dealloc
{
    [_model release];
    [_HUD release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSMutableArray *array1 = [[DataBaseSingleton shareDataBase] selectSC];
    
    for (TalkModel *model in array1) {
        
        if ([model.title isEqualToString:self.model.title]) {
            [self.rightButton setBackgroundImage:[UIImage imageNamed:@"iconfont-star(1).png"] forState:UIControlStateNormal];
            
            self.rightButton.selected = YES;
        }else{
            
            [self.rightButton setBackgroundImage:[UIImage imageNamed:@"iconfont-star.png"] forState:UIControlStateNormal];
            
            self.rightButton.selected = NO;
            
        }
        
    }
    
    
    [self hideTabBar];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    NSString *str = self.model.link_share;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonAction:)];
    
    self.navigationItem.title =@"ILoveMagazine";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIWebView *myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, -40*HEIGHT/667, WIDTH, 600*HEIGHT/667)];
    
    myWebView.backgroundColor = [UIColor whiteColor];
    
    myWebView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:request];
    
    [self.view addSubview:myWebView];
    

    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 40*HEIGHT/667, WIDTH, 40*HEIGHT/667)];
    
    label1.backgroundColor = [UIColor blackColor];
    
    [myWebView addSubview:label1];
    
    
    
    UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectMake((5*WIDTH)/375, (560*HEIGHT)/667, (365*WIDTH)/375, (40*HEIGHT)/667)];
    
    imageView.image = [UIImage imageNamed:@"BackgroundEntryToolBar@2x~ipad.png"];
    
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((5*WIDTH)/375, (550*HEIGHT)/667, (365*WIDTH)/375, (49*HEIGHT)/667)];
    
    label.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:0.7];
    
    [self.view addSubview:label];
    
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.frame = CGRectMake((5*WIDTH)/375, (548*HEIGHT)/667, (70*WIDTH)/375, (60*HEIGHT)/667);
        
    [leftButton setBackgroundImage:[UIImage imageNamed:@"ButtonEntryToolClose@3x~iphone.png"] forState:UIControlStateNormal];
    
    leftButton.alpha = 0.8;
    
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:leftButton];
    
    
    
//    UIButton *midButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    midButton.frame = CGRectMake((160*WIDTH)/375, (553*HEIGHT)/667, (40*WIDTH)/375, (50*HEIGHT)/667);
//    
//    [midButton setBackgroundImage:[UIImage imageNamed:@"ButtonEntryToolOuter@2x~iphone.png"] forState:UIControlStateNormal];
//    
//    midButton.alpha = 0.8;
//    
//    [midButton addTarget:self action:@selector(midButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:midButton];
    
    
    
   
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.rightButton.frame = CGRectMake((310*WIDTH)/375, (558*HEIGHT)/667, (30*WIDTH)/375, (30*HEIGHT)/667);
    
    [self.view addSubview:self.rightButton];
    
    self.rightButton.alpha = 0.8;
    
     [self.rightButton setBackgroundImage:[UIImage imageNamed:@"iconfont-star.png"] forState:UIControlStateNormal];
    
    [self.rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
 
    

    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        
        
        
        
        
    }];

    
    

    
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

-(void)leftButtonAction:(UIButton *)btn
{


    [self.navigationController popViewControllerAnimated:YES];
    
   

}

//-(void)midButtonAction:(UIButton *)btn1
//{
//
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:@"5657ad5fe0f55ab00b004c6a"
//                                      shareText:@"你要分享的文字"
//                                     shareImage:[UIImage imageNamed:@"icon.png"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,nil]
//                                       delegate:self];
//
//
//}
-(void)rightButtonAction:(UIButton *)btn2
{
    
    if (btn2.selected == NO) {
        
        [btn2 setBackgroundImage:[UIImage imageNamed:@"iconfont-star(1).png"] forState:UIControlStateNormal];
        
        [[DataBaseSingleton shareDataBase]insertTalkModel:self.model];
        
        btn2.selected = YES;
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"收藏成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        [alertV show];
        
        
        self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:self.HUD];
        //显示的文字
        self.HUD.labelText = @"收藏成功    ";
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
        
    
    [btn2 setBackgroundImage:[UIImage imageNamed:@"iconfont-star.png"] forState:UIControlStateNormal];
        

        [[DataBaseSingleton shareDataBase]deleteTalkmodel:self.model];
        
        btn2.selected = NO;
        
        self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:self.HUD];
        //显示的文字
        self.HUD.labelText = @"取消收藏    ";
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

//-(void)alertView:(UIAlertView *)alertView1 clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//
//    if (buttonIndex == 0) {
//        
//        
//        
//
//    }else
//    {
//    
//    
//    
//    }
//
//}


-(void)hideTabBar {
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
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGPoint point = scrollView.contentOffset;
    
    CGFloat contentHeight = scrollView.contentSize.height;
    
    CGFloat frameHight = scrollView.frame.size.height;
    
    if (point.y >0) {
        
        [scrollView setContentOffset:CGPointMake(point.x, 0) animated:YES];
        
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
