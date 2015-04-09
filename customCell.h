//
//  customCell.h
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *squareBackgroundImageView;
@property (strong, nonatomic) IBOutlet UIButton *profileImageButton;

@property (strong, nonatomic) IBOutlet UIButton *usernameButton;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UIButton *heartButton;
- (IBAction)heartButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *commentButton;
- (IBAction)commentButtonPressed:(id)sender;



- (IBAction)usernameButtonPressed:(id)sender;
- (IBAction)profileImageButtonPressed:(id)sender;




@end
