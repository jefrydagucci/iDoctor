//
//  NSManagedObject+Mapping.h
//  
//
//  Created by Jefry Da Gucci on 2/12/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import <CoreData/CoreData.h>
extern NSString *kKeyOrderId;

@class RKEntityMapping, RKManagedObjectStore;
@interface NSManagedObject (Mapping)

+ (NSDictionary *)entityMappingDictionaryInManagedObjectContext:(NSManagedObjectContext *)context;

+ (RKEntityMapping *)standardObjectMappingWithObjectStore:(RKManagedObjectStore *)objectStore
                                     managedObjectcontext:(NSManagedObjectContext *)context;

+ (RKEntityMapping *)fullObjectMappingWithObjectStore:(RKManagedObjectStore *)objectStore
                                 managedObjectcontext:(NSManagedObjectContext *)context;

+ (NSArray *)uniqueKeys;

+ (NSDictionary *)changedProperties;

@end
