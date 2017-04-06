//
//  STConnectionManager.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define NILIFNULL(foo) ((foo == [NSNull null]) ? nil : foo)
#define NULLIFNIL(foo) ((foo == nil) ? [NSNull null] : foo)
@class STStation, STCity;

typedef void(^APISuccessHandler)(NSDictionary *response);
typedef void(^APIFailureHandler)(NSInteger statusCode, NSError *error);
typedef void(^StatisticsSuccessHandler)(NSArray <STStation *> *response);

@interface STConnectionManager : AFHTTPSessionManager
+ (instancetype)sharedInstance;
- (void)statisticsForCity:(STCity *)city completionHandler:(StatisticsSuccessHandler)completionHandler failure:(APIFailureHandler)failureHandler;
@end
