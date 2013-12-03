//
//  MADViewController.m
//  task-lab-18
//
//  Created by Katie Porter on 12/3/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"
#import "MADArchive.h"

@interface MADViewController ()

@end

@implementation MADViewController

#define kFilename @"archive"
#define kDataKey @"Data"

- (NSString *)dataFilePath
{
    // Locate the document directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    // Create the full path to our file
    return [docDirectory stringByAppendingPathComponent:kFilename];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *filePath = [self dataFilePath];
    // Check to see if the file exists
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        // Load the contents of the file into an array
        NSData *data = [[NSMutableData alloc]initWithContentsOfFile:[self dataFilePath]];
        // Create an instance to decode the data
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        // Copy values from the ordered array into the text fields
        MADArchive *taskArchive=[unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding]; // Tell the unarchiver we're finished
        _task1.text = taskArchive.taskone;
        _task2.text = taskArchive.tasktwo;
        _task3.text = taskArchive.taskthree;
        _task4.text = taskArchive.taskfour;
    }
    
    // Application instance
    UIApplication *app = [UIApplication sharedApplication];
    // Subscribe to the UIApplicationWillResignActiveNotification notification
    [[NSNotificationCenter defaultCenter] addObserver:self // MADViewController is notified
                                             selector:@selector(applicationWillResignActive:) // Call applicationWillResignActive when the notification is received
                                                 name:UIApplicationWillResignActiveNotification // Notification posted when the app is no longer active
                                               object:app]; // The object we're getting the notification from
}

// Called when UIApplicationWillResignActiveNotification notification is posted
// All notification methods take a single NSNotification instance as their argument
- (void)applicationWillResignActive:(NSNotification *)notification
{
    MADArchive *taskArchive = [[MADArchive alloc]init];
    taskArchive.taskone = _task1.text;
    taskArchive.tasktwo = _task2.text;
    taskArchive.taskthree = _task3.text;
    taskArchive.taskfour = _task4.text;
    // Create an instance to hold the encoded data
    NSMutableData *data = [[NSMutableData alloc]init];
    // Create instance to archive objects
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    // Archive objects
    [archiver encodeObject:taskArchive
                    forKey:kDataKey]; // Tell the archiver we are finished
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
