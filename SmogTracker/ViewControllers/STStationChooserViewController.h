//
//  StationChooserViewController.h
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STStation, STStationChooserViewController;

@protocol STStationChooserViewControllerDelegate <NSObject>
- (void)stationChooser:(STStationChooserViewController *_Nonnull)controller didSelectStation:(STStation *_Nonnull)station;
@end

@interface STStationChooserViewController : UITableViewController
@property (nullable, nonatomic, copy) NSArray <STStation *> *stations;
@property (nullable, nonatomic, weak) id <STStationChooserViewControllerDelegate> delegate;
@end
