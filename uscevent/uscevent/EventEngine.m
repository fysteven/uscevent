//
//  EventEngine.m
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import "EventEngine.h"
#import "NSError+Addtions.h"
#import <AFNetworking/AFNetworking.h>
#import "Constants.h"
#import "EventModel.h"

@implementation EventEngine

- (void)getEvent:(NSNumber *)event_id completion:(void (^)(EventModel *eventModel, NSError *anError))completion {
    [self requestEvent:event_id completion:^(NSDictionary *event, NSError *anError) {
        EventModel *model = [EventModel new];
        if (event) {
            model = [self parseEvent:event];
        }
        if (completion) {
            completion(model, anError);
        }
    }];
}

- (EventModel *)parseEvent:(NSDictionary *)event {
    EventModel *model = [EventModel new];
    if (event) {
        model.event_id = event[@"event_id"];
        model.title = event[@"title"];
        model.subtitle = event[@"title"];
        model.summary = event[@"summary"];
        model.description1 = event[@"description"];
        model.cost = event[@"cost"];
        model.contact_phone = event[@"contact_phone"];
        model.contact_email = event[@"contact_email"];
        model.rsvp_email = event[@"rsvp_email"];
        model.rsvp_url = event[@"rsvp_url"];
        model.url = event[@"url"];
        model.ticket_url = event[@"ticket_url"];
        model.campus = event[@"campus"];
        model.venue = event[@"venue"];
        model.building_code = event[@"building_code"];
        model.room = event[@"room"];
        model.address = event[@"address"];
        model.feature_candidate = event[@"feature_candidate"];
        model.username = event[@"username"];
        model.name = event[@"name"];
        model.created = event[@"created"];
        model.updated = event[@"updated"];
        model.parent_calendar_id = event[@"parent_calendar_id"];
        model.parent_calendar = event[@"parent_calendar"];
        model.sponsors = event[@"sponsors"];
        
    }
    return model;
}

- (void)requestEvent:(NSNumber *)event_id completion:(void (^)(NSDictionary *event, NSError *anError))completion {
    
    if (event_id == nil) {
        NSError *anError = [NSError errorWithMessage:@"event_id cannot be empty or nil"];
        if (completion) {
            completion(nil, anError);
        }
        return;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", base_url]];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    
    NSString *urlString = [NSString stringWithFormat:@"detail/%@", event_id];
    
    [manager GET:urlString parameters:nil success:^void(AFHTTPRequestOperation * operation, id responseObject) {
        NSDictionary *event;
        NSError *anError;
        if (responseObject[@"event_id"]) {
            event = responseObject;
        } else {
            anError = [NSError errorWithMessage:@"event is not available."];
        }
        if (completion) {
            completion(event, anError);
        }
    } failure:^void(AFHTTPRequestOperation * __nonnull operation , NSError * __nonnull anError ) {
        if (completion) {
            completion(nil, anError);
        }
    }];
    
}


@end
