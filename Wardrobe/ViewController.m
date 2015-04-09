//
//  ViewController.m
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setUpSplashPage];
    [self setUpLogin];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma mark- Splash/Landing Page
-(void)setUpSplashPage{
    
    self.splashImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.splashImageView setImage:[UIImage imageNamed:@"Placeholder.png"]];
    [self.view addSubview:self.splashImageView];
    
    self.splashLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.splashLoginButton setFrame:CGRectMake(10, self.view.frame.size.height - 50 - 20, 100, 50)];
    [self.splashLoginButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.splashLoginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [self.splashLoginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.splashLoginButton addTarget:self action:@selector(splashLoginPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.splashLoginButton];
    
    self.splashSignupButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.splashSignupButton setFrame:CGRectMake(CGRectGetMaxX(self.splashLoginButton.frame) + 20, self.view.frame.size.height - 50 - 20, 100, 50)];
    [self.splashSignupButton setBackgroundColor:[UIColor blueColor]];
    [self.splashSignupButton setTitle:@"SIGN-UP" forState:UIControlStateNormal];
    [self.splashSignupButton addTarget:self action:@selector(splashSignupPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.splashSignupButton];
    
}

-(void)showSplash{
    
    self.splashImageView.alpha = 1.0f;
    self.splashLoginButton.alpha = 1.0f;
    self.splashSignupButton.alpha = 1.0f;
    
}

-(void)hideSplash{
    self.splashImageView.alpha = 0.0f;
    self.splashLoginButton.alpha = 0.0f;
    self.splashSignupButton.alpha = 0.0f;
}

-(void)splashLoginPressed{
    [self hideSplash];
    self.loggingIn = YES;
    self.signingUp = NO;
    [self showLogin];
}

-(void)splashSignupPressed{
    [self hideSplash];
    self.loggingIn = NO;
    self.signingUp = YES;
    [self showSignup];
}

#pragma mark- Login/Signup

-(void)setUpLogin{
    
    self.loginWithLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMidY(self.view.frame), 200, 50)];
    [self.loginWithLabel setText:@"LOGIN WITH:"];
    [self.loginWithLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:self.loginWithLabel];
    
    self.twitterRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.twitterRoundButton setFrame:CGRectMake(10, CGRectGetMaxY(self.loginWithLabel.frame) + 10, 50, 50)];
    [self.twitterRoundButton setBackgroundColor:[UIColor blueColor]];
    [self.twitterRoundButton setTitle:@"T" forState:UIControlStateNormal];
    [self.twitterRoundButton addTarget:self action:@selector(authenticateWithTwitter) forControlEvents:UIControlEventTouchUpInside];
    self.twitterRoundButton.clipsToBounds = YES;
    //half of the width
    self.twitterRoundButton.layer.cornerRadius = 50/2.0f;
    [self.view addSubview:self.twitterRoundButton];
    
    self.emailRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.emailRoundButton setFrame:CGRectMake(CGRectGetMaxX(self.twitterRoundButton.frame) + 10, CGRectGetMaxY(self.loginWithLabel.frame) + 10, 50, 50)];
    [self.emailRoundButton  setBackgroundColor:[UIColor blueColor]];
    [self.emailRoundButton setTitle:@"E" forState:UIControlStateNormal];
    [self.emailRoundButton  addTarget:self action:@selector(authenticateWithEmail) forControlEvents:UIControlEventTouchUpInside];
    self.emailRoundButton.clipsToBounds = YES;
    //half of the width
    self.emailRoundButton.layer.cornerRadius = 50/2.0f;
    [self.view addSubview:self.emailRoundButton];
    
    self.facebookRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.facebookRoundButton setFrame:CGRectMake(CGRectGetMaxX(self.emailRoundButton.frame) + 10, CGRectGetMaxY(self.loginWithLabel.frame) + 10, 50, 50)];
    [self.facebookRoundButton  setBackgroundColor:[UIColor blueColor]];
    [self.facebookRoundButton setTitle:@"F" forState:UIControlStateNormal];
    [self.facebookRoundButton  addTarget:self action:@selector(authenticateWithFacebook) forControlEvents:UIControlEventTouchUpInside];
    self.facebookRoundButton.clipsToBounds = YES;
    //half of the width
    self.facebookRoundButton.layer.cornerRadius = 50/2.0f;
    [self.view addSubview:self.facebookRoundButton];
    
    self.googlePlusRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.googlePlusRoundButton setFrame:CGRectMake(CGRectGetMaxX(self.facebookRoundButton.frame) + 10, CGRectGetMaxY(self.loginWithLabel.frame) + 10, 50, 50)];
    [self.googlePlusRoundButton  setBackgroundColor:[UIColor blueColor]];
    [self.googlePlusRoundButton setTitle:@"G+" forState:UIControlStateNormal];
    [self.googlePlusRoundButton  addTarget:self action:@selector(authenticateWithGooglePlus) forControlEvents:UIControlEventTouchUpInside];
    self.googlePlusRoundButton.clipsToBounds = YES;
    //half of the width
    self.googlePlusRoundButton.layer.cornerRadius = 50/2.0f;
    [self.view addSubview:self.googlePlusRoundButton];
    
    self.wardrobeLogo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 250)];
    [self.wardrobeLogo setImage:[UIImage imageNamed:@"LogoPlaceholder.png"]];
    [self.view addSubview:self.wardrobeLogo];
    
    self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - (self.view.frame.size.width/1.5)/2, CGRectGetMaxY(self.wardrobeLogo.frame) + 10, self.view.frame.size.width/1.5, 50)];
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.font = [UIFont systemFontOfSize:15];
    self.emailField.placeholder = @"Email";
    self.emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailField.keyboardType = UIKeyboardTypeDefault;
    self.emailField.returnKeyType = UIReturnKeyNext;
    self.emailField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.emailField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.emailField.delegate = self;
    [self.view addSubview:self.emailField];
    
    
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - (self.view.frame.size.width/1.5)/2, CGRectGetMaxY(self.emailField.frame) + 10, self.view.frame.size.width/1.5, 50)];
    self.usernameField.borderStyle = UITextBorderStyleRoundedRect;
    self.usernameField.font = [UIFont systemFontOfSize:15];
    self.usernameField.placeholder = @"Username";
    self.usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.usernameField.keyboardType = UIKeyboardTypeDefault;
    self.usernameField.returnKeyType = UIReturnKeyNext;
    self.usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.usernameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.usernameField.delegate = self;
    [self.view addSubview:self.usernameField];
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - (self.view.frame.size.width/1.5)/2, CGRectGetMaxY(self.usernameField.frame) + 10, self.view.frame.size.width/1.5, 50)];
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.font = [UIFont systemFontOfSize:15];
    self.passwordField.placeholder = @"Password";
    self.passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordField.keyboardType = UIKeyboardTypeDefault;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    [self.passwordField setSecureTextEntry:YES];
    self.passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordField.delegate = self;
    [self.view addSubview:self.passwordField];
    
    self.loginWithEmailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginWithEmailButton setFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMaxY(self.passwordField.frame) + 10, 100, 50)];
    [self.loginWithEmailButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.loginWithEmailButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [self.loginWithEmailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.loginWithEmailButton addTarget:self action:@selector(loginWithEmailPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginWithEmailButton];

    self.signupWithEmailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.signupWithEmailButton setFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMaxY(self.passwordField.frame) + 10, 100, 50)];
    [self.signupWithEmailButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.signupWithEmailButton setTitle:@"SIGN-UP" forState:UIControlStateNormal];
    [self.signupWithEmailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.signupWithEmailButton addTarget:self action:@selector(signupWithEmailPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signupWithEmailButton];
    
    self.loginWithLabel.alpha = 0.0f;
    self.twitterRoundButton.alpha = 0.0f;
    self.emailRoundButton.alpha = 0.0f;
    self.facebookRoundButton.alpha = 0.0f;
    self.googlePlusRoundButton.alpha = 0.0f;
    self.wardrobeLogo.alpha = 0.0f;
    self.emailField.alpha = 0.0f;
    self.usernameField.alpha = 0.0f;
    self.passwordField.alpha = 0.0f;
    self.loginWithEmailButton.alpha = 0.0f;
    self.signupWithEmailButton.alpha = 0.0f;
    
}

-(void)showLogin{
    
    self.loginWithLabel.alpha = 1.0f;
    self.twitterRoundButton.alpha = 1.0f;
    self.emailRoundButton.alpha = 1.0f;
    self.facebookRoundButton.alpha = 1.0f;
    self.googlePlusRoundButton.alpha = 1.0f;
    self.wardrobeLogo.alpha = 1.0f;

    
}

-(void)showSignup{
    
    [self.loginWithLabel setText:@"SIGN-UP WITH:"];
    self.loginWithLabel.alpha = 1.0f;
    self.twitterRoundButton.alpha = 1.0f;
    self.emailRoundButton.alpha = 1.0f;
    self.facebookRoundButton.alpha = 1.0f;
    self.googlePlusRoundButton.alpha = 1.0f;
    self.wardrobeLogo.alpha = 1.0f;

    
}

-(void)authenticateWithEmail{
    self.twitterRoundButton.alpha = 0.0f;
    self.emailRoundButton.alpha = 0.0f;
    self.facebookRoundButton.alpha = 0.0f;
    self.googlePlusRoundButton.alpha = 0.0f;
    self.loginWithLabel.alpha = 0.0f;
    
    if(self.loggingIn){
        self.usernameField.alpha = 1.0f;
        self.passwordField.alpha = 1.0f;
        self.loginWithEmailButton.alpha = 1.0f;
    }else if(self.signingUp){
        self.emailField.alpha = 1.0f;
        self.usernameField.alpha = 1.0f;
        self.passwordField.alpha = 1.0f;
        self.signupWithEmailButton.alpha = 1.0f;
    }
    
}

-(void)loginWithEmailPressed{
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }else{
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstTime"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertView show];
            }else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            
            
        }];
    }
    
}

-(void)signupWithEmailPressed{
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username, password, and email address!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    else{
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstTime"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        
        PFFile *emptyPicture = [[PFFile alloc] init];
        
        PFObject *userObject = [PFObject objectWithClassName:@"UserObjects"];
        [userObject setObject:newUser.username forKey:@"username"];
        [userObject setObject:emptyPicture forKey:@"profilePicture"];
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertView show];
            }else{
                [userObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if(error){
                        
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                        [alertView show];
                        
                        
                    }else{
                        
                    }
                    
                }];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
        
    }

    
}

#pragma mark- Text and Keyboard Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.passwordField resignFirstResponder];
    [self.emailField resignFirstResponder];
    [self.usernameField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.emailField) {
        //[textField resignFirstResponder];
        [self.usernameField becomeFirstResponder];
    } else if (textField == self.usernameField) {
        //[textField resignFirstResponder];
        [self.passwordField becomeFirstResponder];
        // here you can define what happens
        // when user presses return on the email field
    }else if (textField == self.passwordField) {
        [textField resignFirstResponder];
    }
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
