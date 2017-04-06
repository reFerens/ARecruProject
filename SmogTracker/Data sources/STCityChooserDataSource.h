//
//  STCityChooserDataSource.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class STCity;
@interface STCityChooserDataSource : NSObject <UITableViewDataSource>
@property (nonnull, nonatomic, strong, readonly) NSArray <STCity *> *cities;
@end
