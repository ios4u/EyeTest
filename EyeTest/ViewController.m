//
//  ViewController.m
//  EyeTest
//
//  Created by 夏 叶 on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AcuityTestViewController.h"
#import "OtherTestListViewController.h"
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)acuityTest:(id)sender {
    AcuityTestViewController *viewController=[[AcuityTestViewController alloc] init];
    UINavigationController *nvgViewController=[[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentModalViewController:nvgViewController animated:YES];
    [nvgViewController release];
    [viewController release];
}

- (IBAction)moreTest:(id)sender {
    OtherTestListViewController *otherTestList=[[OtherTestListViewController alloc] init];
    UINavigationController *nvgViewController=[[UINavigationController alloc] initWithRootViewController:otherTestList];
    [self presentModalViewController:nvgViewController animated:YES];
    [nvgViewController release];
    [otherTestList release];
}
@end
