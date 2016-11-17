//
//  NSString+ASHelper.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/2/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import "NSString+ASHelper.h"

@implementation NSString (ASHelper)

- (NSString *)firstLetterCapitalizedString{
    NSString *capitalized = [[[self substringToIndex:1] uppercaseString] stringByAppendingString:[self substringFromIndex:1]];
    return capitalized;
}

- (unsigned int)hexInt{
    unsigned int outVal;
    NSString *hex = self.length<=8?[self stringByAppendingString:@"FF"]:self;
    NSMutableString *strCpy = hex.mutableCopy;
    
    [strCpy replaceOccurrencesOfString:@"#" withString:@"" options:0 range:NSMakeRange(0, strCpy.length)];
    hex = strCpy;
    
    NSScanner* scanner = [NSScanner scannerWithString:hex];
    [scanner scanHexInt:&outVal];
    
    return outVal;
}

@end
