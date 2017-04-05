//
//  ViewController.m
//  SmogTracker
//
//  Created by admin on 05.04.2017.
//  Copyright © 2017 pawel.ferens. All rights reserved.
//

#import "STMainScreenController.h"
#import "STConnectionManager.h"

@interface STMainScreenController ()

@end

@implementation STMainScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[STConnectionManager sharedInstance] statisticsForCity:nil completionHandler:nil failure:nil];
}

@end
