//
//  ChopStick.m
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "ChopStick.h"

@implementation ChopStick {
    NSLock * _chopStickLock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _chopStickLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)pickUp {
    [_chopStickLock lock];
}

- (void)putDown {
    [_chopStickLock unlock];
}

@end
