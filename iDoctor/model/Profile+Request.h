//
//  Profile+Request.h
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/17/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "Profile.h"

@interface Profile (Request)

+ (void)getProfileWithPathPattern:(NSString *)pathPattern
                          success:(void(^)(ASManagedObjectRequestOperation *operation,
                                           RKMappingResult *result,
                                           NSArray *resultsArray))success
                          failure:(void(^)(ASManagedObjectRequestOperation *operation,
                                           NSError *error))failure;

@end
