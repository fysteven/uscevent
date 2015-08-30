//
//  EventEngine.h
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventModel.h"

@interface EventEngine : NSObject
- (void)getEvent:(NSNumber *)event_id completion:(void (^)(EventModel *eventModel, NSError *anError))completion;
@end
