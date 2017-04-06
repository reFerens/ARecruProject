//
//  STStatistic.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STStatistic : NSObject
extern NSString * _Nonnull kStatisticName;
extern NSString * _Nonnull kStatisticType;
extern NSString * _Nonnull kStatisticValue;
extern NSString * _Nonnull kStatisticUnit;
extern NSString * _Nonnull kStatisticState;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSString *value;
@property (nullable, nonatomic, copy) NSString *state;
@property (nullable, nonatomic, copy) NSString *unit;

- (NSNumber *_Nullable)maximumAllowedValue;

@end
