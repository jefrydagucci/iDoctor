//
//  BBDatabaseManager.m
//
//
//  Created by Jefry Da Gucci on 4/29/15.
//  Copyright (c) 2015 Appslon (http://appslon.com). All rights reserved.
//

#import "MRDatabaseManager.h"
#import <RestKit/RestKit.h>

@interface MRDatabaseManager ()

@property (nonatomic, assign) BOOL shouldChangeModel;

@end

@implementation MRDatabaseManager

- (void)setDBName:(NSString *)DBName{
    self.shouldChangeModel = [DBName isEqualToString:self.DBName];
    [super setDBName:DBName];
    self.shouldChangeModel = NO;
}

- (RKManagedObjectStore *)managedObjectStore{
    if(_managedObjectStore && !self.shouldChangeModel){
        return _managedObjectStore;
    }
    _managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSDictionary *option = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                            [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    NSError *error;
    [self persistentStoreCoordinator];
    NSString *path = [[self persistenStoreURL].absoluteString stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    
    NSPersistentStore *persistentStore = [_managedObjectStore addSQLitePersistentStoreAtPath:path fromSeedDatabaseAtPath:nil withConfiguration:nil options:option error:&error];
    if (! persistentStore) {
        RKLogError(@"Failed adding persistent store at path '%@': %@", path, error);
    }
    [_managedObjectStore createManagedObjectContexts];
    return _managedObjectStore;
}

- (NSManagedObjectContext *)managedObjectContext{
    return [self managedObjectStore].persistentStoreManagedObjectContext;
}

- (void)clearDB{
    [self clearDBExcept:nil];
}

- (void)clearDBExcept:(NSArray <NSString *> *)classes{
    NSMutableArray *entities = [[self managedObjectModel] entities].mutableCopy;
    @try {
        [entities enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[NSEntityDescription class]]){
                NSString *className = [(NSEntityDescription *)obj managedObjectClassName];
                if([classes containsObject:className]){
                    [entities removeObject:obj];
                }
                else{
                    [self deleteAllObjectsForEntity:className completion:^(NSError *error) {
                        if(error){
                            NSString *errMsg = [NSString stringWithFormat:@"Error : %@", error.userInfo];
                            ASLog(errMsg);
                        }
                    }];
                }
            }
        }];
    }
    @catch (NSException *exception) {
        NSString *errMsg = [NSString stringWithFormat:@"Catch Exception : %@", exception.userInfo];
        ASLog(errMsg);
    }
    @finally {
        ASLog(@"Finish Clear Database");
    }
}

@end
