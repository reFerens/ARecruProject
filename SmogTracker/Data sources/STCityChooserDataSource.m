//
//  STCityChooserDataSource.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STCityChooserDataSource.h"
#import "STCity.h"

@interface STCityChooserDataSource ()
@property (nonnull, nonatomic, strong, readwrite) NSArray <STCity *> *cities;
@end
@implementation STCityChooserDataSource


- (NSArray <STCity *> *)cities
{
    if (!_cities) {
        _cities =  @[[STCity cityWithName:NSLocalizedString(@"Kraków", nil) identifier:@"01"],
                     [STCity cityWithName:NSLocalizedString(@"Tarnów", nil) identifier:@"02"],
                     [STCity cityWithName:NSLocalizedString(@"Nowy Sącz", nil) identifier:@"03"],
                     [STCity cityWithName:NSLocalizedString(@"Bochnia", nil) identifier:@"04"],
                     [STCity cityWithName:NSLocalizedString(@"Brzesko", nil) identifier:@"05"],
                     [STCity cityWithName:NSLocalizedString(@"Chrzanów", nil) identifier:@"06"],
                     [STCity cityWithName:NSLocalizedString(@"Dąbrowa Tarnowska", nil) identifier:@"07"],
                     [STCity cityWithName:NSLocalizedString(@"Gorlice", nil) identifier:@"08"],
                     [STCity cityWithName:NSLocalizedString(@"Krynica Zdrój", nil) identifier:@"09"],
                     [STCity cityWithName:NSLocalizedString(@"Limanowa", nil) identifier:@"10"],
                     [STCity cityWithName:NSLocalizedString(@"Miechów", nil) identifier:@"11"],
                     [STCity cityWithName:NSLocalizedString(@"Myślenice", nil) identifier:@"12"],
                     [STCity cityWithName:NSLocalizedString(@"Nowy Targ", nil) identifier:@"13"],
                     [STCity cityWithName:NSLocalizedString(@"Olkusz", nil) identifier:@"14"],
                     [STCity cityWithName:NSLocalizedString(@"Oświęcim", nil) identifier:@"15"],
                     [STCity cityWithName:NSLocalizedString(@"Proszowice", nil) identifier:@"16"],
                     [STCity cityWithName:NSLocalizedString(@"Skawina", nil) identifier:@"17"],
                     [STCity cityWithName:NSLocalizedString(@"Sucha Beskidzka", nil) identifier:@"18"],
                     [STCity cityWithName:NSLocalizedString(@"Trzebinia", nil) identifier:@"19"],
                     [STCity cityWithName:NSLocalizedString(@"Tuchów", nil) identifier:@"20"],
                     [STCity cityWithName:NSLocalizedString(@"Wadowice", nil) identifier:@"21"],
                     [STCity cityWithName:NSLocalizedString(@"Wieliczka", nil) identifier:@"22"],
                     [STCity cityWithName:NSLocalizedString(@"Zakopane", nil) identifier:@"23"],
                     ];
    }
    return _cities;
}


#pragma mark - UITableView data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    cell.textLabel.text = self.cities[indexPath.row].name;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}
@end
