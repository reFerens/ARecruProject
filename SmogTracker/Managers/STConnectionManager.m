//
//  STConnectionManager.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STConnectionManager.h"
#import "STCity.h"
#import "STStation.h"
#import "STStatistic.h"

static NSString * const kConnectionManagerAPIBaseURLString = @"https://powietrze.malopolska.pl/_powietrzeapi/api/";
static NSString * const kAPIDataKey = @"dane";
static NSString * const kAPIActKey = @"act";
static NSString * const kAPICityIDKey = @"ci_id";
static NSString * const kApiActualDataKey = @"actual";

@implementation STConnectionManager

#pragma mark - Global methods
+ (instancetype)sharedInstance
{
    static STConnectionManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:kConnectionManagerAPIBaseURLString]];
    });
    return manager;
}

- (void)statisticsForCity:(STCity *)city completionHandler:(StatisticsSuccessHandler)completionHandler failure:(APIFailureHandler)failureHandler
{
    NSDictionary *parameters = @{kAPIActKey : @"danemiasta",
                                 kAPICityIDKey : NULLIFNIL(city.cityIdentifier)};
    
    [self __performGETWithMethod:kAPIDataKey parameters:parameters success:^(NSDictionary *response) {
        NSDictionary *data = response[kAPIDataKey];
        
        if (data) {
            NSMutableArray *mutableStations = [[NSMutableArray alloc] init];
            
            NSArray *stations = data[kApiActualDataKey];
            for (NSDictionary *stationDict in stations) {
                STStation *station = [[STStation alloc] init];
                station.name = NILIFNULL(stationDict[kStationName]);
                [mutableStations addObject:station];
                NSArray *statistics = stationDict[kStationStatistics];
                
                if (statistics) {
                    NSMutableArray <STStatistic *> *statisticsMutableArray = [[NSMutableArray alloc] init];
                    for (NSDictionary *statisticDict in statistics) {
                        STStatistic *statistic = [[STStatistic alloc] init];
                        statistic.name = statisticDict[kStatisticName];
                        statistic.type = statisticDict[kStatisticType];
                        statistic.unit = statisticDict[kStatisticUnit];
                        statistic.state = statisticDict[kStatisticState];
                        statistic.value = statisticDict[kStatisticValue];
                        [statisticsMutableArray addObject:statistic];
                    }
                    station.statistics = [statisticsMutableArray copy];
                }
            }
            if (completionHandler) {
                completionHandler([mutableStations copy]);
            }
        } else {
            if (failureHandler) {
                NSError *error = [[NSError alloc] initWithDomain:NSNetServicesErrorDomain code:0 userInfo:@{@"reason" : @"Request completed but no data"}];
                failureHandler(0, error);
            }
        }
    } failure:^(NSInteger statusCode, NSError *error) {
        if (failureHandler) {
            failureHandler(statusCode, error);
        }
    }];
}

#pragma mark - Private methods
- (void)__performGETWithMethod:(NSString *)method
                    parameters:(NSDictionary *)parameters
                       success:(APISuccessHandler)success
                       failure:(APIFailureHandler)failure
{
    [self GET:method parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (failure) {
            failure(response.statusCode, error);
        }

    }];
}

@end
