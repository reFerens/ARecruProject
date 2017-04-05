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

@interface STMainScreenController ()

@end

@implementation STMainScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[STConnectionManager sharedInstance] statisticsForCity:[STCity cityWithName:@"OLO" identifier:@"01"] completionHandler:^(NSArray<STStation *> *response) {
        ;
    } failure:^(NSInteger statusCode, NSError *error) {
        ;
    }];
}

@end
