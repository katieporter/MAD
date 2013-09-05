//
//  MADViewController.h
//  helloworld
//
//  Created by Katie Porter on 8/29/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *messageText;


@end
