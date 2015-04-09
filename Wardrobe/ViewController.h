//
//  ViewController.h
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

#pragma mark- Landing/Splash Page
@property (strong, nonatomic) UIButton *splashLoginButton;
@property (strong, nonatomic) UIButton *splashSignupButton;
@property (strong, nonatomic) UIImageView *splashImageView;
@property (nonatomic) BOOL loggingIn;
@property (nonatomic) BOOL signingUp;

-(void)splashLoginPressed;
-(void)splashSignupPressed;
-(void)hideSplash;


#pragma mark- Login/Signup

@property (strong, nonatomic) UILabel *loginWithLabel;
@property (strong, nonatomic) UIButton *twitterRoundButton;
@property (strong, nonatomic) UIButton *emailRoundButton;
@property (strong, nonatomic) UIButton *facebookRoundButton;
@property (strong, nonatomic) UIButton *googlePlusRoundButton;
@property (strong, nonatomic) UIImageView *wardrobeLogo;
@property (strong, nonatomic) UIButton *loginWithEmailButton;
@property (strong, nonatomic) UIButton *signupWithEmailButton;

-(void)setUpLogin;
-(void)authenticateWithTwitter;
-(void)authenticateWithEmail;
-(void)authenticateWithFacebook;
-(void)authenticateWithGooglePlus;
-(void)loginWithEmailPressed;
-(void)signupWithEmailPressed;

//TextFields & Keyboard Stuff for Email
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UITextField *usernameField;
@property (strong, nonatomic) UITextField *passwordField;


@end

