//
//  STCity.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STStation;

@interface STCity : NSObject
@property (nonnull, nonatomic, copy) NSString *cityIdentifier;
@property (nonnull, nonatomic, copy) NSString *name;
@property (nonnull, nonatomic, copy) NSArray<STStation *> *stations;

+ (STCity *_Nonnull)cityWithName:(NSString *_Nonnull)name identifier:(NSString *_Nonnull)identifier;
@end
