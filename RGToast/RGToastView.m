//
//  RGToastView.m
//  RGToast
//
//  Created by Ryan Grier on 5/28/13.
//  Copyright (c) 2013 Ryan Grier. All rights reserved.
//

#import "RGToastView.h"
#import "RGToast.h"
#import "NSMutableArray+QueueAdditions.h"

@interface RGToastView ()

@property (nonatomic, strong) NSMutableArray*   toasts;
@property (nonatomic, strong) RGToast*          currentToast;
@property (nonatomic, strong) UILabel*          messageLabel;

@end

@implementation RGToastView

- (id) init {
    self = [super init];
    
    if (self) {
        self.toasts = [NSMutableArray array];
        self.currentToast = nil;
        
        self.backgroundColor = [UIColor darkGrayColor];
        self.alpha = 0.90f;
        
        // Build the UI here.
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGRect newFrame = CGRectMake(0.0, screenBounds.size.height - 20.0f, screenBounds.size.width, 20.0f);
        self.frame = newFrame;
        self.windowLevel = UIWindowLevelStatusBar+1.f;
        self.hidden = FALSE;
        
        newFrame.origin.x = 10.0f;
        //newFrame.size.width -= 20.0f;
        self.messageLabel = [[UILabel alloc] initWithFrame:newFrame];
        self.messageLabel.text = @"Testing";
        self.messageLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:self.messageLabel];
    }
    
    return self;
}

+ (RGToastView *) sharedToastView {
    static dispatch_once_t pred;
    __strong static RGToastView* sharedToastView = nil;
    
    dispatch_once(&pred, ^{
        sharedToastView = [[RGToastView alloc] init];
    });
    
    return sharedToastView;
}

#pragma mark - Public Methods
- (void) showToast: (RGToast*) toast {
    if (!toast) {
        return;
    }
    
    [self.toasts enqueue:toast];
    
    if (self.currentToast == nil) {
        [self showNextToast];
    }
}

#pragma mark - Private Methods
- (void) showNextToast {
    RGToast* nextToast = nil;
    
    if ([self.toasts count] > 0) {
        nextToast = [self.toasts dequeue];
    }
    
    if (nextToast != nil) {
        if (nextToast.animate == TRUE) {
            
        } else {
            
        }
    }
}


@end
