//
//  STConnectionManager.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STConnectionManager.h"
#import "STCity.h"

static NSString * const kConnectionManagerAPIBaseURLString = @"https://powietrze.malopolska.pl/_powietrzeapi/api/";
static NSString * const kAPIDataKey = @"dane";
static NSString * const kAPIActKey = @"act";
static NSString * const kAPICityIDKey = @"ci_id";


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
                                 kAPICityIDKey : city.cityIdentifier};
    
    [self __performGETWithMethod:kAPIDataKey parameters:parameters success:^(NSDictionary *response) {
        ;
    } failure:^(NSInteger statusCode, NSError *error) {
        ;
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

    }];
}

@end
