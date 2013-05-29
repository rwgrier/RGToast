//
//  RGToast.m
//  RGToast
//
//  Created by Ryan Grier on 5/28/13.
//  Copyright (c) 2013 Ryan Grier. All rights reserved.
//

#import "RGToast.h"

@implementation RGToast

+ (RGToast*) makeToast: (NSString*) message {
    return [RGToast makeToast:message duration:RGToastViewDurationShort];
}

+ (RGToast*) makeToast: (NSString*) message duration: (RGToastViewDuration) duration {
    RGToast* toast = [[RGToast alloc] init];
    toast.message = message;
    toast.duration = duration;
    
    return toast;
}

- (void) show {
    [[RGToastView sharedToastView] showToast:self];
}

- (NSString*) description {
    return [NSString stringWithFormat:@"RGToast: { message: %@; duration: %u }", self.message, self.duration];
}

@end
