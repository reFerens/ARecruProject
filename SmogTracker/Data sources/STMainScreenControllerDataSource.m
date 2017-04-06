//
//  STMainScreenControllerDataSource.m
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "STMainScreenControllerDataSource.h"
#import "STStation.h"
#import "STStatistic.h"
#import "STMainScreenCollectionViewCell.h"

@implementation STMainScreenControllerDataSource

#pragma mark - UICollectionView data source
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    STMainScreenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"statisticCell" forIndexPath:indexPath];
    cell.nameLabel.text = self.statistics[indexPath.row].type;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.statistics.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
@end
