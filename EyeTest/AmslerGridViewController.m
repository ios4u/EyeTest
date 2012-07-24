//
//  AmslerGridViewController.m
//  EyeTest
//
//  Created by 叶 夏 on 07/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AmslerGridViewController.h"
#import "AmslerGridImageView.h"

@implementation AmslerGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AmslerGridImageView *agImageView= [[AmslerGridImageView alloc] initWithImage:[UIImage imageNamed:@"grid.png"]];
    [agImageView setFrame:CGRectMake(89, 222, 560, 560)];
    agImageView.userInteractionEnabled=true;
    [self.view addSubview:agImageView];
    [agImageView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


@end
