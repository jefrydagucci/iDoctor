//
//  Profile+CoreDataProperties.h
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/17/16.
//  Copyright © 2016 Appslon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Profile.h"

NS_ASSUME_NONNULL_BEGIN

@interface Profile (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *area;
@property (nullable, nonatomic, retain) NSString *currency;
@property (nullable, nonatomic, retain) NSNumber *experience;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitute;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *obj_description;
@property (nullable, nonatomic, retain) NSString *obj_id;
@property (nullable, nonatomic, retain) NSString *photo;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) NSNumber *recommendation;
@property (nullable, nonatomic, retain) NSString *schedule;
@property (nullable, nonatomic, retain) NSString *speciality;

@end

NS_ASSUME_NONNULL_END
