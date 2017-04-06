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

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.layer.borderWidth = 4.0;
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
    } else {
        self.layer.borderWidth = 0.0;
        self.layer.borderColor = [UIColor clearColor].CGColor;
    }
}

@end
