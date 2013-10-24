//
//  MADSecondViewController.m
//  boulder-lab-10
//
//  Created by Katie Porter on 10/17/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitQuestion:(UIButton *)sender
{
    // Dismiss the keyboard using resignFirstResponder regardless of which field is the first responder
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    // Mailto syntax: mailto:first@example.com?cc=second@example.com,third@example.com&subject=something&body=bodytext
    NSString *recipients = @"mailto:jane.porter@colorado.edu?subject=Question from Boulder App";
    NSString *body = [NSString stringWithFormat:@"&body=%@ from %@ %@", _questionTextView.text, _nameTextField.text, _emailTextField.text];
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    
    // Test to see if the string is correct
    // NSLog (email);
    
    //Returns a legal URL string
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // Launch the mail app
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:email]];
}
@end
