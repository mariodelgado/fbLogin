//
//  FeedViewController.m
//  fbLogin
//
//  Created by Mario C. Delgado Jr. on 6/14/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *statusBg;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (void) loadImage;

@end

@implementation FeedViewController

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
    [self setNeedsStatusBarAppearanceUpdate];
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    //do something like background color, title, etc you self
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top_bar.png"] forBarMetrics:UIBarMetricsDefault];

    [self.view addSubview:navbar];
    
    [self performSelector:@selector(loadImage) withObject:nil afterDelay:2];
    


   }

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

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
