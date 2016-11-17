//
//  Location+CoreDataProperties.h
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/17/16.
//  Copyright © 2016 Appslon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Location (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *area;
@property (nullable, nonatomic, retain) NSString *city;

@end

NS_ASSUME_NONNULL_END
