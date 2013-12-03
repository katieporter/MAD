//
//  MADViewController.m
//  animation-lab-15
//
//  Created by Katie Porter on 11/14/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    CGPoint delta; // Specifies how many points the image must move every time the timer fires
    NSTimer *timer; // The animation timer
    float ballRadius; // Radius of the ball
    CGPoint translation; // SPecifies how many pixels the image will move
}

- (void)changeSliderValue
{
    // Create a new timer object with the slider's time interval
    _sliderLabel.text = [NSString stringWithFormat:@"%.2f", _slider.value];
    timer = [NSTimer scheduledTimerWithTimeInterval:_slider.value // Number of seconds between firing sof the timer
                                             target:self
                                           selector:@selector(onTimer) // The message sent when the timer fires
                                           userInfo:nil
                                            repeats:YES]; // Whether or not the timer repeatedly reschedules itself
                                                          // YES will repeatedly reschedule the timer until invalidated
}

- (void)viewDidLoad
{
    // Ball radius is half the width of the image
    ballRadius = _imageView.frame.size.width/2;
    // Initialize the delta -- tells it to move 12 pixels horizontrally, 4 pixels vertically
    delta = CGPointMake(12.0, 4.00);
    [self changeSliderValue];
    translation = CGPointMake(0.0, 0.0);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)onTimer
{
    [UIView beginAnimations:@"my_own_animation" context:nil];
    [UIView animateWithDuration:_slider.value // Animate for the duration of the slider value (time interval)
                          delay:0 // Have the animation start right away
                        options:UIViewAnimationOptionCurveEaseOut // Set the animation curve type
                     animations:^{_imageView.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
                         translation.x += delta.x;
                         translation.y += delta.y;
                     } // Change the position by setting a new center of the image view
                     completion:NULL];
    [UIView commitAnimations];
    
    if (_imageView.center.x + translation.x > self.view.bounds.size.width - ballRadius || _imageView.center.x  + translation.x < ballRadius)
        delta.x = -delta.x;
    if (_imageView.center.y  + translation.y > self.view.bounds.size.height - ballRadius || _imageView.center.y  + translation.y < ballRadius)
        delta.y = -delta.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    // Stop the timer
    [timer invalidate];
    // Must invalidate and create a new object to change its firing interval
    [self changeSliderValue];
}
@end
