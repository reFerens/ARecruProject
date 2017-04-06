//
//  STStatistic.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STStatistic.h"
NSString const *kStatisticName = @"par_desc";
NSString const *kStatisticType = @"par_name";
NSString const *kStatisticValue = @"o_value";
NSString const *kStatisticUnit = @"par_unit";
NSString const *kStatisticState = @"g_nazwa";

@interface STStatistic()
@property (nonnull, nonatomic, copy) NSDictionary *mappingDict;
@end
@implementation STStatistic

- (NSNumber *_Nullable)maximumAllowedValue
{
    return self.mappingDict[self.type];
}

- (NSDictionary *)mappingDict
{
    if (!_mappingDict) {
        _mappingDict = @{@"pm10" : @(50),
                         @"pm2.5" :@(27),
                         @"no2" : @(200),
                         @"co" : @(5000)};
    }
    return _mappingDict;
}
@end
