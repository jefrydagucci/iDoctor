//
//  NSManagedObject+ASManagedObjectRequestOperation.m
//  
//
//  Created by Jefry Da Gucci on 2/18/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import "NSManagedObject+ASManagedObjectRequestOperation.h"
#import "NSManagedObject+Mapping.h"
#import "ASManagedObjectRequestOperation+Custom.h"
#import "ASLogManager+NSData.h"

@implementation NSManagedObject (ASManagedObjectRequestOperation)

#pragma mark - GET request
+ (void)getWithBaseURL:(NSString *)baseURLString
                params:(NSDictionary *)params
           pathPattern:(NSString *)pathPattern
               keyPath:(NSString *)keyPath
    managedObjectStore:(RKManagedObjectStore *)managedObjectStore
  managedObjectContext:(NSManagedObjectContext *)managedObjectContext
           statusCodes:(NSIndexSet *)statusCodes
    isMultipartRequest:(BOOL)isMultipartRequest
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
          requestBlock:(void(^)(NSMutableURLRequest *request,
                                NSMutableArray *responseDesriptors))requestBlock
               success:(void(^)(ASManagedObjectRequestOperation *operation,
                                RKMappingResult *result,
                                NSArray *resultsArray))success
               failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                NSError *error))failure{
    
    [[self class] requestWithParams:params baseURLString:baseURLString pathPattern:pathPattern keyPath:keyPath requestMethod:RKRequestMethodGET managedObjectStore:managedObjectStore managedObjectContext:managedObjectContext statusCodes:statusCodes isMultipartRequest:isMultipartRequest constructingBodyWithBlock:multipartBlock requestBlock:requestBlock success:success failure:failure];
}

#pragma mark - POST request
+ (void)postWithBaseURL:(NSString *)baseURLString
                 params:(NSDictionary *)params
            pathPattern:(NSString *)pathPattern
                keyPath:(NSString *)keyPath
     managedObjectStore:(RKManagedObjectStore *)managedObjectStore
   managedObjectContext:(NSManagedObjectContext *)managedObjectContext
            statusCodes:(NSIndexSet *)statusCodes
     isMultipartRequest:(BOOL)isMultipartRequest
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
           requestBlock:(void(^)(NSMutableURLRequest *request,
                                 NSMutableArray *responseDesriptors))requestBlock
                success:(void(^)(ASManagedObjectRequestOperation *operation,
                                 RKMappingResult *result,
                                 NSArray *resultsArray))success
                failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                 NSError *error))failure{
    
    [[self class] requestWithParams:params baseURLString:baseURLString pathPattern:pathPattern keyPath:keyPath requestMethod:RKRequestMethodPOST managedObjectStore:managedObjectStore managedObjectContext:managedObjectContext statusCodes:statusCodes isMultipartRequest:isMultipartRequest constructingBodyWithBlock:multipartBlock requestBlock:requestBlock success:success failure:failure];
}

#pragma mark - PUT request
+ (void)putWithBaseURL:(NSString *)baseURLString
                params:(NSDictionary *)params
           pathPattern:(NSString *)pathPattern
               keyPath:(NSString *)keyPath
    managedObjectStore:(RKManagedObjectStore *)managedObjectStore
  managedObjectContext:(NSManagedObjectContext *)managedObjectContext
           statusCodes:(NSIndexSet *)statusCodes
    isMultipartRequest:(BOOL)isMultipartRequest
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
          requestBlock:(void(^)(NSMutableURLRequest *request,
                                NSMutableArray *responseDesriptors))requestBlock
               success:(void(^)(ASManagedObjectRequestOperation *operation,
                                RKMappingResult *result,
                                NSArray *resultsArray))success
               failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                NSError *error))failure{
    
    [[self class] requestWithParams:params baseURLString:baseURLString pathPattern:pathPattern keyPath:keyPath requestMethod:RKRequestMethodPUT managedObjectStore:managedObjectStore managedObjectContext:managedObjectContext statusCodes:statusCodes isMultipartRequest:isMultipartRequest constructingBodyWithBlock:multipartBlock requestBlock:requestBlock success:success failure:failure];
}

#pragma mark - DELETE request
+ (void)deleteWithBaseURL:(NSString *)baseURLString
                   params:(NSDictionary *)params
              pathPattern:(NSString *)pathPattern
                  keyPath:(NSString *)keyPath
       managedObjectStore:(RKManagedObjectStore *)managedObjectStore
     managedObjectContext:(NSManagedObjectContext *)managedObjectContext
              statusCodes:(NSIndexSet *)statusCodes
       isMultipartRequest:(BOOL)isMultipartRequest
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
             requestBlock:(void(^)(NSMutableURLRequest *request,
                                   NSMutableArray *responseDesriptors))requestBlock
                  success:(void(^)(ASManagedObjectRequestOperation *operation,
                                   RKMappingResult *result,
                                   NSArray *resultsArray))success
                  failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                   NSError *error))failure{
    
    [[self class] requestWithParams:params baseURLString:baseURLString pathPattern:pathPattern keyPath:keyPath requestMethod:RKRequestMethodDELETE managedObjectStore:managedObjectStore managedObjectContext:managedObjectContext statusCodes:statusCodes isMultipartRequest:isMultipartRequest constructingBodyWithBlock:multipartBlock requestBlock:requestBlock success:success failure:failure];
}

#pragma mark - PATCH request
+ (void)patchWithBaseURL:(NSString *)baseURLString
                  params:(NSDictionary *)params
             pathPattern:(NSString *)pathPattern
                 keyPath:(NSString *)keyPath
      managedObjectStore:(RKManagedObjectStore *)managedObjectStore
    managedObjectContext:(NSManagedObjectContext *)managedObjectContext
             statusCodes:(NSIndexSet *)statusCodes
      isMultipartRequest:(BOOL)isMultipartRequest
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
            requestBlock:(void(^)(NSMutableURLRequest *request,
                                  NSMutableArray *responseDesriptors))requestBlock
                 success:(void(^)(ASManagedObjectRequestOperation *operation,
                                  RKMappingResult *result,
                                  NSArray *resultsArray))success
                 failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                  NSError *error))failure{
    
    [[self class] requestWithParams:params baseURLString:baseURLString pathPattern:pathPattern keyPath:keyPath requestMethod:RKRequestMethodPATCH managedObjectStore:managedObjectStore managedObjectContext:managedObjectContext statusCodes:statusCodes isMultipartRequest:isMultipartRequest constructingBodyWithBlock:multipartBlock requestBlock:requestBlock success:success failure:failure];
}

#pragma mark - request
+ (void)requestWithParams:(NSDictionary *)params
            baseURLString:(NSString *)baseURLString
              pathPattern:(NSString *)pathPattern
                  keyPath:(NSString *)keyPath
            requestMethod:(RKRequestMethod)requestMethod
       managedObjectStore:(RKManagedObjectStore *)managedObjectStore
     managedObjectContext:(NSManagedObjectContext *)managedObjectContext
              statusCodes:(NSIndexSet *)statusCodes
       isMultipartRequest:(BOOL)isMultipartRequest
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))multipartBlock
             requestBlock:(void(^)(NSMutableURLRequest *request, NSMutableArray *responseDesriptors))requestBlock
                  success:(void(^)(ASManagedObjectRequestOperation *operation,
                                   RKMappingResult *result,
                                   NSArray *resultsArray))success
                  failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                   NSError *error))failure{
    
    NSAssert(baseURLString, @"base URL must not be nil");
    NSAssert(managedObjectStore, @"managedObjectStore must not be nil");
    NSAssert(managedObjectContext, @"managedObjectContext must not be nil");
    
    NSURL *baseURL          = [NSURL URLWithString:baseURLString];
    
    NSTimeInterval timeoutInterval              = 300;
    RKEntityMapping *mapping        = [[self class] fullObjectMappingWithObjectStore:managedObjectStore managedObjectcontext:managedObjectStore.persistentStoreManagedObjectContext];
    
    ASManagedObjectRequestOperation *operation;
    
    if(isMultipartRequest){
        
        operation = [ASManagedObjectRequestOperation multipartFormOperationWithBaseURL:baseURL
                                                                               mapping:mapping
                                                                           pathPattern:pathPattern
                                                                                params:params
                                                                                method:requestMethod
                                                                               keyPath:keyPath
                                                                       timeoutInterval:timeoutInterval
                                                                    managedObjectStore:managedObjectStore
                                                             constructingBodyWithBlock:multipartBlock requestBlock:^(NSMutableURLRequest *request, NSMutableArray *responseDesriptors) {
                                                                 
                                                                 !requestBlock?:requestBlock(request, responseDesriptors);
                                                                 
                                                                 ASLog([request allHTTPHeaderFields]);
                                                             } statusCodes:statusCodes];
    }
    else{
        operation = [ASManagedObjectRequestOperation initWithBaseURL:baseURL
                                                             mapping:mapping
                                                         pathPattern:pathPattern
                                                              params:params
                                                              method:requestMethod
                                                             keyPath:keyPath
                                                     timeoutInterval:timeoutInterval
                                                  managedObjectStore:managedObjectStore
                                                        requestBlock:^(NSMutableURLRequest *request,
                                                                       NSMutableArray *responseDescriptors){
                                                            
                                                            !requestBlock?:requestBlock(request, responseDescriptors);
                                                            
                                                            ASLog([request allHTTPHeaderFields]);
                                                        }
                                                         statusCodes:statusCodes];
    }
    
    [ASHTTPRequestOperationManager addManagedObjectRequestOperation:operation managedObjectStore:managedObjectStore operationQueue:[NSOperationQueue new] success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result) {
        
        [ASLogManager logJSONResponseData:operation.HTTPRequestOperation.responseData];
        
        !success?:success(operation, result, result.array);
        
    } failure:^(ASManagedObjectRequestOperation *operation, NSError *error) {
        NSInteger statusCode = operation.HTTPRequestOperation.response.statusCode;
        if(statusCode == 401){
            
        }
        [ASLogManager logJSONResponseData:operation.HTTPRequestOperation.responseData];
        !failure?:failure(operation, error);
    }];
}

@end
