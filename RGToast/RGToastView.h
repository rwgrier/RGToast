//
//  RGToastView.h
//  RGToast
//
//  Created by Ryan Grier on 5/28/13.
//  Copyright (c) 2013 Ryan Grier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RGToast;
@interface RGToastView : UIWindow

+ (RGToastView *) sharedToastView;

- (void) showToast: (RGToast*) toast;

@end
