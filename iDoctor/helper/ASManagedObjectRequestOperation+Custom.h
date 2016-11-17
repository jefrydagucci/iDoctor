//
//  ASManagedObjectRequestOperation+Custom.h
//
//  Created by Jefry Da Gucci on 10/1/15.
//  Copyright (c) 2015 Appslon. All rights reserved.
//
//

#import "ASManagedObjectRequestOperation.h"

@interface ASManagedObjectRequestOperation (Custom)

typedef void(^ASManagedObjectRequestOperationErrorBlock)(ASManagedObjectRequestOperation *operation, NSError *error);
typedef void(^ASManagedObjectRequestOperationSuccessBlock)(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray);

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
                    statusCodes:(NSIndexSet *)statusCodes;

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
                                      statusCodes:(NSIndexSet *)statusCodes;

@end
