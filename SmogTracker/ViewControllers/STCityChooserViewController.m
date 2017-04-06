//
//  STCityChooserViewController.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STCityChooserViewController.h"
#import "STCityChooserDataSource.h"
#import "STConnectionManager.h"
#import "SVProgressHUD.h"
#import "STStationChooserViewController.h"
#import "STCity.h"

@interface STCityChooserViewController () <UITableViewDelegate>
@property (nullable, nonatomic, strong) STCityChooserDataSource *dataSource;
@property (nullable, nonatomic, copy) NSArray <STStation *> *stations;
- (IBAction)cancelButtonAction:(id)sender;
@end

@implementation STCityChooserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[STCityChooserDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
}

#pragma mark - UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [SVProgressHUD show];
    __weak typeof(self)weakSelf = self;
    [[STConnectionManager sharedInstance] statisticsForCity:self.dataSource.cities[indexPath.row] completionHandler:^(NSArray<STStation *> *response) {
        typeof (weakSelf)strongSelf = weakSelf;
        [SVProgressHUD dismiss];
        strongSelf.stations = response;
        [strongSelf performSegueWithIdentifier:@"stationsSegue" sender:self];
    } failure:^(NSInteger statusCode, NSError *error) {
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"There was an error during fetching data. Please try once again", nil)];
    }];
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    STStationChooserViewController *destinationController = segue.destinationViewController;
    destinationController.stations = self.stations;
}
- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
