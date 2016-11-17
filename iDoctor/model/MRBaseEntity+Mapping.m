//
//  MRBaseEntity+Mapping.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 11/18/15.
//  Copyright © 2015 Appslon http://appslon.com . All rights reserved.
//

#import "MRBaseEntity+Mapping.h"
#import "MRDatabaseManager.h"

@implementation MRBaseEntity (Mapping)

+ (NSDictionary *)baseObjectMappingDictionary{
    NSDictionary *parentDict = [super baseObjectMappingDictionary];
    
    NSEntityDescription *ent = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:[MRDatabaseManager sharedInstance].managedObjectContext];
    NSArray *keys = [[ent attributesByName] allKeys];
    NSMutableDictionary *objectDict = [[NSMutableDictionary alloc]initWithObjects:keys forKeys:keys];
    [objectDict addEntriesFromDictionary:parentDict];
    
    return objectDict;
}

+ (RKEntityMapping *)baseObjectMappingWithObjectStore:(RKManagedObjectStore *)objectStore{
    RKEntityMapping *mapping = [super baseObjectMappingWithObjectStore:objectStore];
    return mapping;
}

@end
