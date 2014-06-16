//
//  LoginViewController.m
//  Week2
//
//  Created by Jason Chua on 6/14/14.
//  Copyright (c) 2014 Jason. All rights reserved.
//
/* to do:
 -Shift things up on keyboard appear
 -button selected title persistence
 */


#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
- (IBAction)onLogInButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *loginViewBox;
- (IBAction)onTap:(id)sender;
- (void)continueWithLogin;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (void)updateValues;
@property (strong, nonatomic) IBOutlet UIButton *logInButton;


@end

@implementation LoginViewController

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
    //rounds corners of login box
    self.loginViewBox.layer.cornerRadius = 4;
    self.logInButton.enabled = NO;

    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogInButton:(id)sender {
    //store password as a variable
    [self.view endEditing:YES];
    NSString *password = self.passwordText.text;
    
    //check if password is "password"
    if ([password isEqualToString:@"password"]) {
        self.logInButton.selected = YES;
        self.logInButton.enabled = NO;
        [self.activityIndicator startAnimating];
        // This will run "continueWithLogin" after a 3 second delay.
        [self performSelector:@selector(continueWithLogin) withObject:nil afterDelay:3];
    }
    else
        [self showPasswordAlert];
        }
        
- (void)showPasswordAlert{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you have entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
          [alertView show];
}


- (void)continueWithLogin{
    [self.activityIndicator stopAnimating];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)isUsernameFilled:(NSString *)username {
    if(username.length >= 1)
    {
        return YES;
    }
    else return NO;
}

- (BOOL)isPasswordFilled:(NSString *)password {
    if(password.length >= 1)
    {
        return YES;
    }
    else return NO;
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    
    //store username as a variable
    NSString *username = self.usernameText.text;
    
    //store password as a variable
    NSString *password = self.passwordText.text;
    
    //check if username and password field is filled in
    if ([self isUsernameFilled:username] && [self isPasswordFilled:password]) {
        self.logInButton.enabled = YES;
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // check if valid and update button
    [self updateValues];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self onLogInButton:nil];
    return YES;
}


@end
