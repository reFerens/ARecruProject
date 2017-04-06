//
//  StationChooserViewController.m
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STStationChooserViewController.h"
#import "STStation.h"

@interface STStationChooserViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation STStationChooserViewController
#pragma mark - UIView
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setStations:(NSArray<STStation *> *)stations
{
    _stations = stations;
    [self.tableView reloadData];
}

#pragma mark - UITableView data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    cell.textLabel.text = self.stations[indexPath.row].name;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stations.count;
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate stationChooser:self didSelectStation:self.stations[indexPath.row]];
}

@end
