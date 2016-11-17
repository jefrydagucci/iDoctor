//
//  NSManagedObject+Mapping.m
//  
//
//  Created by Jefry Da Gucci on 2/12/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import "NSManagedObject+Mapping.h"
#import "NSManagedObject+ASHelper.h"
#import <RestKit/RestKit.h>

static NSString *kKeyObjectId   = @"obj_id";
static NSString *kKeyObjectDesc = @"obj_description";
static NSString *kKeyObjectnew  = @"obj_new";

static NSString *kKeySwitch     = @"switchs";
NSString *kKeyOrderId    = @"order_id";
static NSString *kKeyCutOffMessage  = @"cut_off_message";
static NSString *kKeyNewOrder   = @"new_order";
static NSString *kKeyConsolidatedURL    = @"consolidated_url";

@implementation NSManagedObject (Mapping)

+ (NSDictionary *)entityMappingDictionaryInManagedObjectContext:(NSManagedObjectContext *)context{
    
    NSMutableDictionary *dict = [self mappingDictionaryForEntityInContext:context].mutableCopy;
    
    NSDictionary *changedProperties = [[self class] changedProperties];
    NSArray *keysToRemove = [changedProperties allKeys];
    for(NSString *key in keysToRemove){
        if([[dict allKeys]containsObject:key]){
            [dict removeObjectForKey:key];
            [dict setObject:key forKey:changedProperties[key]];
        }
    }
    
    return dict;
}

+ (NSDictionary *)changedProperties{
    return @{kKeyObjectId:@"id",
             kKeyObjectDesc:@"description",
             kKeyObjectnew:@"new",
             kKeySwitch:@"switch",
             kKeyOrderId:@"order-id",
             kKeyCutOffMessage:@"cut-off-message",
             kKeyNewOrder:@"new-order",
             kKeyConsolidatedURL:@"consolidated-url",
             @"register_url": @"register-url",
             @"faq_url": @"faq-url",
             @"privacy_url": @"privacy-url",
             @"contact_us_url": @"contact_us-url",
             @"terms_n_cond_url": @"terms_n_cond-url",
             @"payment_policy_url": @"payment_policy-url",
             @"how_to_pay_url": @"how_to_pay-url",
             @"otp_help_url": @"otp_help-url",
             @"call_center_phone": @"call_center-phone",
             @"view_profile_url":@"view-profile-url"};
}

+ (RKEntityMapping *)standardObjectMappingWithObjectStore:(RKManagedObjectStore *)objectStore
                                     managedObjectcontext:(NSManagedObjectContext *)context{
    
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([self class]) inManagedObjectStore:objectStore];
    
    NSMutableDictionary *dict = [[self class] entityMappingDictionaryInManagedObjectContext:context].mutableCopy;
    [mapping addAttributeMappingsFromDictionary:dict];
    
    NSArray *values = [dict allValues];
    if([values containsObject:kKeyObjectId]){
        mapping.identificationAttributes = @[kKeyObjectId];
    }
    else if([[self class] uniqueKeys].count){
        NSMutableArray *existingPrimaryKeys = mapping.identificationAttributes?[NSMutableArray arrayWithArray:mapping.identificationAttributes]:[NSMutableArray new];
        [existingPrimaryKeys addObjectsFromArray:[[self class] uniqueKeys]];
        mapping.identificationAttributes = existingPrimaryKeys;
    }
    
    return mapping;
}

+ (RKEntityMapping *)fullObjectMappingWithObjectStore:(RKManagedObjectStore *)objectStore
                                 managedObjectcontext:(NSManagedObjectContext *)context{
    
    RKEntityMapping *mapping = [[self class] standardObjectMappingWithObjectStore:objectStore managedObjectcontext:context];
    
    NSEntityDescription *ent = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
    
    NSDictionary *relationships = [ent relationshipsByName];
    NSArray *relationshipKeys = [relationships allKeys];
    
    for(NSString *relationshipKey in relationshipKeys){
        NSRelationshipDescription *relation = relationships[relationshipKey];
        NSEntityDescription *entity = relation.destinationEntity;
        
        NSString *className = [entity managedObjectClassName];
        Class entityClass = NSClassFromString(className);
        
        NSDictionary *changedProperties = [[self class] changedProperties];
        NSArray *keysToRemove = [changedProperties allKeys];
        
        NSString *properRelationshipKey = relationshipKey;
        
        if([keysToRemove containsObject:relationshipKey]){
            properRelationshipKey = [changedProperties objectForKey:relationshipKey];
        }
        
        if([entityClass isSubclassOfClass:[NSManagedObject class]]){
            
            RKEntityMapping *standardMapping = [entityClass fullObjectMappingWithObjectStore:objectStore managedObjectcontext:context];
            
            RKRelationshipMapping *newRelationMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:relationshipKey toKeyPath:relationshipKey withMapping:standardMapping];
            
            NSArray *mappedKeyPaths = [mapping.relationshipMappings valueForKey:@"destinationKeyPath"];
            if(![mappedKeyPaths containsObject:newRelationMapping.destinationKeyPath]){
                [mapping addPropertyMapping:newRelationMapping];
            }
        }
    }
    
    
    return mapping;
}

+ (NSArray *)uniqueKeys{
    return nil;
}

@end
