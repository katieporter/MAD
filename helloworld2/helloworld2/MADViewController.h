//
//  MADViewController.h
//  helloworld2
//
//  Created by Katie Porter on 9/3/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageText;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
