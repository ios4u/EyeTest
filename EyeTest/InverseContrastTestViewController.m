//
//  InverseContrastTestViewController.m
//  EyeTest
//
//  Created by 叶 夏 on 07/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InverseContrastTestViewController.h"

@implementation InverseContrastTestViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.coverImageView= [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"label-black.png"]] autorelease];
    [self.coverImageView setFrame:CGRectMake(0, 0, 767, 371)];
    [self.coverImageView setAlpha:0.5];
    [self.view addSubview:self.coverImageView];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)dealloc {
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -------
#pragma mark 重写方法
/*
-(void)imgChange:(UIImage *)img{
    [self.midImg setImage:img];
    if (self.level==0) {
        [self.coverImageView setAlpha:0.5];
    }else if (self.level==1) {
        [self.coverImageView setAlpha:0.7];
    }else if (self.level==2) {
        [self.coverImageView setAlpha:0.8];
    }else if (self.level==3) {
        [self.coverImageView setAlpha:0.85];
    }else if (self.level==4) {
        [self.coverImageView setAlpha:0.9];
    }else if (self.level==5) {
        [self.coverImageView setAlpha:0.93];
    }else if (self.level==6) {
        [self.coverImageView setAlpha:0.95];
    }else if (self.level==-1) {
        [self.coverImageView setAlpha:0.25];
    }else if (self.level==-2) {
        [self.coverImageView setAlpha:0.2];
    }else if (self.level==-3) {
        [self.coverImageView setAlpha:0.1];
    }else if (self.level==-4) {
        [self.coverImageView setAlpha:0.0];
    }
}   */
@end
