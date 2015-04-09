//
//  customCell.h
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol customCellDelegate;


@interface customCell : UITableViewCell

@property (nonatomic, weak) id<customCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *squareBackgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIButton *heartButton;
@property (strong, nonatomic) IBOutlet UIButton *commentButton;
@property (strong, nonatomic) IBOutlet UIButton *profileImageButton;
@property (strong, nonatomic) IBOutlet UIButton *usernameButton;
@property (strong, nonatomic) IBOutlet UIImageView *outfitImageView;

- (IBAction)commentButtonPressed:(id)sender;
- (IBAction)heartButtonPressed:(id)sender;
- (IBAction)profileImageButtonPressed:(id)sender;
- (IBAction)usernameButtonPressed:(id)sender;

@end

@protocol customCellDelegate <NSObject>

- (void)usernameTouched;
-(void)outfitLiked;


@end
