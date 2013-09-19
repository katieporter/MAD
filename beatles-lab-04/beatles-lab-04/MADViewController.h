//
//  MADViewController.h
//  beatles-lab-04
//
//  Created by Katie Porter on 9/17/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
//create an outlet when you plan to change the object with code
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;
//want this as an outlet since we need to access it to see which option is chosen
@property (weak, nonatomic) IBOutlet UISwitch *capitalizeSwitch;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeNumberLabel;
@property (weak, nonatomic) IBOutlet UISlider *changeFontSize;

- (IBAction)changeImage:(UISegmentedControl *)sender;
//create an action when you want to do something with the object
- (IBAction)updateFont:(UISwitch *)sender;
- (IBAction)changeFontSize:(UISlider *)sender;

@end
