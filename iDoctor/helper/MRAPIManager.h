//
//  MRAPIManager.h
//
//
//  Created by Jefry Da Gucci on 4/29/15.
//  Copyright (c) 2015 Appslon (http://appslon.com). All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *sAPIPointPin;
extern NSString *sAPIPointDashboard;
extern NSString *sAPIPointLogin;
extern NSString *sAPIPointReminders;
extern NSString *sAPIPointPage;
extern NSString *sAPIPointId;
extern NSString *sAPIPointDaysPlaceholder;
extern NSString *sAPIPointOTP;
extern NSString *sAPIPointStaticURL;
extern NSString *sAPIPointSubjectList;

@interface MRAPIManager : NSObject

@property (nonatomic, strong) NSString *APIHost;
@property (nonatomic, strong) NSString *APIVersion;
@property (nonatomic, strong, readonly) NSString *APIKey;

+ (instancetype)sharedInstance;

- (void)APISetup;

- (NSString *)endPointBase;

#pragma mark - login
- (NSString *)endPointLogin;

- (NSString *)endPointLoginPin;

#pragma mark - login key
- (NSString *)endPointLoginKey;

#pragma mark - forgot password
- (NSString *)endPointForgotPassword;

#pragma mark - phone validation
- (NSString *)endPointPhoneValidation;

#pragma mark - MRStaticUrls
- (NSString *)endPointStaticUrls;

@end
