//
//  EventViewController.h
//  uscevent
//
//  Created by Yao Fan on 8/30/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController
- (void)configureEvent:(NSString *)event_id;

@property IBOutlet UILabel *titleLabel;
@property IBOutlet UILabel *scheduleLabel;
@property IBOutlet UILabel *descriptionLabel;
@property IBOutlet UILabel *locationLabel;
@property IBOutlet UILabel *audienceLabel;
@end
