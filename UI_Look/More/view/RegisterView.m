//
//  RegisterView.m
//  UI_Look
//
//  Created by dllo on 15/11/23.
//  Copyright © 2015年 开发华佗. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView
- (void)dealloc
{
    [_label1 release];
    [_label2 release];
    [_label3 release];
    [_label4 release];
    [_label5 release];
    [_textFileld1 release];
    [_textFileld2 release];
    [_textFileld3 release];
    [_textFileld4 release];
    [_textFileld5 release];
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
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake((20*WIDTH)/375, (100*HEIGHT)/667, (100*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.label1.text = @"用户名：";
    
    [self addSubview:self.label1];
    
    [_label1 release];
    
    self.label2= [[UILabel alloc]initWithFrame:CGRectMake((20*WIDTH)/375, (150*HEIGHT)/667, (100*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.label2.text = @"密码：";
    
    [self addSubview:self.label2];
    
    [_label2 release];
    
    self.label3 = [[UILabel alloc]initWithFrame:CGRectMake((20*WIDTH)/375, (200*HEIGHT)/667, (100*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.label3.text = @"确认密码：";
    
    [self addSubview:self.label3];
    
    [_label3 release];
    
    self.label4 = [[UILabel alloc]initWithFrame:CGRectMake((20*WIDTH)/375, (250*HEIGHT)/667, (100*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.label4.text = @"邮箱：";
    
    [self addSubview:self.label4];
    
    [_label4 release];
    
    self.label5 = [[UILabel alloc]initWithFrame:CGRectMake((20*WIDTH)/375, (300*HEIGHT)/667, (100*WIDTH)/375, (30*HEIGHT)/667)];
    
    self.label5.text = @"联系方式:";
    
    [self addSubview:self.label5];
    
    [_label5 release];
    
    
    
    self.textFileld1 = [[UITextField alloc]initWithFrame:CGRectMake((150*WIDTH)/375, (90*HEIGHT)/667, (150*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.textFileld1.placeholder = @"请输入用户名";
    
    self.textFileld1.borderStyle = UITextBorderStyleRoundedRect;
    
    [self addSubview:self.textFileld1];
    
    [_textFileld1 release];
    
    
    self.textFileld2 = [[UITextField alloc]initWithFrame:CGRectMake((150*WIDTH)/375, (140*HEIGHT)/667, (150*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.textFileld2.placeholder = @"请输入密码";
    
    self.textFileld2.borderStyle = UITextBorderStyleRoundedRect;
    
    [self addSubview:self.textFileld2];
    
    self.textFileld2.secureTextEntry = YES;
    
    [_textFileld2 release];
    
    
    self.textFileld3 = [[UITextField alloc]initWithFrame:CGRectMake((150*WIDTH)/375, (190*HEIGHT)/667, (150*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.textFileld3.placeholder = @"再次输入密码";
    
    self.textFileld3.borderStyle = UITextBorderStyleRoundedRect;
    
    [self addSubview:self.textFileld3];
    
    self.textFileld3.secureTextEntry = YES;
    
    [_textFileld3 release];
    
    
    self.textFileld4 = [[UITextField alloc]initWithFrame:CGRectMake((150*WIDTH)/375, (240*HEIGHT)/667, (150*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.textFileld4.placeholder = @"请输入邮箱";
    
    self.textFileld4.borderStyle = UITextBorderStyleRoundedRect;
    
    [self addSubview:self.textFileld4];
    
    [_textFileld4 release];
    
    
    self.textFileld5 = [[UITextField alloc]initWithFrame:CGRectMake((150*WIDTH)/375, (290*HEIGHT)/667, (150*WIDTH)/375, (40*HEIGHT)/667)];
    
    self.textFileld5.placeholder = @"请输入联系方式";
    
    self.textFileld5.borderStyle = UITextBorderStyleRoundedRect;
    
    [self addSubview:self.textFileld5];
    
    [_textFileld5 release];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
