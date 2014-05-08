//
//  PhilosopherViewController.m
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "PhilosopherViewController.h"
#import "Philosopher.h"

@interface PhilosopherViewController () {
    Philosopher * _philosopher;
    __weak IBOutlet UIImageView * _activityImageView;
}

@end

@implementation PhilosopherViewController

- (void)setPhilosopher:(Philosopher*)aPhilosopher {
    _philosopher = aPhilosopher;
    [_philosopher addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)dealloc {
    [_philosopher removeObserver:self forKeyPath:@"state"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"state"]) {
        NSNumber * newStateNumber = [change objectForKey:NSKeyValueChangeNewKey];
        PhilosopherState newState = [newStateNumber integerValue];
        if (newState == PhilosopherStateWaiting) {
            [self setImageNamed:@"hourglass"];
        }
        else if (newState == PhilosopherStateEating) {
            [self setImageNamed:@"cookie"];
        }
        else if (newState == PhilosopherStateThinking) {
            [self setImageNamed:@"thikning_bubble"];
        }
    }
}

- (void)setImageNamed:(NSString*)anImageName {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (anImageName != nil) {
            _activityImageView.hidden = NO;
            _activityImageView.image = [UIImage imageNamed:anImageName];
        }
        else {
            _activityImageView.hidden = YES;
        }
    });
}

@end
