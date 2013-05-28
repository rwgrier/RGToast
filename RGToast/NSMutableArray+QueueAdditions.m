// Based on http://stackoverflow.com/a/936497

#import "NSMutableArray+QueueAdditions.h"

@implementation NSMutableArray (QueueAdditions)
// Queues are first-in-first-out, so we remove objects from the head
- (id) dequeue {
    // to avoid raising exception (Quinn)
    if ([self count] == 0) {
        return nil;
    }
    
    id headObject = [self objectAtIndex:0];
    [self removeObjectAtIndex:0];

    return headObject;
}

// Add to the tail of the queue (no one likes it when people cut in line!)
- (void) enqueue:(id)anObject {
    [self addObject:anObject];
    //this method automatically adds to the end of the array
}
@end
