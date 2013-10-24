//
//  MADViewController.m
//  favorites-lab-09
//
//  Created by Katie Porter on 10/10/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Allocates memeory and initializes the user object
    _user = [[Favorite alloc]init];
}

// This works fine as does the returned method
- (void)viewWillAppear:(BOOL)animated
{
    
}

// Need this method before we hook up the unwind segue
// Can be in the .m because it doesn't need to be public
- (IBAction)returned:(UIStoryboardSegue *)segue
{
    NSString *favBookLabel = [[NSString alloc] initWithFormat:@"Your favorite book is %@.", _user.favBook];
    _bookLabel.text = favBookLabel;
    
    NSString *favAuthorLabel = [[NSString alloc] initWithFormat:@"Your favorite author is %@.", _user.favAuthor];
    _authorLabel.text = favAuthorLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
