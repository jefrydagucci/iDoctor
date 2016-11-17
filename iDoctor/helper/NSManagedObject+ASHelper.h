//
//  NSManagedObject+ASHelper.h
//  
//
//  Created by Jefry Da Gucci on 2/12/16.
//  Copyright © 2016 Appslon http://appslon.com . All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (ASHelper)

+ (NSDictionary *)mappingDictionaryForEntityInContext:(NSManagedObjectContext *)context;

@end
