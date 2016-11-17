//
//  NSManagedObject+MRHelper.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 6/22/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import "NSManagedObject+MRHelper.h"

@implementation NSManagedObject (MRHelper)

+ (instancetype)getLatest{
    __block id entity;
    [[MRDatabaseManager sharedInstance] fetchObjectForEntity:NSStringFromClass(self) fetchRequestBlock:^(NSFetchRequest *fetchRequest) {
        
        fetchRequest.includesPropertyValues = YES;
        fetchRequest.returnsObjectsAsFaults = NO;
        
    } completion:^(NSArray *results, NSManagedObjectContext *context, NSError *error) {
        entity = [results lastObject];
    }];
    
    return entity;
}

@end
