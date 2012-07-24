//
//  TestResultViewController.m
//  EyeTest
//
//  Created by 夏 叶 on 12-5-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TestResultViewController.h"

@interface TestResultViewController ()

@end

@implementation TestResultViewController
@synthesize rstLb,result;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithRst:(NSString *)rst{
    if (self=[super init]) {
        self.result=rst;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.rstLb setText:self.result];
}

- (void)viewDidUnload
{
    [self setRstLb:nil];
    [self setResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)dealloc {
    [rstLb release];
    [result release];
    [super dealloc];
}
@end
