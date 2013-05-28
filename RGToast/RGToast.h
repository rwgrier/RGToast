//
//  RGToast.h
//  RGToast
//
//  Created by Ryan Grier on 5/28/13.
//  Copyright (c) 2013 Ryan Grier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGToast : NSObject

@property (nonatomic, copy) NSString*               message;
@property (nonatomic, assign) NSUInteger            duration;
@property (nonatomic, assign) BOOL                  animate;

@end
