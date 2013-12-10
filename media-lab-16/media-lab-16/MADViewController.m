//
//  MADViewController.m
//  media-lab-16
//
//  Created by Katie Porter on 11/19/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    UIImage *image;
    NSURL *videoURL;
}

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

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender
{
    // Check the device to make sure it has a camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        // Initialize the controller
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        // Set the delegate so it can find out when the picture is ready
        imagePickerController.delegate = self;
        // Use the camera interface
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        // Display camera control
        imagePickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie, nil];
        // Slide up the camera interface
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"Can't access the camera");
    }
}

- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    if (image || videoURL)
    {
        [actionSheet addButtonWithTitle:@"Save"];
    }
    
    [actionSheet addButtonWithTitle:@"Camera Roll"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    
    actionSheet.cancelButtonIndex = actionSheet.numberOfButtons - 1;
    
    [actionSheet showInView:self.view];
}

// Implement the action sheet delegate methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Save"])
    {
        if (image)
        {
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    else if (videoURL)
    {
        // Convert URL to a string
        NSString *urlString = [videoURL path];
        // Check that the device can save vieo to the camera roll as not all devices can
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlString))
        {
            UISaveVideoAtPathToSavedPhotosAlbum(urlString, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    else if ([buttonTitle isEqualToString:@"Camera Roll"])
    {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        imagePickerController.allowsEditing = NO;
        imagePickerController.delegate = self;
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
}

- (void) image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextIngo
{
    if(error)
    {
        NSLog(@"Error! %@", [error localizedDescription]);
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Image Saved"
                                                            message:@"Image saved successfully to camera roll."
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error)
    {
        NSLog(@"Error! %@", [error localizedDescription]);
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Video Saved"
                                                            message:@"Video successfully saved to camera roll."
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

// Camera delegate methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Determines whether it was a pictur eor video
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    image = nil;
    _imageView.image = nil;
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) // Picture
    {
        // The original, unmodified image from the camera
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        // The final, edited image if editing was enabled
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        image = editedImage ? editedImage : originalImage; // Abbreviated if/else statement (if editedImage, set to image, otherwise, set originalImage to image)
        _imageView.image = image;
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
