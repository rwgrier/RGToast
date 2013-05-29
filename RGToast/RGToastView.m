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

#define kRGLongToastDuration 2.0f
#define kRGShortToastDuration 1.0f
#define kRGToastBarHeight 20.0f
#define kRGSLabelPaddingWidth 10.0f
#define kRGToastAlpha 0.85f
#define kRGScreenWidth [UIScreen mainScreen].bounds.size.width
#define kRGScreenHeight [UIScreen mainScreen].bounds.size.height

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
        
        // Build the UI here.
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0.0, kRGScreenHeight - kRGToastBarHeight, kRGScreenWidth, kRGToastBarHeight);;
        self.windowLevel = UIWindowLevelStatusBar + 1.0f;
        self.backgroundColor = [UIColor blackColor];
        self.hidden = TRUE;
        self.alpha = 0.0f;
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(kRGSLabelPaddingWidth, 0.0f, kRGScreenWidth - (kRGSLabelPaddingWidth * 2.0f), kRGToastBarHeight)];
        self.messageLabel.text = @"✓ Testing";
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.backgroundColor = [UIColor clearColor];
        self.messageLabel.font = [UIFont boldSystemFontOfSize:12.0];
        self.messageLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [self addSubview:self.messageLabel];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeStatusBarFrame:) name:UIApplicationWillChangeStatusBarFrameNotification object:nil];
    }
    
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    
    self.currentToast = nextToast;
    
    if (nextToast != nil) {
        self.messageLabel.text = nextToast.message;
        [UIView animateWithDuration:0.35f animations:^{
            self.hidden = FALSE;
            self.alpha = kRGToastAlpha;
        } completion:^(BOOL finished) {
            NSTimeInterval duration = nextToast.duration == RGToastViewDurationLong ? kRGLongToastDuration : kRGShortToastDuration;
            [self performSelector:@selector(hideCurrentToast) withObject:nil afterDelay:duration];
        }];
    }
}

- (void) hideCurrentToast {
    [UIView animateWithDuration:0.35f animations:^{
        self.hidden = TRUE;
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.messageLabel.text = @"";
        [self showNextToast];
    }];
}

#pragma mark - Rotation Methods
- (void)didChangeStatusBarFrame:(NSNotification *)notification {
    [self performSelector:@selector(handleRotation) withObject:nil afterDelay:0];
}

- (void)handleRotation {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGFloat pi = (CGFloat)M_PI;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            self.transform = CGAffineTransformIdentity;
            self.frame = CGRectMake(0.0, kRGScreenHeight - kRGToastBarHeight, kRGScreenWidth, kRGToastBarHeight);
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.transform = CGAffineTransformMakeRotation(M_PI * (90.0f) / 180.0f);
            self.frame = CGRectMake(0.0f, 0.0f, kRGToastBarHeight, kRGScreenHeight);
            break;
        case UIDeviceOrientationLandscapeRight:
            self.transform = CGAffineTransformMakeRotation(M_PI * (-90.0f) / 180.0f);
            self.frame = CGRectMake(kRGScreenWidth - kRGToastBarHeight, 0.0f, kRGToastBarHeight, kRGScreenHeight);
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.transform = CGAffineTransformMakeRotation(M_PI);
            self.frame = CGRectMake(0.0f, 0.0f, kRGScreenWidth, kRGToastBarHeight);
        default:
            break;
    }
}

@end
