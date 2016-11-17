//
//  Location+Request.h
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/17/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "Location.h"

@interface Location (Request)

#pragma mark - GET request

+ (void)getLocationWithPathPattern:(NSString *)pathPattern
                           success:(void(^)(ASManagedObjectRequestOperation *operation,
                                            RKMappingResult *result,
                                            NSArray *resultsArray))success
                           failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                            NSError *error))failure;

@end
