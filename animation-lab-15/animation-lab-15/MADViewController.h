//
//  MADViewController.h
//  animation-lab-15
//
//  Created by Katie Porter on 11/14/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

- (IBAction)sliderMoved:(UISlider *)sender;

@end
