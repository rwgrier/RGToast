// Based on http://stackoverflow.com/a/936497

#import <Foundation/Foundation.h>
/**
 * This category is based on the Stackoverflow answer given [here](http://stackoverflow.com/a/936497). 
 * I tweaked a few things, but cannot take credit for all of it. 
 */

@interface NSMutableArray (QueueAdditions)

/** @name Usage Methods */
/**
 * Removes and returns the first item in the queue. 
 * @return The first object in the queue.
 */
- (id)dequeue;

/**
 * Adds a new item to the end of the queue
 * @param obj The new item/object to add to the end of the queue. 
 */
- (void)enqueue:(id)obj;

@end