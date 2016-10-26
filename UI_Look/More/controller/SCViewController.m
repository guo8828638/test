//
//  SCViewController.m
//  UI_Look
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "SCViewController.h"
#import "DataBaseSingleton.h"
#import "TalkModel.h"
#import "SCTableViewCell.h"
#import "TalkDetailViewController.h"
#import "DKNightVersion.h"

@interface SCViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *myTableView;
@end

@implementation SCViewController
- (void)dealloc
{
    [_myTableView release];
    [super dealloc];
}
-(void)viewWillAppear:(BOOL)animated
{

    [[DataBaseSingleton shareDataBase]openDB];
    
  self.SCarray = [[DataBaseSingleton shareDataBase]selectSC];
    
    if (self.SCarray.count != 0) {
        
        self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
        
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.myTableView registerClass:[SCTableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [self.view addSubview:self.myTableView];
        
        self.myTableView.delegate = self;
        
        self.myTableView.dataSource = self;
        
        [self.view bringSubviewToFront:self.myTableView];
        
        
    }else
    {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IconEmptyFav@2x~iphone.png"]];
        
        imageView.frame = CGRectMake(WIDTH/3, HEIGHT/3, 150*WIDTH/375, 150*HEIGHT/667);
        
        [label addSubview:imageView];
        
        [self.view addSubview:label];
        
        
        
        
    }

    
    [self hideTabBar];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftbuttonAction:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"WATCHFAV";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[DataBaseSingleton shareDataBase]openDB];
    
    self.SCarray = [[DataBaseSingleton shareDataBase]selectSC];
    
    if (self.SCarray.count != 0) {
        
        self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
        
        [self.myTableView registerClass:[SCTableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [self.view addSubview:self.myTableView];
        
        self.myTableView.delegate = self;
        
        self.myTableView.dataSource = self;
        
        [self.view bringSubviewToFront:self.myTableView];
        
        
    }else
    {
        
       self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        
         self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IconEmptyFav@2x~iphone.png"]];
        
         self.imageView.frame = CGRectMake(WIDTH/3, HEIGHT/3, 150*WIDTH/375, 150*HEIGHT/667);
        
        [ self.label addSubview:self.imageView];
        
        [self.view addSubview:self.label];
        
        
        
        
    }
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        
        self.view.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.myTableView.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.label.nightBackgroundColor =[UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.imageView.nightBackgroundColor= [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];

        
    
    }];


    
    
    
    

}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.myTableView setEditing:editing animated:animated];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
       return YES;
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return UITableViewCellEditingStyleDelete;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[DataBaseSingleton shareDataBase]openDB];
        
        TalkModel *model = [self.SCarray objectAtIndex:indexPath.row];
        
        [[DataBaseSingleton shareDataBase]deleteTalkmodel:model];
        
        [self.SCarray removeObject:model];
       
        //删除cell
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        
        NSMutableArray *arraysc = [[DataBaseSingleton shareDataBase]selectSC];
        
        if (arraysc.count ==0) {
            
            [self reload];
            
            
        }
        
        
        
    }


}
-(void)reload{

    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IconEmptyFav@2x~iphone.png"]];
    
    imageView.frame = CGRectMake(WIDTH/3, HEIGHT/3, 150*WIDTH/375, 150*HEIGHT/667);
    
    [label addSubview:imageView];
    
    [self.view addSubview:label];
    
    
}
//设置删除按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"确认?";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.SCarray.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   static NSString *cellIdentifier =  @"cell";
    
    SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    TalkModel *model = [self.SCarray objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    NSLog(@"===%@",model.title);

    
    return cell;
    
    


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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return (130*HEIGHT)/667;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TalkDetailViewController *talkVC = [[TalkDetailViewController alloc]init];
    
     TalkModel *model =  [self.SCarray objectAtIndex:indexPath.row];
    
    talkVC.model = model;
    
    [self.navigationController pushViewController:talkVC animated:YES];
    


}
-(void)leftbuttonAction:(UIBarButtonItem *)btn
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
