//
//  YKFindCarView.m
//  AutocCarApp
//
//  Created by dllo on 15/11/25.
//  Copyright © 2015年 尹凯. All rights reserved.
//

#import "YKFindCarView.h"

@implementation YKFindCarView

- (void)dealloc{
    [_car release];
    [_dic release];
    [_myTableView release];
    [_segmentC release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.bounds.size.width, self.bounds.size.height - 40) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self addSubview:self.myTableView];
    [_myTableView release];
    
    [self.myTableView registerClass:[YKFindCarDetailTableViewCell class] forCellReuseIdentifier:@"xcell"];
    
    NSArray *array = [NSArray arrayWithObjects:@"在售", @"全部", nil];
    self.segmentC = [[UISegmentedControl alloc] initWithItems:array];
    [self.segmentC setTintColor:[UIColor blackColor]];
    self.segmentC.backgroundColor = [UIColor whiteColor];
    self.segmentC.frame = CGRectMake(0, 0, 225, 40);
    [self addSubview:self.segmentC];
    self.segmentC.selectedSegmentIndex = 0;
    [_segmentC release];
    
    [self.segmentC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:rightSwipeGestureRecognizer];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender{
    [UIView animateWithDuration:0.3 animations:^{
       self.frame = CGRectMake(375, 64, 225, 603 - 49);
    }];
    [self.dic removeAllObjects];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"hahaha");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"xixixixi");
}

//- (void)panAction:(UIPanGestureRecognizer *)pan{
//    CGPoint begin = [pan locationInView:self];
//    CGPoint
//    
//    self.frame = CGRectMake(self.frame.origin.x - begin.x, 64, 225, 603 - 49);
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 225, 25)] autorelease];
    headView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.9];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 255, 25)];
    NSString *sectionTitle = [self.dic.allKeys objectAtIndex:section];
    label.text = sectionTitle;
    [headView addSubview:label];
    [label release];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (void)segmentAction:(UISegmentedControl *)segment{
    if (segment.selectedSegmentIndex == 0) {
        [self.YKFindViewDelegate changeMi:self.this];
    }
    if(segment.selectedSegmentIndex == 1){
        [self.YKFindViewDelegate changeNi:self.this];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dic.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = [self.dic.allKeys objectAtIndex:section];
    NSMutableArray *array = [self.dic objectForKey:key];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"xcell";
    YKFindCarDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSString *key = [self.dic.allKeys objectAtIndex:indexPath.section];
    NSMutableArray *array = [self.dic objectForKey:key];
    
    YKDetailCar *car = [array objectAtIndex:indexPath.row];
    
    cell.car = car;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)setDic:(NSMutableDictionary *)dic{
    if (_dic != dic) {
        [_dic release];
        _dic = [dic retain];
    }
    [self.myTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = [self.dic.allKeys objectAtIndex:indexPath.section];
    NSMutableArray *array = [self.dic objectForKey:key];
    
    YKDetailCar *car = [array objectAtIndex:indexPath.row];
    [self.YKFindViewDelegate carInfoGo:car];
    NSLog(@"=====%@", car.carId);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
