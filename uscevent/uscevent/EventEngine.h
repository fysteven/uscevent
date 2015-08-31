//
//  EventEngine.h
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventModel.h"
#import "CalendarModel.h"

@interface EventEngine : NSObject
- (void)getEvent:(NSNumber *)event_id completion:(void (^)(EventModel *eventModel, NSError *anError))completion;
- (void)getEventsForCalendar:(NSNumber *)calendar_id completion:(void (^)(NSArray *eventModels, NSError *anError))completion;

- (void)getCalendarsCompletion:(void (^)(NSArray *calendarModels, NSError *anError))completion;

@end
