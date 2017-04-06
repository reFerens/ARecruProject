//
//  ViewController.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STMainScreenController.h"
#import "STCity.h"
#import "STCityChooserViewController.h"
#import "STStation.h"
#import "STMainScreenControllerDataSource.h"
#import "STStatistic.h"

@import KDCircularProgress;

@interface STMainScreenController () <STCityChooserViewControllerDelegate, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *statisticNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statisticTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statisticValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *statisticStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;
@property (weak, nonatomic) IBOutlet KDCircularProgress *circularProgressView;
@property (weak, nonatomic) IBOutlet UICollectionView *statisticsCollectionView;
@property (weak, nonatomic) IBOutlet UIView *overlayView;
@property (nullable, nonatomic, strong) STMainScreenControllerDataSource *dataSource;
@end

@implementation STMainScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.overlayView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.98];
    self.statisticsCollectionView.allowsMultipleSelection = NO;
    self.statisticsCollectionView.dataSource = self.dataSource;
    self.statisticsCollectionView.delegate = self;
    [self __prepareProgressView];
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    STCityChooserViewController *destinationController = [(UINavigationController *)segue.destinationViewController viewControllers][0];
    destinationController.delegate = self;
}

#pragma mark - STCityChooserViewControllerDelegate
- (void)cityChooser:(STCityChooserViewController *)controller didSelectStation:(STStation *)station
{
    self.overlayView.alpha = 0.0f;

    self.title = station.name;
    self.dataSource.selectedIndexPath = nil;
    self.dataSource.statistics = station.statistics;
    [self.statisticsCollectionView reloadData];
    
    [self __configureViewForStatistic:station.statistics[0]];
}

#pragma mark - Lazy load properties
- (STMainScreenControllerDataSource *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[STMainScreenControllerDataSource alloc] init];
    }
    return _dataSource;
}

#pragma mark - Private methods

- (void)__clearCollectionViewSelection
{
    for (int i = 0; i < self.dataSource.statistics.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [[self.statisticsCollectionView cellForItemAtIndexPath:indexPath] setSelected:NO];
    }
}

- (void)__prepareProgressView
{
    self.circularProgressView.startAngle = -90;
    self.circularProgressView.angle = 0.0;
    self.circularProgressView.progressThickness = 0.4;
    self.circularProgressView.trackThickness = 0.6;
    self.circularProgressView.clockwise = YES;
    self.circularProgressView.gradientRotateSpeed = 2;
    self.circularProgressView.roundedCorners = YES;
    self.circularProgressView.glowAmount = 0.9;
}

- (void)__configureViewForStatistic:(STStatistic *)statistic
{
    self.statisticNameLabel.text = statistic.name;
    self.statisticTypeLabel.text = statistic.type;
    self.statisticValueLabel.text = [NSString stringWithFormat:@"%@ %@", statistic.value, statistic.unit];
    self.statisticStateLabel.text = [NSString stringWithFormat:@"%@ : %@", NSLocalizedString(@"Air condition:", nil), statistic.state];
    
    CGFloat percentage = ([statistic.value doubleValue]/[statistic.maximumAllowedValue doubleValue]) * 100.0;
    self.percentageLabel.text = [NSString stringWithFormat:@"%.2f %%", percentage];
    
    CGFloat angle = ([statistic.value doubleValue]/[statistic.maximumAllowedValue doubleValue]) * 360.0;
    [self.circularProgressView animateToAngle:MIN(angle, 360.0) duration:1.0 relativeDuration:NO completion:nil];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self __clearCollectionViewSelection];
    self.dataSource.selectedIndexPath = indexPath;
    [self __configureViewForStatistic:self.dataSource.statistics[indexPath.row]];
}
@end
