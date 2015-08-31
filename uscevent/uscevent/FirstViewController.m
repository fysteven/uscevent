//
//  FirstViewController.m
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import "FirstViewController.h"
#import "EventEngine.h"
#import "EventViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    EventEngine *engine = [EventEngine new];
    NSNumber *event_id = @([@"873295" integerValue]);
    [engine getEvent:event_id completion:^(EventModel *eventModel, NSError *anError) {
        NSLog(@"%@", eventModel);
    }];
    
    EventViewController *controller = [EventViewController new];
    [controller configureEvent:@"873295"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
