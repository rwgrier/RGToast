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
    return [RGToast makeToast:message duration:RGToastViewDurationShort animated:TRUE];
}

+ (RGToast*) makeToast: (NSString*) message duration: (RGToastViewDuration) duration {
    return [RGToast makeToast:message duration:duration animated:TRUE];
}

+ (RGToast*) makeToast: (NSString*) message duration: (RGToastViewDuration) duration animated: (BOOL) animated {
    RGToast* toast = [[RGToast alloc] init];
    toast.message = message;
    toast.duration = duration;
    toast.animate = animated;
    
    return toast;
}

- (void) show {
    [[RGToastView sharedToastView] showToast:self];
}

- (NSString*) description {
    return [NSString stringWithFormat:@"RGToast: { message: %@; duration: %u; animated: %@ }", self.message, self.duration, self.animate ? @"Yes" : @"No"];
}

@end
