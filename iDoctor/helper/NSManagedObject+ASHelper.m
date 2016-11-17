//
//  NSManagedObject+ASHelper.m
//  
//
//  Created by Jefry Da Gucci on 2/12/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import "NSManagedObject+ASHelper.h"

@implementation NSManagedObject (ASHelper)

+ (NSDictionary *)mappingDictionaryForEntityInContext:(NSManagedObjectContext *)context{
    
    NSEntityDescription *ent = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
    
    NSArray *keys = [[ent attributesByName] allKeys];
    NSMutableDictionary *objectDict = [[NSMutableDictionary alloc]initWithObjects:keys forKeys:keys];
    
    return objectDict;
}

@end
