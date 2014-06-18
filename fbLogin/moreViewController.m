//
//  moreViewController.m
//  fbLogin
//
//  Created by Mario C. Delgado Jr. on 6/14/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "moreViewController.h"
#import "loginViewController.h"

@interface moreViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview; 
@property (weak, nonatomic) IBOutlet UIImageView *moreView;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) UIActionSheet *actionsheet;
@property(nonatomic, getter=isScrollEnabled) BOOL scrollEnabled;


- (IBAction)logoutConfirm:(id)sender;
@end

@implementation moreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setNeedsStatusBarAppearanceUpdate];
    
    
    //Setup Scroll View
    _scrollview.contentSize = _moreView.frame.size;
    
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64) ];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top_bar_more.png"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:navbar];
}

- (void)viewDidAppear:(BOOL)animated{
    
    ((UILabel *)self.navigationController.navigationBar.topItem.titleView).text = @"More";
}

- (UITabBarItem *)tabBarItem
{
    return [[UITabBarItem alloc] initWithTitle:@"More" image:[UIImage imageNamed:@"more.png"] tag:0];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



//Logout
- (IBAction)logoutConfirm:(id)sender{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to logout?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Logout" otherButtonTitles: nil];
    [actionSheet showInView:self.view];
}



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex ==0) {
        //logout
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        //delete user ID fro user Defaults
        [defaults setObject:nil forKey:@"UserId"];
        //redirect to login view
        
        UIViewController *vc = [[loginViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; // Flip
[self presentViewController:vc animated:YES completion:nil];
        

    };
}

@end
