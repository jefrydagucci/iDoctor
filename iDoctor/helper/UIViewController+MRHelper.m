//
//  UIViewController+MRHelper.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

static NSString *uncheckAccessIdKey = @"uncheckAccessIdKey";
static NSString *currentStatusPopViewControllerKey = @"currentStatusPopViewControllerKey";
static NSString *tapToDismissKeyboardKey = @"tapToDismissKeyboardKey";

NSString *MRNotificationDashboardFailReloaded       = @"MRNotificationDashboardFailReloaded";
NSString *MRNotificationDashboardSuccessReloaded    = @"MRNotificationDashboardSuccessReloaded";
NSString *MRNotificationPortfolioFailReloaded       = @"MRNotificationPortfolioFailReloaded";
NSString *MRNotificationPortfolioSuccessReloaded    = @"MRNotificationPortfolioSuccessReloaded";
NSString *MRNotificationCheckLoginAccessId          = @"MRNotificationCheckLoginAccessId";
NSString *MRNotificationUncheckLoginAccessId        = @"MRNotificationUncheckLoginAccessId";
NSString *MRNotificationCloseReminder               = @"MRNotificationCloseReminder";

#import "UIViewController+MRHelper.h"
#import "NSData+MRHelper.h"
#import "MRError.h"

@implementation UIViewController (MRHelper)
@dynamic tapToDismissRecognizer;

#pragma mark - view
- (void)setBackButtonWithTarget:(id)target selector:(SEL)selector{
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:target action:selector];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)setRightBarButtonWithImage:(UIImage *)image
                            target:(id)target
                    actionSelector:(SEL)actionSelector{
    
    UIButton *btnClose = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btnClose addTarget:target action:actionSelector forControlEvents:UIControlEventTouchUpInside];
    
    [btnClose setImage:image  forState:UIControlStateNormal];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:btnClose]];
}

- (void)dismissView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - action
- (IBAction)popView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popViewAnimated{
    [self popViewAnimated:YES completion:nil];
}

- (void)popViewAnimated:(BOOL)animated completion:(void(^)(void))completion{
    [self.navigationController popViewControllerAnimated:animated];
    !completion?:completion();
}

- (void)popToRootViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completion{
    [self.navigationController popToRootViewControllerAnimated:animated];
    !completion?:completion();
}

#pragma mark - other
- (void)showInController:(UIViewController *)controller{
    
    [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self.view];
    if(self.view.superview){
        self.view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    }
    if(controller){
        [controller addChildViewController:self];
        [self didMoveToParentViewController:controller];
    }
    
    UIView *dialogView = self.view;
    
    dialogView.layer.opacity = 0.5f;
    dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         dialogView.layer.opacity = 1.0f;
                         dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
                     }
                     completion:NULL
     ];
}

- (void)close{
    UIView *dialogView = self.view;
    CATransform3D currentTransform = dialogView.layer.transform;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        CGFloat startRotation = [[dialogView valueForKeyPath:@"layer.transform.rotation.z"] floatValue];
        CATransform3D rotation = CATransform3DMakeRotation(-startRotation + M_PI * 270.0 / 180.0, 0.0f, 0.0f, 0.0f);
        
        dialogView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1));
    }
    
    dialogView.layer.opacity = 1.0f;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone|UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         dialogView.layer.opacity = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         for (UIView *v in [self.view subviews]) {
                             [v removeFromSuperview];
                         }
                         [self.view removeFromSuperview];
                     }
     ];
}

@end
