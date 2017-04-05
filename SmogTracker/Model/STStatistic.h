//
//  STStatistic.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STStatistic : NSObject
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, strong) NSNumber *value;
@property (nullable, nonatomic, strong) NSNumber *maxAllowedValue;
@property (nullable, nonatomic, copy) NSString *unit;
@end
