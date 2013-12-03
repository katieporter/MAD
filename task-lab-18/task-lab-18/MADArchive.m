//
//  MADArchive.m
//  task-lab-18
//
//  Created by Katie Porter on 12/3/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADArchive.h"

@implementation MADArchive
#define kTask1key @"Task1"
#define kTask2key @"Task2"
#define kTask3key @"Task3"
#define kTask4key @"Task4"

// NSCoder method to encode objects into an archive
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_taskone
                  forKey:kTask1key];
    [aCoder encodeObject:_tasktwo
                  forKey:kTask2key];
    [aCoder encodeObject:_taskthree
                  forKey:kTask3key];
    [aCoder encodeObject:_taskfour
                  forKey:kTask4key];

}

// NSCoder method to decode objects from an archive
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]) // Initializes our object
    {
        // Decode the 4 strings from the archive
        _taskone = [aDecoder decodeObjectForKey:kTask1key];
        _tasktwo = [aDecoder decodeObjectForKey:kTask2key];
        _taskthree = [aDecoder decodeObjectForKey:kTask3key];
        _taskfour = [aDecoder decodeObjectForKey:kTask4key];
        
    }
    return self;
}

// NSCopy method to copy objects
- (id)copyWithZone:(NSZone *)zone
{
    // Create a new object and copy the 4 strings into it
    MADArchive *copy = [[[self class] allocWithZone:zone]init];
    copy.taskone = [self.taskone copyWithZone:zone];
    copy.tasktwo = [self.tasktwo copyWithZone:zone];
    copy.taskthree = [self.taskthree copyWithZone:zone];
    copy.taskfour = [self.taskfour copyWithZone:zone];
    return copy;
}

@end
