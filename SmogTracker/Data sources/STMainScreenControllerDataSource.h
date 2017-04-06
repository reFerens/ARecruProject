//
//  STMainScreenControllerDataSource.h
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class STStation, STStatistic;

@interface STMainScreenControllerDataSource : NSObject <UICollectionViewDataSource>
@property (nullable, nonatomic, copy) NSArray <STStatistic *> *statistics;
@property (nullable, nonatomic, strong) NSIndexPath* selectedIndexPath;
@end
