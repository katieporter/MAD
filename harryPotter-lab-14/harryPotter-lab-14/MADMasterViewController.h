//
//  MADMasterViewController.h
//  harryPotter-lab-14
//
//  Created by Katie Porter on 11/5/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MADDetailViewController;

@interface MADMasterViewController : UITableViewController

@property (strong, nonatomic) MADDetailViewController *detailViewController;

@property (copy, nonatomic) NSArray *characters;

@end
