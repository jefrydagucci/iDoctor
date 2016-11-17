//
//  ASLogManager+NSData.m
//
//
//  Created by Jefry Da Gucci on 4/29/15.
//  Copyright (c) 2015 Appslon (http://appslon.com). All rights reserved.
//

#import "ASLogManager+NSData.h"

@implementation ASLogManager (NSData)

+ (void)logJSONResponseData:(NSData *)responseData{
#ifdef DEBUG
    id resp = [NSString stringWithFormat:@"JSON response : %@", [responseData toDictionary]];
    ASLog(resp);
#endif
}

@end
