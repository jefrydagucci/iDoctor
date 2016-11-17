//
//  MRAPIManager.m
//
//
//  Created by Jefry Da Gucci on 4/29/15.
//  Copyright (c) 2015 Appslon (http://appslon.com). All rights reserved.
//

#define API_URL @"http://52.76.85.10"
#define API_VERSION @""
#define API_KEY @"563c6303bc9a6900010000027b9bf9b1352249575b23386b0fc0a8e4"
//#define API_KEY @"563c6303bc9a690001000002f1f834e2238d40ad54f04da037c1ecf0"
static BOOL devMode = 1;

static NSString *sAPIPointAccount           = @"account";
static NSString *sAPIPointKey               = @"key";
static NSString *sAPIPointForgotPassword    = @"forgotpassword";
NSString *sAPIPointLogin                    = @"login";
NSString *sAPIPointPin                      = @"pin";
NSString *sAPIPointDashboard                = @"dashboard";
NSString *sAPIPointReminders                = @"reminders";
NSString *sAPIPointPage                     = @"page";
NSString *sAPIPointId                       = @"id";
NSString *sAPIPointDaysPlaceholder          = @"{days}";

static NSString *sAPIPointTwilio            = @"twilio";
static NSString *sAPIPointValidateNumber    = @"validatenumber";
NSString *sAPIPointOTP                      = @"otp";
static NSString *sAPIPointCommon            = @"common";
NSString *sAPIPointStaticURL                = @"staticurl";
NSString *sAPIPointSubjectList              = @"subjectlist";

#import "MRAPIManager.h"
#import "ASSynthesizeSingleton.h"

@implementation MRAPIManager

ASSynthesizeSingleton(MRAPIManager, sharedInstance)

- (void)setAPIHost:(NSString *)APIHost{
    [[NSUserDefaults standardUserDefaults] setObject:APIHost forKey:@"APIHost"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setAPIVersion:(NSString *)APIVersion{
    [[NSUserDefaults standardUserDefaults] setObject:APIVersion forKey:@"APIVersion"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)APIHost{
    NSString *val = [[NSUserDefaults standardUserDefaults] stringForKey:@"APIHost"];
    if(!val){
        [self APISetup];
    }
    return val.length==0?@"":val;
}

- (NSString *)APIVersion{
    NSString *val = [[NSUserDefaults standardUserDefaults] stringForKey:@"APIVersion"];
    if(!val){
        [self APISetup];
    }
    return val.length==0?@"":val;
}

- (NSString *)APIKey{
    return API_KEY;
}

- (void)APISetup{
    [self setAPIHost:devMode?API_URL:API_URL];
    [self setAPIVersion:devMode?API_VERSION:API_VERSION];
}

#pragma mark - base
- (NSString *)endPointBase{
    return self.APIVersion?[NSString stringWithFormat:@"/%@",
                            self.APIVersion]:@"";
}

#pragma mark - account
- (NSString *)endPointAccount{
    return [NSString stringWithFormat:@"%@/%@",
            [self endPointBase],
            sAPIPointAccount];
}

#pragma mark - login
- (NSString *)endPointLogin{
    return [NSString stringWithFormat:@"%@/%@",
            [self endPointAccount],
            sAPIPointLogin];
}

- (NSString *)endPointLoginPin{
    return [NSString stringWithFormat:@"%@/%@",
            [self endPointLogin],
            sAPIPointPin];
}

#pragma mark - login key
- (NSString *)endPointLoginKey{
    return [NSString stringWithFormat:@"%@/%@",
            [self endPointLogin],
            sAPIPointKey];
}

#pragma mark - forgot password
- (NSString *)endPointForgotPassword{
    return [NSString stringWithFormat:@"%@/%@",
            [self endPointAccount],
            sAPIPointForgotPassword];
}

#pragma mark - phone validation
- (NSString *)endPointPhoneValidation{
    return [NSString stringWithFormat:@"/%@/%@",
            sAPIPointTwilio,
            sAPIPointValidateNumber];
}

#pragma mark - MRStaticUrls
- (NSString *)endPointStaticUrls{
    return [NSString stringWithFormat:@"%@/%@",
            sAPIPointCommon,
            sAPIPointStaticURL];
}

@end
