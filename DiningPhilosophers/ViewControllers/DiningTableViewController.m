//
//  DiningTableViewController.m
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "DiningTableViewController.h"
#import "PhilosopherViewController.h"
#import "ChopStick.h"
#import "Philosopher.h"

@interface DiningTableViewController () {
    __weak IBOutlet PhilosopherViewController * _philosopherControllerOne;
    __weak IBOutlet PhilosopherViewController * _philosopherControllerTwo;
    __weak IBOutlet PhilosopherViewController * _philosopherControllerThree;
    __weak IBOutlet PhilosopherViewController * _philosopherControllerFour;
    __weak IBOutlet PhilosopherViewController * _philosopherControllerFive;
    
    NSArray * _chopSticks;
    NSArray * _philosophers;
}

@end

@implementation DiningTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _chopSticks = @[[ChopStick new], [ChopStick new], [ChopStick new], [ChopStick new], [ChopStick new]];
    
    
    
    _philosophers = @[
               [[Philosopher alloc] initWithName:@"First" leftStick:_chopSticks[4] rightStick:_chopSticks[0]],
               [[Philosopher alloc] initWithName:@"Second" leftStick:_chopSticks[0] rightStick:_chopSticks[1]],
               [[Philosopher alloc] initWithName:@"Third" leftStick:_chopSticks[1] rightStick:_chopSticks[2]],
               [[Philosopher alloc] initWithName:@"Forth" leftStick:_chopSticks[2] rightStick:_chopSticks[3]],
               [[Philosopher alloc] initWithName:@"Fifth" leftStick:_chopSticks[3] rightStick:_chopSticks[4]],
               ];
    
    [_philosopherControllerOne setPhilosopher:_philosophers[0]];
    [_philosopherControllerTwo setPhilosopher:_philosophers[1]];
    [_philosopherControllerThree setPhilosopher:_philosophers[2]];
    [_philosopherControllerFour setPhilosopher:_philosophers[3]];
    [_philosopherControllerFive setPhilosopher:_philosophers[4]];
    
    [_philosophers makeObjectsPerformSelector:@selector(start)];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"firstPhilosopherSegue"]) {
        _philosopherControllerOne = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:@"secondPhilosopherSegue"]) {
        _philosopherControllerTwo = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:@"thirdPhilosopherSegue"]) {
        _philosopherControllerThree = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:@"forthPhilosopherSegue"]) {
        _philosopherControllerFour = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:@"fifthPhilosopherSegue"]) {
        _philosopherControllerFive = segue.destinationViewController;
    }
}

@end
