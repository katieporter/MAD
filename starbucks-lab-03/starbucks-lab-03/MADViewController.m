//
//  MADViewController.m
//  starbucks-lab-03
//
//  Created by Katie Porter on 9/10/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

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

- (IBAction)buttonPressed:(UIButton *)sender {
    
    [sender resignFirstResponder];
    
    if(sender.tag==1){
        _coffeeimage.image=[UIImage imageNamed:@"frap.png"];
        //Square brackets mean you are calling a method
        //@ goes before every string in Objective-C
        //coffeeimage is the outlet name
        //_ will match what you have in your .h
        
        NSString *message=[[NSString alloc] initWithFormat:@"%@, I also love Frappuccinos!", _nameField.text];
        
        _messageLabel.text=message;
        //% is a marker for something you are going to pass, and the @ sign indicates that it will be a string
    }
    
    if(sender.tag==2){
        _coffeeimage.image=[UIImage imageNamed:@"latte.png"];
        
        NSString *message=[[NSString alloc] initWithFormat:@"Lattes are my favorite too, %@!", _nameField.text];
        
        _messageLabel.text=message;
    }
    
}
- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
