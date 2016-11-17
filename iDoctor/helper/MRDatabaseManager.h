//
//  BBDatabaseManager.h
//
//
//  Created by Jefry Da Gucci on 4/29/15.
//  Copyright (c) 2015 Appslon (http://appslon.com). All rights reserved.
//

#import <ASBaseIOSProject/ASDatabaseManager.h>

@class RKManagedObjectStore;
@interface MRDatabaseManager : ASDatabaseManager

@property (nonatomic, strong) RKManagedObjectStore *managedObjectStore;

- (void)clearDB;

- (void)clearDBExcept:(NSArray <NSString *> *)classes;

@end
