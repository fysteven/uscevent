//
//  CalendarModel.h
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarModel : NSObject
@property NSNumber *calendar_id;
@property NSString *name;
@property NSString *description1;
@property NSString *website_url;
@property NSNumber *visible;
@property NSString *activity;
@property NSArray *categories;
@property NSArray *share_with;

@end
