//
//  MBProgressHUD+show.m
//  吖吖微博
//
//  Created by dllo on 15/8/15.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "MBProgressHUD+show.h"

@implementation MBProgressHUD (show)

+ (void)showErrorWithText:(NSString *)text{
    
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    hub.mode = MBProgressHUDModeCustomView;
    hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgressHUD.bundle/error.png"]];
    hub.labelText = text;
    hub.removeFromSuperViewOnHide = YES;
    
    [hub hide:YES afterDelay:2.0];
}

+ (void)showSuccessWithText:(NSString *)text{
    
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hub.mode = MBProgressHUDModeCustomView;
    hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgressHUD.bundle/success@2x.png"]];
    hub.labelText = text;
    hub.removeFromSuperViewOnHide = YES;
    
    [hub hide:YES afterDelay:0.7];
}

@end
