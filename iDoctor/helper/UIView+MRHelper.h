//
//  UIView+MRHelper.h
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/2/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MRHelper)

- (void)addBottomBorderWithHeight:(CGFloat)height color:(UIColor *)color;

- (void)addBottomBorderWithHeight:(CGFloat)height color:(UIColor *)color insets:(UIEdgeInsets)insets;

- (void)addTopBorderWithHeight:(CGFloat)height color:(UIColor *)color;

- (void)addLeftBorderWithWidth:(CGFloat)width color:(UIColor *)color;

- (void)addRightBorderWithWidth:(CGFloat)width color:(UIColor *)color;

- (void)showLoadingWithBlock:(dispatch_block_t)block;

- (void)hideActivityView;

@end

static CGFloat MRKeyboardButtonHeight = 56;

@interface UIView (MRKeyboard)

+ (CGSize)numpadSize;

+ (CGRect)numpadBound;

@end