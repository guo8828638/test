//
//  VideoDetailViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/27.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "VideoDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface VideoDetailViewController ()<AVPlayerViewControllerDelegate>
@property (nonatomic,retain)AVPlayer *player;
@property (nonatomic,assign)BOOL isPlay;
@property (nonatomic,retain)UISlider *volume;
@property (nonatomic, retain) AVPlayerViewController *moviePlayer;  //播放器

@end

@implementation VideoDetailViewController
- (void)dealloc
{
    [_model release];
    [_player release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{




}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
   
    NSArray *array = [self.model.link_video componentsSeparatedByString:@"#"];
    
    NSString *str1 = array[0];
    
    NSLog(@"%@",str1);
    
    self.moviePlayer = [[AVPlayerViewController alloc]init];
    
    self.moviePlayer.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:self.moviePlayer.view];
    
    self.moviePlayer.player = [AVPlayer playerWithURL:[NSURL URLWithString:str1]];
    
    [_moviePlayer release];
    
    
    
    
    //    返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.frame = CGRectMake(5*WIDTH/375, 20*HEIGHT/667, 30*WIDTH/375, 30*HEIGHT/667);
    
    backButton.backgroundColor = [UIColor clearColor];
    
    [backButton setBackgroundImage:[UIImage imageNamed:@"iconfont-fanhui.png"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
    

    
}
-(void)backButtonAction:(UIButton *)btn
{

    [self.moviePlayer.player pause];

    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];

    
    
    
    
    

}
//手机屏幕横过来
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    
    return  UIInterfaceOrientationLandscapeRight;
    
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
