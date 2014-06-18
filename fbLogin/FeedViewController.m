//
//  FeedViewController.m
//  fbLogin
//
//  Created by Mario C. Delgado Jr. on 6/14/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *statusBg;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;


@property (weak, nonatomic) IBOutlet UIImageView *statusView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)onStatus:(id)sender;
- (void) loadImage;

@end

@implementation FeedViewController
{
    UIRefreshControl *refreshControl;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (UITabBarItem *)tabBarItem
{
    return [[UITabBarItem alloc] initWithTitle:@"News Feed" image:[UIImage imageNamed:@"news.png"] tag:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrollView.contentSize = _imageView.frame.size;

    
    [self setNeedsStatusBarAppearanceUpdate];
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top_bar.png"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:navbar];
    [self performSelector:@selector(loadImage) withObject:nil afterDelay:2];

    //Pull to Refresh
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(reloadData1) forControlEvents:UIControlEventValueChanged];
    [_scrollView addSubview:refreshControl];

    //Status
    _statusView.alpha = 0;
    _textField.alpha = 0;
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    

    
    
   }

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



//Pull to Refresh


-(void) reloadData1 {

 [self performSelector:@selector(reloadDatas) withObject:refreshControl afterDelay:2.0];
}

-(void)reloadDatas
{
    
    [refreshControl endRefreshing];
}



//Load feed after Delay
- (void)loadImage{
    _imageView.alpha = 0;
    _imageView.hidden = NO;
    [UIImageView animateWithDuration:0.5
                               delay:0.0
                             options:UIViewAnimationOptionCurveEaseIn
                          animations:^{ _imageView.alpha = 1; }
                          completion:^(BOOL finished){
                          self.statusBg.hidden = YES;
                          }
     ];
    [self.indicatorView stopAnimating];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Load Status View

- (IBAction)onStatus:(id)sender{
    [UIView beginAnimations:@"fade in" context:nil];
    [UIView setAnimationDuration:0.3];
    _statusView.alpha = 1.0;
    _textField.alpha = 1.0;
    [UIView commitAnimations];
    [[UIApplication sharedApplication].keyWindow addSubview:_statusView];
    
        // This does not change the status bar to dark when the status screen loads.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [_textField becomeFirstResponder];
}


-(void) dismissKeyboard:(id)sender
{
    [UIView beginAnimations:@"fade in" context:nil];
    [UIView setAnimationDuration:0.3];
    _statusView.alpha = 0.0;
    _textField.alpha = 0;
    [UIView commitAnimations];
    
    // This should change the status bar style back to the light style, right?
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self.view endEditing:YES];
}


@end
