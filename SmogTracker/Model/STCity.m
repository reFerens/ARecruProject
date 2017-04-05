//
//  STCity.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STCity.h"

@implementation STCity
+ (STCity *_Nonnull)cityWithName:(NSString *_Nullable)name identifier:(NSString *_Nullable)identifier
{
    STCity *city = [[STCity alloc] init];
    city.name = name;
    city.cityIdentifier = identifier;
    city.stations = @[];
    return city;
}
@end
