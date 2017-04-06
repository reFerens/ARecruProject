//
//  STCityChooserViewController.h
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STCityChooserViewController, STStation;
@protocol STCityChooserViewControllerDelegate <NSObject>
- (void)cityChooser:(STCityChooserViewController *_Nonnull)controller didSelectStation:(STStation *_Nonnull)station;
@end

@interface STCityChooserViewController : UITableViewController
@property (nullable, weak, nonatomic) id <STCityChooserViewControllerDelegate> delegate;
@end
