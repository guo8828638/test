//
//  MoreViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/16.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "MoreViewController.h"
#import "Singleton.h"
#import "MoreModel.h"
#import "MoreTableViewCell.h"
#import "LandingViewController.h"
#import "RegisterViewController.h"
#import "AdviceBackViewController.h"
#import "ImageQualityViewController.h"
#import "AboutUsViewController.h"
#import "DataBaseSingleton.h"
#import "FriendshipViewController.h"
#import "SCViewController.h"
#import "DKNightVersion.h"
#import "SDImageCache.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "MBProgressHUD.h"


@interface MoreViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,MFMailComposeViewControllerDelegate>
@property (nonatomic,retain)UITableView *myTableView;
@property (nonatomic,retain)MBProgressHUD *HUD;


@end

@implementation MoreViewController
- (void)dealloc
{
    [_myTableView release];
    [_HUD release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    [self showTabBar];
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self.myTableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[DataBaseSingleton shareDataBase]openDB];
    
    self.navigationItem.title = @"ILoveSet";
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,WIDTH , HEIGHT) style:UITableViewStyleGrouped];
    
    self.myTableView.delegate =self;
    
    self.myTableView.dataSource = self;
    
    [self.myTableView registerClass:[MoreTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.myTableView];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.myTableView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.myTableView.normalBackgroundColor = [UIColor whiteColor];
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.view.normalBackgroundColor = [UIColor whiteColor];
        
        
    }];
    
    [_myTableView release];
 
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0) {
        return 2;
    }else
    {
    
        return 8;
    
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSString *key = [[Singleton shareSingleton].allKeysArray objectAtIndex:indexPath.section];
    
    NSMutableArray *array = [[Singleton shareSingleton].dic objectForKey:key];
    
    MoreModel *model = [array objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"cell";
    
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    cell.model = model;
    
    return cell;
}
-(void)showTabBar
{
    if (self.tabBarController.tabBar.hidden == NO)
    {
       
        return;
    
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    
    self.tabBarController.tabBar.hidden = NO;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section ==0) {
        
        if (indexPath.row == 0) {
            
            [[DataBaseSingleton shareDataBase]openDB];
            
            LandingViewController *landVC =[[LandingViewController alloc]init];
            
            [self.navigationController pushViewController:landVC animated:YES];
            
        }
        if (indexPath.row ==1) {
            
            [[DataBaseSingleton shareDataBase]openDB];

            RegisterViewController *reVC = [[RegisterViewController alloc]init];
            
            [self.navigationController pushViewController:reVC animated:YES];
        
        }
        
    }else
    {
        if (indexPath.row == 0) {
            
            
            if (![MFMailComposeViewController canSendMail]) {
                
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
            
            //     [controller setMessageBody:@"Hello there." isHTML:NO];
            
            [self presentViewController:controller animated:YES completion:^{
                
                ;
                
            }];
            
            [controller release];
       
        }
        else if (indexPath.row == 1)
        {
        
            ImageQualityViewController *imvc = [[ImageQualityViewController alloc]init];
//
            [self.navigationController pushViewController:imvc  animated:YES];
        
        }else if (indexPath.row == 2)
        {
        
            AboutUsViewController *abVC = [[AboutUsViewController alloc]init];
            
            [self.navigationController pushViewController:abVC animated:YES];
            
       }else if (indexPath.row == 3)
        {

            NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
            
            NSString *messageStr = [NSString stringWithFormat:@"缓存大小为: %.1fM, 需要清除缓存么?", [self folderSizeAtPath:path]];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:messageStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [alertView show];
            
            [alertView release];
       
        }else if (indexPath.row == 4)
            
        {
        
        
        
        }else if (indexPath.row == 5)
        {
        
            FriendshipViewController *fir = [[FriendshipViewController alloc]init];
            
            [self.navigationController pushViewController:fir animated:YES];

        
        }else if (indexPath.row ==6)
        {
        
            SCViewController *scVC = [[SCViewController alloc]init];
            
            [self.navigationController pushViewController:scVC animated:YES];
        
        }else
            
        {
//        夜间模式开关
            
                if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight)
                {
                    
                        if ([NSUserDefaults standardUserDefaults]) {
                            
                            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"liudongnight"];
                       
                        }
                    
                        [DKNightVersionManager dawnComing];
                    }
                else
                    {
                        
                        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                        
                        [defaults setObject:@"yes" forKey:@"liudongnight"];
                        
                        [defaults synchronize];
                        
                        [DKNightVersionManager nightFalling];
                    
                    }
            
                    [_myTableView reloadData];
        }
        
    }
    
}
//邮件协议方法
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        
        NSLog(@"It's away!");
        
//        小菊花提示
        self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        
        [self.navigationController.view addSubview:self.HUD];
        
        //显示的文字
        self.HUD.labelText = @"已发送";
        
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
    [self dismissViewControllerAnimated:controller completion:^{
        ;
        
    }];
}

//alertview 点击方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
//        根据路径清除缓存
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
        [self clearCache:path];

    }else
    {
    
        
        
    
    }
    

}
//单个文件大小
-(long long)fileSizeAtPath:(NSString*)filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
    
}
/*整个目录的文件大小*/

-(float)folderSizeAtPath:(NSString *) folderPath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString* fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}
- (void)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
}
@end
