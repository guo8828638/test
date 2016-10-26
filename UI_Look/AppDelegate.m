//
//  AppDelegate.m
//  UI_Look
//
//  Created by dllo on 15/11/16.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "AppDelegate.h"
#import "BrandViewController.h"
#import "VideoViewController.h"
#import "MoreViewController.h"
#import "TalkViewController.h"
#import "WMPageController.h"
#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SDCycleScrollView.h"
#import "FrontViewController.h"
#import "UMSocial.h"
#import "DKNightVersion.h"
#import <SMS_SDK/SMSSDK.h>
#import "VideoDetailViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
     [UMSocialData setAppKey:@"5657ad5fe0f55ab00b004c6a"];
    
    [SMSSDK registerApp:@"cef888c7a09c" withSecret:@"fbbe54650754068fa9c13e1a7a86162f"];
    
    
       //    资讯
    NSMutableArray *homeVCs = [NSMutableArray array];
    NSMutableArray *homeVCTitles = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        Class vcClass = nil;
        NSString *title = nil;
        switch (i) {
            case 0:
                vcClass = [RootViewController class];
                title = @"资讯";
                break;
//            case 1:
//                vcClass = [FirstViewController class];
//                title = @"七日热点";
//                break;
            default:
                vcClass = [SecondViewController class];
                title = @"选品牌";
                break;
        }
        
        [homeVCs addObject:vcClass];
        [homeVCTitles addObject:title];
    }
    
    WMPageController *homeVC = [[WMPageController alloc] initWithViewControllerClasses:homeVCs andTheirTitles:homeVCTitles];
    
    UINavigationController *homeNav =  [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    [homeVC.navigationController setNavigationBarHidden:NO];
    
    homeVC.menuViewStyle = WMMenuViewStyleLine;//按钮下面是下划线效果
    
    homeVC.menuItemWidth = 90;//按钮的宽度
    //标题的颜色
    homeVC.titleColorNormal = [UIColor blackColor];
    //选中按钮的颜色
    homeVC.titleColorSelected = [UIColor purpleColor];
    
    homeVC.postNotification = YES;

//    BackgroundBlack@2x~iphone.png
    UIImage *images = [UIImage imageNamed:@"BackgroundBlack@2x~iphone.png"];
    
    [homeNav.navigationBar setBackgroundImage:images forBarMetrics:UIBarMetricsDefault];
    
    UIImage *image = [UIImage imageNamed:@"TitleTab_2Highlighted@2x~iphone.png"];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    homeNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"TitleTab_2@2x~iphone.png"] selectedImage:image];
    
      
    
    //    品牌
    
    BrandViewController *brVC = [[BrandViewController alloc]init];
    
    UINavigationController *naVC1 = [[UINavigationController alloc]initWithRootViewController:brVC];
    
    [naVC1.navigationBar setBackgroundImage:[UIImage imageNamed:@"BackgroundBlack@2x~iphone.png"] forBarMetrics:UIBarMetricsDefault];
    
// navigationBar title颜色
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    
    naVC1.navigationBar.titleTextAttributes = dict;
    
    
    UIImage *image1 = [UIImage imageNamed:@"TitleTab_0Highlighted@3x~iphone.png"];
    
    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    naVC1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"TitleTab_0@3x~iphone.png"] selectedImage:image1];
        
    
    //  杂志
    
    TalkViewController *talkVC = [[TalkViewController alloc]init];
    
    UINavigationController *naVC2 = [[UINavigationController alloc]initWithRootViewController:talkVC];
    
    [naVC2.navigationBar setBackgroundImage:[UIImage imageNamed:@"BackgroundBlack@2x~iphone.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIColor *Newscolor = [UIColor whiteColor];
    NSDictionary *Newsdict = [NSDictionary dictionaryWithObject:Newscolor forKey:UITextAttributeTextColor];
    naVC2.navigationBar.titleTextAttributes = Newsdict;

    
    UIImage *image2 = [UIImage imageNamed:@"TitleTab_1Highlighted@2x~iphone.png"];
    
    image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    naVC2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"TitleTab_1@2x~iphone.png"] selectedImage:image2];
    
    
    //    视频
    
    VideoViewController *mineVC = [[VideoViewController alloc]init];
    
    UINavigationController *naVC3 = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    UIColor *VideoColor = [UIColor whiteColor];
    
    NSDictionary *videoDict = [NSDictionary dictionaryWithObject:VideoColor forKey:UITextAttributeTextColor];
    naVC3.navigationBar.titleTextAttributes = videoDict;
    
    [naVC3.navigationBar setBackgroundImage:[UIImage imageNamed:@"BackgroundBlack@2x~iphone.png"] forBarMetrics:UIBarMetricsDefault];
   
    UIImage *image3 = [UIImage imageNamed:@"TitleTab_3Highlighted@2x~iphone.png"];
    
    image3 = [image3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naVC3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"TitleTab_3@2x~iphone.png"] selectedImage:image3];
    
    
    //    更多
    
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    UINavigationController *naVC4 = [[UINavigationController alloc]initWithRootViewController:moreVC];
    UIColor *VideoColor1 = [UIColor whiteColor];
    
    NSDictionary *videoDict1 = [NSDictionary dictionaryWithObject:VideoColor1 forKey:UITextAttributeTextColor];
    naVC4.navigationBar.titleTextAttributes = videoDict1;
    

    
    
    [naVC4.navigationBar setBackgroundImage:[UIImage imageNamed:@"BackgroundBlack@2x~iphone.png"] forBarMetrics:UIBarMetricsDefault];    
    UIImage *image4 = [UIImage imageNamed:@"TitleTab_4Highlighted@3x~iphone.png"];
    
    image4 = [image4  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    naVC4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"TitleTab_4Normal@2x~iphone.png"] selectedImage:image4];
    
    
    self.tabB = [[UITabBarController alloc]init];
    
    self.tabB.delegate = self;
    
    self.tabB.viewControllers = [NSArray arrayWithObjects:naVC1,naVC2,homeNav,naVC3,naVC4,nil];
    
    self.tabB.tabBar.barTintColor = [UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:0.8];
    
    FrontViewController *font = [[FrontViewController alloc]init];
    
    UINavigationController *foVC = [[UINavigationController alloc]initWithRootViewController:font];
    
    foVC.navigationBarHidden =YES;
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
       self.tabB.tabBar.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
       self.tabB.tabBar.nightBarTintColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
    }];
    

//通知 根据单例判断根视图是哪个
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeColor:) name:@"changeRootViewController" object:nil];
//    
//    
//    
//    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"isfirst"]) {
    
      
//        self.window.rootViewController = foVC;


        
        
//    }else
//    {
    
          self.window.rootViewController = self.tabB;

//    }

    

    
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    
    [homeNav release];
    [naVC1 release];
    [naVC2 release];
    [naVC3 release];
    [naVC4 release];
    [_window release];

    
    return YES;
}
//接受通知  执行方法
-(void)changeColor:(NSNotification *)notification
{

     NSString *str = [notification object];
    
     [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"isfirst"];
    
    self.window.rootViewController = self.tabB;
    

}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

    int index =  tabBarController.selectedIndex;
    

    if (index == 0) {
        
        
    }

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
