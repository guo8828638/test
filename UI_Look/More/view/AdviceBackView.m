//
//  AdviceBackView.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "AdviceBackView.h"
#import "DKNightVersion.h"

@implementation AdviceBackView
- (void)dealloc
{
    [_headLabel release];
    [_inPutField release];
    [super dealloc];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self createSubViews];
        
    }
    
    
    return self;
}
-(void)createSubViews
{

   
    
    self.inPutField  = [[UITextField alloc]initWithFrame:CGRectMake((10*WIDTH)/375, 0, WIDTH, (100*HEIGHT)/667)];
    
    self.inPutField.borderStyle = UITextBorderStyleNone;
    
    self.inPutField.backgroundColor = [UIColor whiteColor];
    
    [self.inPutField becomeFirstResponder];
    
    [self addSubview:self.inPutField];
    
    [_inPutField release];
    
    self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake((10*WIDTH)/375, (10*HEIGHT)/667, WIDTH, (20*HEIGHT)/667)];
    
    //    self.headLabel.backgroundColor = [UIColor redColor];
    
    self.headLabel.text = @"在此输入您的建议，不少于8汉字";
    
    self.headLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.8];
    
    [self addSubview:self.headLabel];
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.headLabel.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.nightBackgroundColor = [UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        self.inPutField.nightBackgroundColor =[UIColor colorWithRed:0.23 green:0.271 blue:0.286 alpha:1.000];
        
        
        
    }];
    
   




}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    NSString *str = [self.inPutField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (str.length < 8) {
        
        return NO;
        
    }else
    {
    
    
        return YES;
    
    }
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
