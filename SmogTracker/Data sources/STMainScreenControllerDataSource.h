//
//  STMainScreenControllerDataSource.h
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STStation;

@interface STMainScreenControllerDataSource : NSObject
- (instancetype) __unavailable init;
- (instancetype)initWithStation:(STStation *)station;
@end
