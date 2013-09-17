//
//  MADViewController.h
//  starbucks-lab-03
//
//  Created by Katie Porter on 9/10/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
//When you import frameworks, they are in angled brackets

@interface MADViewController : UIViewController
//MADViewController is a subclass of UIViewController

- (IBAction)buttonPressed:(UIButton *)sender;
//action is a method--it is going to DO something
//Minus sign means it is calling the method on an object

@property (weak, nonatomic) IBOutlet UIImageView *coffeeimage;
//Outlet is an instance variable

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
//make this an outlet because we want to add content to it in our .m file

@property (weak, nonatomic) IBOutlet UITextField *nameField;
//make this an outlet because we want to be able to access the info that the user enters

- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
