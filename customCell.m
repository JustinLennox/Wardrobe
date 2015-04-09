//
//  customCell.m
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//

#import "customCell.h"
#import "HomeViewController.h"

@implementation customCell
@synthesize heartButton;
@synthesize commentButton;
@synthesize usernameButton;
@synthesize profileImageButton;
@synthesize squareBackgroundImageView;
@synthesize timeLabel;
@synthesize outfitImageView;

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"customCell" owner:self options:nil];
        self = [nibArray objectAtIndex:0];
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(outfitTapped:)];
        tapRecognizer.numberOfTapsRequired = 2;
        [self.outfitImageView addGestureRecognizer:tapRecognizer];
        self.outfitImageView.userInteractionEnabled = YES;
    }
    return self;
}

-(void)outfitTapped : (UITapGestureRecognizer *)sender{
    
    if(sender.state == UIGestureRecognizerStateEnded){
        [self outfitLiked];
    }
    
    id<customCellDelegate> strongDelegate = self.delegate;
    
    // Our delegate method is optional, so we should
    // check that the delegate implements it
    if ([strongDelegate respondsToSelector:@selector(outfitLiked)]){
        [strongDelegate outfitLiked];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)heartButtonPressed:(id)sender {
    
}

- (IBAction)commentButtonPressed:(id)sender {
}

- (IBAction)usernameButtonPressed:(id)sender {
    
    id<customCellDelegate> strongDelegate = self.delegate;
    
    // Our delegate method is optional, so we should
    // check that the delegate implements it
    if ([strongDelegate respondsToSelector:@selector(usernameTouched)]){
        [strongDelegate usernameTouched];
    }


}

- (IBAction)profileImageButtonPressed:(id)sender {
    
    id<customCellDelegate> strongDelegate = self.delegate;
    
    // Our delegate method is optional, so we should
    // check that the delegate implements it
    if ([strongDelegate respondsToSelector:@selector(usernameTouched)]){
        [strongDelegate usernameTouched];
    }
}

#pragma mark- Custom Cell Delegate
-(void)usernameTouched{
    
}

-(void)outfitLiked{
    
    UIImageView *heartFade = [[UIImageView alloc] initWithFrame:CGRectMake(self.outfitImageView.center.x -25, self.outfitImageView.center.y - 25, 50, 50)];
    [heartFade setImage:[UIImage imageNamed:@"heart.png"]];
    [self addSubview:heartFade];
    
    
    [UIView animateWithDuration:0.3f delay:0.0f options:
     UIViewAnimationOptionCurveEaseIn animations:^{
         heartFade.alpha = 1.0f;
         
     } completion:^ (BOOL completed) {
         [UIView animateWithDuration:0.3f delay:0.5f options:
          UIViewAnimationOptionCurveEaseIn animations:^{
              heartFade.alpha = 0.0f;
          } completion:nil];
     }];
    
    
    
}

@end
