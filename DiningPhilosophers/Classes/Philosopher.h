//
//  Philosopher.h
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChopStick;

typedef NS_ENUM(NSUInteger, PhilosopherState) {
    PhilosopherStateWaiting = 0,
    PhilosopherStateEating,
    PhilosopherStateThinking,
};

@interface Philosopher : NSThread {
    ChopStick * _leftChopStick;
    ChopStick * _rightChopStick;
}

- (instancetype)initWithName:(NSString*)aName leftStick:(ChopStick*)aLeftChopStick rightStick:(ChopStick*)aRightChopStick;

@property (nonatomic, readonly) NSString * name;
@property (assign, nonatomic) PhilosopherState state;

@end
