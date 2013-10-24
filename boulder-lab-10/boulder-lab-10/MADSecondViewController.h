//
//  MADSecondViewController.h
//  boulder-lab-10
//
//  Created by Katie Porter on 10/17/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;

- (IBAction)submitQuestion:(UIButton *)sender;


@end
