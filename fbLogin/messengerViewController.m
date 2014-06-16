//
//  messengerViewController.m
//  fbLogin
//
//  Created by Mario C. Delgado Jr. on 6/15/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "messengerViewController.h"

@interface messengerViewController ()

@end

@implementation messengerViewController

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
    return [[UITabBarItem alloc] initWithTitle:@"Messeages" image:[UIImage imageNamed:@"messages.png"] tag:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
