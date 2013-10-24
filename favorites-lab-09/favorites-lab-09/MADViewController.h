//
//  MADViewController.h
//  favorites-lab-09
//
//  Created by Katie Porter on 10/10/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bookLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@property (strong, nonatomic) Favorite *user;

@end
