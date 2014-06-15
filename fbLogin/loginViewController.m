//
//  loginViewController.m
//  fbLogin
//
//  Created by Mario C. Delgado Jr. on 6/14/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "loginViewController.h"
#import "BSKeyboardControls.h"



@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@property (weak, nonatomic) IBOutlet UIImageView *fieldBg;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property(readwrite, retain) UIView *inputAccessoryView;
@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property(nonatomic, readonly, getter=isEditing) BOOL editing;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;




@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
      [self setNeedsStatusBarAppearanceUpdate];

    
    NSArray *fields = @[ self.userField, self.passField];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];


    // Do any additional setup after loading the view from its nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [self.keyboardControls.activeField resignFirstResponder];
}

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    UIView *view = keyboardControls.activeField.superview.superview;
    [self.scrollView scrollRectToVisible:view.frame animated:YES];
}

-(void)dismissKeyboard
{
    UITextField *activeTextField = nil;
    if ([_userField isEditing]) activeTextField = _userField;
    else if ([_passField isEditing]) activeTextField = _passField;
    if (activeTextField) [activeTextField resignFirstResponder];
}


- (void)textFieldDidBeginEditing:(UITextField *)passField
{
    [self.keyboardControls setActiveField:passField];
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [self setUserField:nil];
    [self setPassField:nil];

    [self setKeyboardControls:nil];
    
  
    

}




- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.scrollView.frame = CGRectMake(0, self.view.frame.size.height + 200 - kbSize.height - self.scrollView.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.scrollView.frame = CGRectMake(0, self.view.frame.size.height - self.scrollView.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
                     }
                     completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
