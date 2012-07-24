//
//  AcuityTestViewController.h
//  EyeTest
//
//  Created by 夏 叶 on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilities.h"

@interface AcuityTestViewController : UIViewController

@property(nonatomic) TestKind testKind;//待定

@property(nonatomic) NSInteger level;
@property(nonatomic) Boolean mark;
@property(nonatomic) NSInteger failCount;

@property(nonatomic,retain) NSArray *answerBtnArray;
@property(nonatomic,retain) NSString *answerStr;
@property(nonatomic) BOOL isFinish;
@property(nonatomic) NSInteger viewState;//0正常,1两种测试
@property(nonatomic,retain) NSString *letterColor;//
@property(nonatomic) NSInteger maxLevel;
@property(nonatomic) NSInteger minLevel;
@property(nonatomic,retain) NSString *firstTestResult;//第一种测试的结果


-(id)initWithTestKind:(TestKind)kind;
-(IBAction)answerBtn_Click:(id)sender;

@property (retain, nonatomic) IBOutlet UIImageView *bgImageView;
@property (retain, nonatomic) IBOutlet UIButton *answerBtn0;
@property (retain, nonatomic) IBOutlet UIButton *answerBtn1;
@property (retain, nonatomic) IBOutlet UIButton *answerBtn2;
@property (retain, nonatomic) IBOutlet UIButton *answerBtn3;
@property (retain, nonatomic) IBOutlet UIButton *answerBtn4;
@property (retain, nonatomic) IBOutlet UIButton *answerBtn5;
@property (retain, nonatomic) IBOutlet UIImageView *midImg;

-(NSString *)checkLevel;
-(void)imgChange:(UIImage *)img;
-(void)reSetParameter;
@end
