//
//  DetailViewController.h
//  countries-lab-11
//
//  Created by Katie Porter on 10/24/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

// Define this in the .h because it actually needs to be accessible in other classes
// That's why we want the getter and setter methods
@property (strong, nonatomic)NSMutableArray *countryList;

@end
