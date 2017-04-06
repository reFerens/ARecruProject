//
//  SKMainScreenCollectionViewCell.m
//  SmogTracker
//
//  Created by admin on 06.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STMainScreenCollectionViewCell.h"

@implementation STMainScreenCollectionViewCell
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.layer.cornerRadius = 10.0;
    return self;
}
@end
