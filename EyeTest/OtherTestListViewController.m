//
//  OtherTestListViewController.m
//  EyeTest
//
//  Created by 夏 叶 on 12-6-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OtherTestListViewController.h"
#import "Utilities.h"
#import "AcuityTestViewController.h"
#import "ContrastTestViewController.h"
#import "InverseContrastTestViewController.h"
#import "AcuityAndContrastViewController.h"
#import "LowLightViewController.h"
#import "AmslerGridViewController.h"

@implementation OtherTestListViewController
@synthesize listTable;
@synthesize otherTestList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backBarBtn=[[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStylePlain target:self action:@selector(backToMain)];
    [self.navigationItem setLeftBarButtonItem:backBarBtn];
    [backBarBtn release];
    
    
    // Do any additional setup after loading the view from its nib.
    NSArray *arr=[[NSArray alloc] initWithObjects:@"逆视力测试",@"红蓝视力测试",@"对比敏感度测试",@"逆对比敏感度测试",@"普通+对比敏感度测试",@"低光测试",@"Amsler表格测试", nil];
    self.otherTestList=arr;
    [arr release];
    
    [self.listTable setDataSource:self];
    [self.listTable setDelegate:self];
}

-(void)backToMain{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setListTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier=@"TestKindCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text=[otherTestList objectAtIndex:[indexPath row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    UIViewController *acuityTestView;
    NSString *cellText=[[cell textLabel] text];
    if ([cellText isEqualToString:[otherTestList objectAtIndex:0]]) {
        acuityTestView=[[AcuityTestViewController alloc] initWithTestKind:Inverse];
    }else if([cellText isEqualToString:[otherTestList objectAtIndex:1]]){
        acuityTestView=[[AcuityTestViewController alloc] initWithTestKind:RedBlue];
    }else if([cellText isEqualToString:[otherTestList objectAtIndex:2]]){
        acuityTestView=[[ContrastTestViewController alloc] initWithTestKind:Contrast];
    }else if([cellText isEqualToString:[otherTestList objectAtIndex:3]]){
        acuityTestView=[[InverseContrastTestViewController alloc] initWithTestKind:InverseContrast];
    }else if([cellText isEqualToString:[otherTestList objectAtIndex:4]]){
        acuityTestView=[[AcuityAndContrastViewController alloc] initWithTestKind:AcuityAndContrast];
    }else if([cellText isEqualToString:[otherTestList objectAtIndex:5]]){
        acuityTestView=[[LowLightViewController alloc] initWithTestKind:LowLight];
    }//else if([cellText isEqualToString:[otherTestList objectAtIndex:6]]){
    else{
        acuityTestView=[[AmslerGridViewController alloc] init];
    }
    [self.navigationController pushViewController:acuityTestView animated:YES];
    [acuityTestView release];
}

- (void)dealloc {
    [listTable release];
    [otherTestList release];
    [super dealloc];
}
@end
