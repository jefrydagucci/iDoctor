//
//  NSData+MRHelper.h
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MRHelper)

- (NSString *)errorStringFromMRAPIResponse;

- (void)showDefaultAPIErrorsInController:(UIViewController *)controller completion:(void(^)(void))completion;

@end
