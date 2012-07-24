//
//  AcuityAndContrastViewController.m
//  EyeTest
//
//  Created by 叶 夏 on 07/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AcuityAndContrastViewController.h"
#define WIDTHANDHEIGHT 200-30*self.level
@implementation AcuityAndContrastViewController
@synthesize coverImageView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    coverImageView= [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"label-white.png"]] autorelease];
    [coverImageView setFrame:CGRectMake(0, 0, 767, 371)];
    [coverImageView setAlpha:0.0];
    [self.view addSubview:coverImageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.coverImageView=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)dealloc {
    [coverImageView release];
    [super dealloc];
}

#pragma mark -------
#pragma mark 重写方法
-(void)imgChange:(UIImage *)img{
    if(self.viewState==1){
        [super imgChange:img];
    }else{
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
    }
}

@end
