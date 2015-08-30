//
//  NSError+Addtions.m
//  uscevent
//
//  Created by Yao Fan on 8/29/15.
//  Copyright (c) 2015 frankhome. All rights reserved.
//

#import "NSError+Addtions.h"

@implementation NSError (Addtions)


+ (NSError *)errorWithMessage:(NSString *)message {
    if (message == nil) {
        return nil;
    }
    
    NSDictionary *dict = @{@"error": message};
    
    NSError *anError = [NSError errorWithDomain:@"at.glance.GlanceAt.defaultErrorDomain" code:3 userInfo:dict];
    return anError;
    
}


@end
