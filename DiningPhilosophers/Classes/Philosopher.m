//
//  Philosopher.m
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "Philosopher.h"
#import "ChopStick.h"

NSUInteger const maxEatingTime = 10;
NSUInteger const maxThinkingTime = 10;

@implementation Philosopher

- (instancetype)initWithName:(NSString*)aName leftStick:(ChopStick*)aLeftChopStick rightStick:(ChopStick*)aRightChopStick {
    self = [super init];
    if (self) {
        _name = [aName copy];
        _leftChopStick = aLeftChopStick;
        _rightChopStick = aRightChopStick;
    }
    return self;
}

- (void)main {
    @autoreleasepool {
        NSLog(@"Philosopher %@ started", _name);
        while (YES) {
            [self think];
            [self pickUpChopSticks];
            [self eat];
        }
    }
}

- (void)pickUpChopSticks {
    self.state = PhilosopherStateWaiting;
    [self pickUpLeftChopStick];
    [self pickUpRightChopStick];
}

- (void)pickUpLeftChopStick {
    [_leftChopStick pickUp];
}

- (void)pickUpRightChopStick {
    [_rightChopStick pickUp];
}

- (void)eat {
    self.state = PhilosopherStateEating;
    NSUInteger eatingTime = (arc4random() % (maxEatingTime - 1)) + 1;
    NSLog(@"Philosopher %@ is eating for %d seconds", _name, eatingTime);
    [NSThread sleepForTimeInterval:eatingTime];
    NSLog(@"Philosopher %@ finished eating", _name);
    [self putDownChopSticks];
}

- (void)putDownChopSticks {
    [_leftChopStick putDown];
    [_rightChopStick putDown];
}

- (void)think {
    self.state = PhilosopherStateThinking;
    NSUInteger thinkingTime = (arc4random() % (maxThinkingTime - 1)) + 1;
    NSLog(@"Philosopher %@ is thinking for %d seconds", _name, thinkingTime);
    [NSThread sleepForTimeInterval:thinkingTime];
    NSLog(@"Philosopher %@ finished thinking", _name);
}

@end
