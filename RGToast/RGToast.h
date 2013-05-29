//
//  RGToast.h
//  RGToast
//
// Copyright (c) 2013 Ryan Grier (http://www.ryangrier.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RGToastView.h"
/**
 * RGToast provides a toast through the UI for users to see a temporary message shown on
 * the screen. Inspiration for RGToast is taken from both [Matthias Tretter's](https://github.com/myell0w)
 * [MTStatusBarOverlay](https://github.com/myell0w/MTStatusBarOverlay) and Android's
 * [Toast](http://developer.android.com/reference/android/widget/Toast.html) mechanism.
 *
 * RGToast currently only shows a toast as an overlay at the bottom of the screen.
 * 
 * See the project here: [RGToast](https://github.com/rwgrier/RGToast)
 * See the sample project here: [RGToastSample](https://github.com/rwgrier/RGToastSample)
 */

typedef enum RGToastViewDuration {
    RGToastViewDurationShort,
    RGToastViewDurationLong
} RGToastViewDuration;

@interface RGToast : NSObject

/** @name Properties */
/** The message to be shown in the toast. */
@property (nonatomic, copy) NSString *message;

/** The duration of the toast. */
@property (nonatomic, assign) RGToastViewDuration duration;

/** @name Creation Methods */
/**
 * Creates and returns an RGToast object with the given message and a `RGToastViewDurationShort` duration.
 * @param message The message to be shown in the toast.
 * @return A new RGToast object that can be shown. 
 */
+ (RGToast *)makeToast:(NSString *)message;

/**
 * Creates and returns an RGToast object with the given message and duration.
 * @param message The message to be shown in the toast.
 * @param duration The duration of the toast.
 * @return A new RGToast object that can be shown.
 */
+ (RGToast *)makeToast:(NSString *)message duration:(RGToastViewDuration)duration;

/** @name Usage Methods */
/**
 * An instance method to show this RGToast in the UI. 
 */
- (void)show;

@end
