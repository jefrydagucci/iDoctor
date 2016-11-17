//
//  NSMutableURLRequest+MRHelper.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 11/18/15.
//  Copyright © 2015 Appslon http://appslon.com . All rights reserved.
//

#import "NSMutableURLRequest+MRHelper.h"
#import "MRAPIManager.h"
#import "MRParams.h"

@implementation NSMutableURLRequest (MRHelper)

- (void)setAPIKey{
    [self setValue:[MRAPIManager sharedInstance].APIKey forHTTPHeaderField:sParamHeaderAPIKey];
}

@end
