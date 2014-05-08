//
//  AppDelegate.m
//  DiningPhilosophers
//
//  Created by Viktor Jenei on 08/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "AppDelegate.h"
#import "ChopStick.h"
#import "Philosopher.h"

@interface AppDelegate () {
    NSArray * _table;
    NSArray * _chopSticks;
}

@end

@implementation AppDelegate

- (void)setUpTable {
    _chopSticks = @[[ChopStick new], [ChopStick new], [ChopStick new], [ChopStick new], [ChopStick new]];
    _table = @[
               [[Philosopher alloc] initWithName:@"First" leftStick:_chopSticks[4] rightStick:_chopSticks[0]],
               [[Philosopher alloc] initWithName:@"Second" leftStick:_chopSticks[0] rightStick:_chopSticks[1]],
               [[Philosopher alloc] initWithName:@"Third" leftStick:_chopSticks[1] rightStick:_chopSticks[2]],
               [[Philosopher alloc] initWithName:@"Forth" leftStick:_chopSticks[2] rightStick:_chopSticks[3]],
               [[Philosopher alloc] initWithName:@"Fifth" leftStick:_chopSticks[3] rightStick:_chopSticks[4]],
               ];
    [_table makeObjectsPerformSelector:@selector(start)];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self setUpTable];
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
