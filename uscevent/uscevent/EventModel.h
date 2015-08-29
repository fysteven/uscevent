//
//  EventModel.h
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject
@property NSNumber *event_id;
@property NSString *title;
@property NSString *subtitle;
@property NSString *summary;
@property NSString *description1;
@property NSString *cost;
@property NSString *contact_phone;
@property NSString *contact_email;
@property NSString *rsvp_email;
@property NSString *rsvp_url;
@property NSString *url;
@property NSString *ticket_url;
@property NSString *campus;
@property NSString *venue;
@property NSString *building_code;
@property NSString *room;
@property NSString *address;
@property NSString *feature_candidate;
@property NSString *username;
@property NSString *name;
@property NSString *scratch_pad;
@property NSString *created;
@property NSString *updated;
@property NSString *publication_date;
@property NSString *parent_calendar_id;
@property NSString *parent_calendar;
@property NSArray *sponsors;
@property NSString *dates;
@property NSString *times;
@end
