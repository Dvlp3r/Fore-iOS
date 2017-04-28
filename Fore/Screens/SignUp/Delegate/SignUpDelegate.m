//
//  SignUpDelegate.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "SignUpDelegate.h"

@implementation SignUpDelegate

-(void)signUp:(UIViewController *)controller;
{
    self.facebookService = [[FOFacebookService alloc] init];//need to do shared instance here
    [[self facebookService] setFacebookLoginDelegate:self];
    [[self facebookService] login:controller];
}

-(void)facebookLoginDidFail:(NSError *)error;
{

}

-(void)facebookLoginDidSucceed:(NSDictionary *)details;
{
    NSLog(@"Details:%@",details);
    [self login:details];
}

-(void)login:(NSDictionary *)userDetails;
{
    
}

@end
