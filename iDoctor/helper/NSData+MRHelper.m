//
//  NSData+MRHelper.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import "NSData+MRHelper.h"
#import "UIViewController+MRHelper.h"

@implementation NSData (MRHelper)

- (NSString *)errorStringFromMRAPIResponse{
    NSString *errorString = @"";
    NSDictionary *jsonResponse = [self toDictionary];
    if(jsonResponse){
        NSArray *allKeys = [jsonResponse allKeys];
        NSString *errKey = @"errors";
        if([allKeys containsObject:errKey]){
            NSArray *errors = jsonResponse[errKey];
            errorString = [errors componentsJoinedByString:@". "];
        }
    }
    return errorString;
}

- (void)showDefaultAPIErrorsInController:(UIViewController *)controller completion:(void(^)(void))completion{
    NSString *errMsg = [self errorStringFromMRAPIResponse];
    if(errMsg.length<=0){ return ; }
    else [controller showErrorMessage:errMsg completion:completion];
}

@end
