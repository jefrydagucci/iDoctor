//
//  UIView+MRHelper.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/2/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import "UIView+MRHelper.h"
#import "NSString+MRHelper.m"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation UIView (MRHelper)

- (void)addBottomBorderWithHeight:(CGFloat)height color:(UIColor *)color{
    [self addBottomBorderWithHeight:height color:color insets:UIEdgeInsetsZero];
}

- (void)addBottomBorderWithHeight:(CGFloat)height color:(UIColor *)color insets:(UIEdgeInsets)insets{
    UIView *border          = [UIView new];
    border.backgroundColor  = color;
    border.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:border];
    [border sdc_alignEdgesWithSuperview:UIRectEdgeLeft|UIRectEdgeBottom|UIRectEdgeRight insets:insets];
    [border sdc_pinHeight:height];
}

- (void)addTopBorderWithHeight:(CGFloat)height color:(UIColor *)color{
    UIView *border          = [UIView new];
    border.backgroundColor  = color;
    border.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:border];
    [border sdc_alignEdgesWithSuperview:UIRectEdgeLeft|UIRectEdgeTop|UIRectEdgeRight];
    [border sdc_pinHeight:height];
}

- (void)addLeftBorderWithWidth:(CGFloat)width color:(UIColor *)color{
    UIView *border          = [UIView new];
    border.backgroundColor  = color;
    border.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:border];
    [border sdc_alignEdgesWithSuperview:UIRectEdgeLeft|UIRectEdgeTop|UIRectEdgeBottom];
    [border sdc_pinWidth:width];
}

- (void)addRightBorderWithWidth:(CGFloat)width color:(UIColor *)color{
    UIView *border          = [UIView new];
    border.backgroundColor  = color;
    border.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:border];
    [border sdc_alignEdgesWithSuperview:UIRectEdgeTop|UIRectEdgeRight|UIRectEdgeBottom];
    [border sdc_pinWidth:width];
}

- (void)showLoadingWithBlock:(dispatch_block_t)block{
//    [self showActivityView];
//    self.rn_activityView.labelFont = FONT_REGULAR(12);
//    self.rn_activityView.color = [UIColor clearColor];
//    self.rn_activityView.dimBackground = NO;
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    [SVProgressHUD setForegroundColor:[UIColor lightGrayColor]];
    [SVProgressHUD setRingThickness:7];
    [SVProgressHUD setRingRadius:15];
    [SVProgressHUD setRingNoTextRadius:15];
    [SVProgressHUD show];
    
    
    !block?:block();
}

- (void)hideActivityView{
    [SVProgressHUD dismiss];
}

@end

@implementation UIView (MRKeyboard)

+ (CGSize)numpadSize{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, MRKeyboardButtonHeight*4);
}

+ (CGRect)numpadBound{
    CGSize numpadSize = [[self class] numpadSize];
    return CGRectMake(0, 0, numpadSize.width, numpadSize.height);
}

@end
