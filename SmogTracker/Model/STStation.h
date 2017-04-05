//
//  STStation.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STStatistic;

@interface STStation : NSObject
@property (nonnull, nonatomic, copy) NSArray<STStatistic *> *statistics;
@end
