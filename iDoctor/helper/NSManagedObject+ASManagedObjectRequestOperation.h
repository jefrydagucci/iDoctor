//
//  NSManagedObject+ASManagedObjectRequestOperation.h
//  
//
//  Created by Jefry Da Gucci on 2/18/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import <CoreData/CoreData.h>
#import <ASRestKit/ASManagedObjectRequestOperation.h>
#import <ASRestKit/ASHTTPRequestOperationManager.h>
#import <ASBaseIOSProject/ASLogManager.h>

@interface NSManagedObject (ASManagedObjectRequestOperation)

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
                                NSError *error))failure;

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
                                 NSError *error))failure;

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
                                NSError *error))failure;

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
                                   NSError *error))failure;

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
                                  NSError *error))failure;

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
                                   NSError *error))failure;

@end
