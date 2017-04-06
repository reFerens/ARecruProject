//
//  ViewController.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STMainScreenController.h"
#import "STConnectionManager.h"
#import "STCity.h"

@import KDCircularProgress;

@interface STMainScreenController ()
@property (weak, nonatomic) IBOutlet UILabel *statisticNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statisticTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statisticValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *statisticStateLabel;
@property (weak, nonatomic) IBOutlet KDCircularProgress *circularProgressView;
@property (weak, nonatomic) IBOutlet UICollectionView *statisticsCollectionView;
@end

@implementation STMainScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self __configureProgressView];
    
    [[STConnectionManager sharedInstance] statisticsForCity:[STCity cityWithName:@"OLO" identifier:@"01"] completionHandler:^(NSArray<STStation *> *response) {
        ;
    } failure:^(NSInteger statusCode, NSError *error) {
        ;
    }];
}

- (void)__configureProgressView
{
    self.circularProgressView.startAngle = -90;
    self.circularProgressView.angle = 0.0;
    self.circularProgressView.progressThickness = 0.4;
    self.circularProgressView.trackThickness = 0.6;
    self.circularProgressView.clockwise = true;
    self.circularProgressView.gradientRotateSpeed = 2;
    self.circularProgressView.roundedCorners = TRUE;
    self.circularProgressView.glowAmount = 0.9;
}

@end
