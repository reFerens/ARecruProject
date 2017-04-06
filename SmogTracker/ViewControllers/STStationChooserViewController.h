//
//  StationChooserViewController.h
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STStation;
@interface STStationChooserViewController : UITableViewController
@property (nullable, nonatomic, copy) NSArray <STStation *> *stations;
@end
