//
//  Philosopher.h
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChopStick;

/*
typedef NS_ENUM(NSUInteger, PhilosopherState) {
    PhilosopherStateThinking = 0,
    PhilosopherStateEating,
    PhilosopherStateWaiting,
};
*/

@interface Philosopher : NSThread {
    ChopStick * _leftChopStick;
    ChopStick * _rightChopStick;
    // PhilosopherState _state;
}

- (instancetype)initWithName:(NSString*)aName leftStick:(ChopStick*)aLeftChopStick rightStick:(ChopStick*)aRightChopStick;

@property (nonatomic, readonly) NSString * name;

@end
