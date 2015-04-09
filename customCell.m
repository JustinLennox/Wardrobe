//
//  customCell.m
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//

#import "customCell.h"

@implementation customCell
@synthesize heartButton;
@synthesize commentButton;
@synthesize usernameButton;
@synthesize profileImageButton;
@synthesize squareBackgroundImageView;
@synthesize timeLabel;

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"customCell" owner:self options:nil];
        self = [nibArray objectAtIndex:0];
    }
    return self;
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
    NSLog(@"Pressed!");
}

- (IBAction)profileImageButtonPressed:(id)sender {
}
@end