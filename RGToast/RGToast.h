//
//  RGToast.h
//  RGToast
//
//  Created by Ryan Grier on 5/28/13.
//  Copyright (c) 2013 Ryan Grier. All rights reserved.
//

#import "RGToastView.h"

typedef enum RGToastViewDuration {
    RGToastViewDurationShort,
    RGToastViewDurationLong
} RGToastViewDuration;

@interface RGToast : NSObject

@property (nonatomic, copy) NSString*               message;
@property (nonatomic, assign) RGToastViewDuration   duration;
@property (nonatomic, assign) BOOL                  animate;

+ (RGToast*) makeToast: (NSString*) message;
+ (RGToast*) makeToast: (NSString*) message duration: (RGToastViewDuration) duration;
+ (RGToast*) makeToast: (NSString*) message duration: (RGToastViewDuration) duration animated: (BOOL) animated;

- (void) show;

@end
