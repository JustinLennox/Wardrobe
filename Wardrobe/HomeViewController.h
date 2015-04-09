//
//  HomeViewController.h
//  Wardrobe
//
//  Created by Justin Lennox on 4/9/15.
//  Copyright (c) 2015 Justin Lennox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customCell.h"

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, customCellDelegate>

@property (strong, nonatomic) UITableView *tableView;
-(void)usernameTouched;

@end
