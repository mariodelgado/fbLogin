//
//  friendsViewController.m
//  fbLogin
//
//  Created by Mario C. Delgado Jr. on 6/15/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "friendsViewController.h"

@interface friendsViewController ()

@end

@implementation friendsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (UITabBarItem *)tabBarItem
{
    return [[UITabBarItem alloc] initWithTitle:@"Requests" image:[UIImage imageNamed:@"friends.png"] tag:0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
