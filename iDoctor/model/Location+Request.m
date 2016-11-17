//
//  Location+Request.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/17/16.
//  Copyright © 2016 Appslon. All rights reserved.
//


typedef enum {
    LocationRequestTypeGet  = 0
}LocationRequestType;

#import "Location+Request.h"

@implementation Location (Request)

@end

#import "NSManagedObject+ASManagedObjectRequestOperation.h"
#import "NSMutableURLRequest+MRHelper.h"
#import "MRParams.h"
#import "MRAPIManager.h"
#import "MRDatabaseManager.h"

@implementation Location (Request)

#pragma mark - GET request
+ (void)getLocationWithPathPattern:(NSString *)pathPattern
                           success:(void(^)(ASManagedObjectRequestOperation *operation,
                                            RKMappingResult *result,
                                            Location *Location))success
                           failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                            NSError *error))failure{
    
    NSString *baseURLString     = [MRAPIManager sharedInstance].APIHost;
    pathPattern = pathPattern?pathPattern:@"";
    
    NSString *keyPath = nil;
    NSIndexSet *statusCodes     = [[self class] statusCodesForLocationRequestType:LocationRequestTypeGet];
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    !language?:[params setObject:language forKey:sParamLanguage];
    
    pathPattern = [pathPattern stringByReplacingOccurrencesOfString:sParamIdPlaceholder withString:productId];
    
    RKManagedObjectStore *managedObjectStore        = [MRDatabaseManager sharedInstance].managedObjectStore;
    NSManagedObjectContext *managedObjectContext    = [MRDatabaseManager sharedInstance].managedObjectContext;
    
    [[self class] getWithBaseURL:baseURLString params:params pathPattern:pathPattern keyPath:keyPath managedObjectStore:managedObjectStore managedObjectContext:managedObjectContext statusCodes:statusCodes isMultipartRequest:NO constructingBodyWithBlock:nil requestBlock:^(NSMutableURLRequest *request, NSMutableArray *responseDesriptors) {
        
        [request setAPIKey];
        
    } success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
        !success?:success(operation, result, resultsArray.firstObject);
    } failure:failure];
}

+ (NSIndexSet *)statusCodesForLocationRequestType:(LocationRequestType)LocationRequestType{
    return RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
}

@end