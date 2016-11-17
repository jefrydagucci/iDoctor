//
//  ASManagedObjectRequestOperation+Custom.m
//
//  Created by Jefry Da Gucci on 10/1/15.
//  Copyright (c) 2015 Appslon. All rights reserved.
//
//

#import "ASManagedObjectRequestOperation+Custom.h"
#import "MRError+Mapping.h"

@implementation ASManagedObjectRequestOperation (Custom)

+ (instancetype)initWithBaseURL:(NSURL *)baseURL
                        mapping:(RKEntityMapping *)requestMapping
                    pathPattern:(NSString *)pathPattern
                         params:(NSDictionary *)params
                         method:(RKRequestMethod)requestMethod
                        keyPath:(NSString *)keyPath
                timeoutInterval:(NSTimeInterval)timeoutInterval
             managedObjectStore:(RKManagedObjectStore *)managedObjectStore
                   requestBlock:(void (^)(NSMutableURLRequest *request,
                                          NSMutableArray *responseDesriptors))requestBlock
                    statusCodes:(NSIndexSet *)statusCodes{
    
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:baseURL];
    
    NSMutableURLRequest *request = [manager requestWithObject:self method:requestMethod path:pathPattern parameters:params];
    [request setTimeoutInterval:timeoutInterval];
    
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:requestMapping
                                                 method:requestMethod
                                            pathPattern:pathPattern
                                                keyPath:keyPath
                                            statusCodes:statusCodes];
    
    RKEntityMapping *errorMapping = [MRError baseObjectMappingWithObjectStore:managedObjectStore];
    NSIndexSet *clientErrorStatusCodes  = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    RKResponseDescriptor *clientErrorResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:errorMapping
                                                 method:requestMethod
                                            pathPattern:pathPattern
                                                keyPath:nil
                                            statusCodes:clientErrorStatusCodes];
    NSIndexSet *serverErrorStatusCodes  = RKStatusCodeIndexSetForClass(RKStatusCodeClassServerError);
    RKResponseDescriptor *serverErrorErrorResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:errorMapping
                                                 method:requestMethod
                                            pathPattern:pathPattern
                                                keyPath:nil
                                            statusCodes:serverErrorStatusCodes];
    
    NSMutableArray *responseDesriptors = [NSMutableArray new];
    [responseDesriptors addObject:responseDescriptor];
    [responseDesriptors addObject:clientErrorResponseDescriptor];
    [responseDesriptors addObject:serverErrorErrorResponseDescriptor];
    
    !requestBlock?:requestBlock(request, responseDesriptors);
    
    [manager addResponseDescriptorsFromArray:responseDesriptors];
    
    manager.managedObjectStore = managedObjectStore;
    
    ASManagedObjectRequestOperation *operation  = [[ASManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:responseDesriptors];
    
    operation.managedObjectContext  = managedObjectStore.persistentStoreManagedObjectContext;
    operation.managedObjectCache    = managedObjectStore.managedObjectCache;
    return operation;
    
}

+ (instancetype)multipartFormOperationWithBaseURL:(NSURL *)baseURL
                                          mapping:(RKEntityMapping *)requestMapping
                                      pathPattern:(NSString *)pathPattern
                                           params:(NSDictionary *)params
                                           method:(RKRequestMethod)requestMethod
                                          keyPath:(NSString *)keyPath
                                  timeoutInterval:(NSTimeInterval)timeoutInterval
                               managedObjectStore:(RKManagedObjectStore *)managedObjectStore
                        constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
                                     requestBlock:(void(^)(NSMutableURLRequest *request,
                                                           NSMutableArray *responseDesriptors))requestBlock
                                      statusCodes:(NSIndexSet *)statusCodes{
    
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:baseURL];
    
    NSMutableURLRequest *request = [manager multipartFormRequestWithObject:self method:requestMethod path:pathPattern parameters:params constructingBodyWithBlock:multipartBlock];
    
    [request setTimeoutInterval:timeoutInterval];
    
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:requestMapping
                                                 method:requestMethod
                                            pathPattern:pathPattern
                                                keyPath:keyPath
                                            statusCodes:statusCodes];
    
    RKEntityMapping *errorMapping = [MRError baseObjectMappingWithObjectStore:managedObjectStore];
    NSIndexSet *clientErrorStatusCodes  = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    RKResponseDescriptor *clientErrorResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:errorMapping
                                                 method:requestMethod
                                            pathPattern:pathPattern
                                                keyPath:nil
                                            statusCodes:clientErrorStatusCodes];
    NSIndexSet *serverErrorStatusCodes  = RKStatusCodeIndexSetForClass(RKStatusCodeClassServerError);
    RKResponseDescriptor *serverErrorErrorResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:errorMapping
                                                 method:requestMethod
                                            pathPattern:pathPattern
                                                keyPath:nil
                                            statusCodes:serverErrorStatusCodes];
    
    NSMutableArray *responseDesriptors = [NSMutableArray new];
    [responseDesriptors addObject:responseDescriptor];
    [responseDesriptors addObject:clientErrorResponseDescriptor];
    [responseDesriptors addObject:serverErrorErrorResponseDescriptor];
    
    !requestBlock?:requestBlock(request, responseDesriptors);
    
    [manager addResponseDescriptorsFromArray:responseDesriptors];
    
    manager.managedObjectStore = managedObjectStore;
    
    ASManagedObjectRequestOperation *operation  = [[ASManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:responseDesriptors];
    
    operation.managedObjectContext  = managedObjectStore.persistentStoreManagedObjectContext;
    operation.managedObjectCache    = managedObjectStore.managedObjectCache;
    return operation;
}

@end
