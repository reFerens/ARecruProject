//
//  STStation.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STStatistic;

extern NSString * _Nonnull kStationName;
extern NSString * _Nonnull kStationStatistics;

@interface STStation : NSObject
@property (nullable, nonatomic, copy) NSString *name;
@property (nonnull, nonatomic, copy) NSArray<STStatistic *> *statistics;
@end
