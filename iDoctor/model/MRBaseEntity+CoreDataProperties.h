//
//  MRBaseEntity+CoreDataProperties.h
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 11/18/15.
//  Copyright © 2015 Appslon http://appslon.com . All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MRBaseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRBaseEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *status;
@property (nullable, nonatomic, retain) NSString *success;
@property (nullable, nonatomic, retain) NSString *error;
@property (nullable, nonatomic, retain) NSString *nextaction;

@end

NS_ASSUME_NONNULL_END
