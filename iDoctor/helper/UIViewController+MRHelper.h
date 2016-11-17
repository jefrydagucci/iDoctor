//
//  UIViewController+MRHelper.h
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

extern NSString *MRNotificationDashboardFailReloaded;
extern NSString *MRNotificationDashboardSuccessReloaded;
extern NSString *MRNotificationPortfolioFailReloaded;
extern NSString *MRNotificationPortfolioSuccessReloaded;
extern NSString *MRNotificationCheckLoginAccessId;
extern NSString *MRNotificationUncheckLoginAccessId;
extern NSString *MRNotificationCloseReminder;

#import <UIKit/UIKit.h>

@class PinLogin, MRStatusPopViewController;
@interface UIViewController (MRHelper)

@property (nonatomic, assign) BOOL uncheckAccessid;
@property (nonatomic, retain) UITapGestureRecognizer *tapToDismissRecognizer;
@property (nonatomic, retain) MRStatusPopViewController *currentStatusPopViewController;

#pragma mark - error
- (void)showErrorMessageForOperation:(RKManagedObjectRequestOperation *)operation
                               error:(NSError *)error
                          completion:(void(^)(void))completion;

- (void)showErrorMessage:(NSString *)errorMessage
              completion:(void(^)(void))completion;

#pragma mark - view
- (void)setBackButtonWithTarget:(id)target selector:(SEL)selector;

- (void)setRightBarButtonWithImage:(UIImage *)image
                            target:(id)target
                    actionSelector:(SEL)actionSelector;

- (void)dismissView;

- (void)popViewAnimated;

- (void)popViewAnimated:(BOOL)animated completion:(void(^)(void))completion;

- (void)popToRootViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completion;

#pragma mark - dashboard
- (void)reloadDashboard;

- (void)showDashboardWithPinLogin:(PinLogin *)pinLogin;

#pragma mark - login
- (void)logoutScreen;

#pragma mark - other
- (void)showInController:(UIViewController *)controller;

- (void)close;

- (void)insertBlueBackground;

@end

