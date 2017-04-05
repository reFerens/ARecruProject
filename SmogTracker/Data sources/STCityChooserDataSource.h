//
//  STCityChooserDataSource.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STCity;
@interface STCityChooserDataSource : NSObject
- (NSArray <STCity *> *)cityList;
@end
