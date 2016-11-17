//
//  ASSynthesizeSingleton.h
//  
//
//  Created by Jefry Da Gucci on 4/29/15.
//  Copyright (c) 2015 Appslon (http://appslon.com). All rights reserved.
//

#ifndef kloros_ASSynthesizeSingleton_h
#define kloros_ASSynthesizeSingleton_h

#ifndef __has_feature
#define __has_feature(x) 0
#endif

#if __has_feature(objc_arc)
#include <dispatch/dispatch.h>

#define ASSynthesizeSingleton(className, methodName) \
+ (instancetype)methodName {\
static dispatch_once_t predicate = 0;\
static className *methodName = nil;\
dispatch_once(&predicate, ^{\
methodName = [[super allocWithZone:NULL] init];\
});\
return methodName;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
return nil;\
}\
\
- (id)copyWithZone:(struct _NSZone *)zone {\
return self;\
}
#else
#define ASSynthesizeSingleton(className) \
+ (instancetype)methodName {\
static className *methodName = nil;\
@synchronized(self) {\
if (methodName == nil) {\
methodName = [[super allocWithZone:NULL] init];\
}\
}\
return methodName;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
return nil;\
}\
\
- (id)copyWithZone:(struct _NSZone *)zone {\
return self;\
}\
\
- (instancetype)retain {\
return self;\
}\
\
- (oneway void)release {\
}\
\
- (instancetype)autorelease {\
return self;\
}\
\
- (NSUInteger)retainCount {\
return NSUIntegerMax;\
}
#endif


#endif
