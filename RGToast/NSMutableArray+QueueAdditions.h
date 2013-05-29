// Based on http://stackoverflow.com/a/936497

#import <Foundation/Foundation.h>

@interface NSMutableArray (QueueAdditions)

- (id)dequeue;
- (void)enqueue:(id)obj;

@end