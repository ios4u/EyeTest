//
//  AcuityTestViewController.m
//  EyeTest
//
//  Created by 夏 叶 on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AcuityTestViewController.h"
#import "NSArray+RandomArray.h"
#import "UIImage+Scale.h"
#import "TestResultViewController.h"
#define WIDTHANDHEIGHT 200-30*self.level

@implementation AcuityTestViewController
@synthesize answerBtn0,answerBtn1,answerBtn2,answerBtn3,answerBtn4,answerBtn5;
@synthesize midImg;
@synthesize level,mark,failCount;
@synthesize bgImageView;
@synthesize testKind;
@synthesize answerBtnArray,answerStr;
@synthesize isFinish;
@synthesize viewState,letterColor,maxLevel,minLevel,firstTestResult;

#pragma mark 初始化
-(id)initWithTestKind:(TestKind)kind{
    if (self=[super init]) {
        self.testKind=kind;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backBarBtn=[[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStylePlain target:self
                                                                action:@selector(backToMain)];
    [self.navigationItem setLeftBarButtonItem:backBarBtn];
    [backBarBtn release];
        
    NSString *maxAndMin=[[Utilities getInstance] getMaxAndMinByKind:self.testKind];
    self.maxLevel=[(NSString *)[[maxAndMin componentsSeparatedByString:@"|"] objectAtIndex:0] integerValue];
    self.minLevel=[(NSString *)[[maxAndMin componentsSeparatedByString:@"|"] objectAtIndex:1] integerValue];
    
    NSMutableArray *array=[[NSMutableArray alloc] initWithObjects:answerBtn0,answerBtn1,answerBtn2,answerBtn3,answerBtn4,answerBtn5, nil];
    self.answerBtnArray=array;
    [array release];
    //初始化参数
    self.level=0;
    self.mark=TRUE;
    self.failCount=0;
    self.firstTestResult=@"";
    //初始化背景的颜色 固定不变所以与初始化按钮分离
    [self initBackImageView];
    //初始化按钮
    [self initBtnAndImg];
}

-(void)initBtnAndImg{
    NSArray *btnArray=[[[Utilities getInstance] letterArray] getRandomObjectByCount:6];
    //NSLog(@"%@",btnArray);
    for (int i=0;i<[btnArray count];i++) {
        //未点击图片名称
        NSString *unclickedImgName=[NSString stringWithFormat:@"unclicked%@.png",[btnArray objectAtIndex:i]];
        //点击后图片名称
        NSString *clickedImgName=[NSString stringWithFormat:@"clicked%@.png",[btnArray objectAtIndex:i]];
        //未点击图片
        UIImage *unclickedImg=[UIImage imageNamed:unclickedImgName];
        //点击后图片
        UIImage *clickedImg=[UIImage imageNamed:clickedImgName];
        //设置normal图片
        [[self.answerBtnArray objectAtIndex:i] setBackgroundImage:unclickedImg forState:UIControlStateNormal];
        //设置highlight图片
        [[self.answerBtnArray objectAtIndex:i] setBackgroundImage:clickedImg forState:UIControlStateHighlighted];
        //设置按钮的值
        [[self.answerBtnArray objectAtIndex:i] setAccessibilityIdentifier:[btnArray objectAtIndex:i]];
    }
    NSString *imgLetter=[btnArray getRandomObject];//从答案按钮中随即选取一个
    self.answerStr=imgLetter;//设置需要回答的答案
    //显示图片
    NSString *midImgName=[NSString stringWithFormat:@"%@%@.png",self.letterColor,imgLetter];
    UIImage *img=[UIImage imageNamed:midImgName];
    
    [self imgChange:img];
}

-(void)initBackImageView{
    NSString *letterKind=[[Utilities getInstance] getLetterKind:self.testKind];
    //------获取答案的图片---------
    NSArray *imgInfo=[letterKind componentsSeparatedByString:@"+"];//背景图片信息
    NSArray *letterInfo=[[imgInfo objectAtIndex:1] componentsSeparatedByString:@"|"];//字母信息
    if ([letterInfo count]==1) {
        self.viewState=0;
    }else {
        self.viewState=1;
    }
    self.letterColor=[letterInfo objectAtIndex:0];
    NSString *bgImageName=[NSString stringWithFormat:@"label-%@.png",[imgInfo objectAtIndex:0]];//背景图片
    UIImage *bgImage=[UIImage imageNamed:bgImageName];
    [self.bgImageView setImage:bgImage];
}

-(void)updateLetterColor{
    NSString *letterKind=[[Utilities getInstance] getLetterKind:self.testKind];
    //------获取答案的图片---------
    NSArray *imgInfo=[letterKind componentsSeparatedByString:@"+"];//背景图片信息
    NSArray *letterInfo=[[imgInfo objectAtIndex:1] componentsSeparatedByString:@"|"];//字母信息
    self.letterColor=[letterInfo objectAtIndex:1];
}

-(void)backToMain{
    [self dismissModalViewControllerAnimated:YES];
}
#pragma mark ------
#pragma mark 内存释放
- (void)viewDidUnload
{
    [self setAnswerBtn0:nil];
    [self setAnswerBtn1:nil];
    [self setAnswerBtn2:nil];
    [self setAnswerBtn3:nil];
    [self setAnswerBtn4:nil];
    [self setAnswerBtn5:nil];
    [self setMidImg:nil];
    [self setAnswerBtnArray:nil];
    [self setAnswerStr:nil];
    [self setBgImageView:nil];
    [self setLetterColor:nil];
    [self setFirstTestResult:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)dealloc {
    [answerBtn0 release];
    [answerBtn1 release];
    [answerBtn2 release];
    [answerBtn3 release];
    [answerBtn4 release];
    [answerBtn5 release];
    [midImg release];
    [answerBtnArray release];
    [answerStr release];
    [bgImageView release];
    [letterColor release];
    [firstTestResult release];
    [super dealloc];
}

#pragma mark ------
#pragma mark 运算逻辑
-(IBAction)answerBtn_Click:(id)sender{
    UIButton *btn=(UIButton *)sender;
    //判断是否正确
    if ([[btn accessibilityIdentifier] isEqualToString:self.answerStr]) {
        //等级+1
        self.level+=1;
        //判断是否达到最高等级
        NSString *checkRst=[self checkLevel];
        //达到最高等级后显示结果页面
        if (![checkRst isEqualToString:@"false"]) {
            if (self.viewState==1) {
                self.firstTestResult=checkRst;
                self.viewState=0;
                [self reSetParameter];
                [self updateLetterColor];
            }else if(self.viewState==0){
                self.isFinish=TRUE;
                NSString *result=self.firstTestResult==@""?checkRst:[self.firstTestResult stringByAppendingFormat:@"|%@",checkRst];
                [self showResult:result];
                return;
            }
        }else{
            //判断前一次是否为正确,如果不是保留错误次数
            if (self.mark) {
                //前一次是正确,清空错误次数,
                self.failCount=0;
            }
            //标记为正确
            self.mark=TRUE;
            //重新初始化按钮
            [self initBtnAndImg];
        }
    }else {
        self.level-=1;
        //判断是否达到最低等级
        NSString *checkRst=[self checkLevel];
        //达到最低等级后显示结果页面
        if (![checkRst isEqualToString:@"false"]) {
            if (self.viewState==1) {
                self.firstTestResult=checkRst;
                self.viewState=0;
                [self reSetParameter];
                [self updateLetterColor];
            }else if(self.viewState==0){
                self.isFinish=TRUE;
                NSString *result=self.firstTestResult==@""?checkRst:[self.firstTestResult stringByAppendingFormat:@"|%@",checkRst];
                [self showResult:result];
                return;
            }
        }else{
            //判断前一次是否为正确
            if (self.mark) {
                //如果前一次是正确的,错误次数大于0,结束测试
                if (self.failCount>0) {
                    NSString *testRst=[[Utilities getInstance] getAcuityScore:self.level];
                    if (self.viewState==1) {
                        self.firstTestResult=testRst;
                        self.viewState=0;
                        [self reSetParameter];
                        [self updateLetterColor];
                    }else if(self.viewState==0){
                        self.isFinish=TRUE;
                        NSString *result=self.firstTestResult==@""?testRst:[self.firstTestResult stringByAppendingFormat:@"|%@",testRst];
                        [self showResult:result];
                        return;
                    }
                }else {
                    
                    //如果前一次正确,错误次数为0,错误次数+1
                    self.failCount+=1;
                }
            }else {
                //前一次为错误,清空错误次数,继续测试
                self.failCount=0;
            }
            //标记为错误
            self.mark=FALSE;
            //重新初始化按钮
            [self initBtnAndImg];
        }
    }
}

-(void)showResult:(NSString *)result{
    [self showRstView:result];
    [self reSetParameter];
}


-(NSString *)checkLevel{
    NSString *restRst;
    if (self.level==self.maxLevel||self.level==self.minLevel) {
        restRst=[[Utilities getInstance] getAcuityScore:self.level];
    }else {
        restRst=@"false";
    }
    return restRst;
}
#pragma mark ------
#pragma mark 重写方法

//需要重写

-(void)imgChange:(UIImage *)img{
    //根据level缩放
    UIImage *scaledImg=[img scaleAndRotateImage:WIDTHANDHEIGHT :WIDTHANDHEIGHT];
    [self.midImg setImage:scaledImg];
    [self.midImg setFrame:CGRectMake(0, 0, WIDTHANDHEIGHT, WIDTHANDHEIGHT)];
    [self.midImg setCenter:CGPointMake(384, 197)];
}

//可以重写
-(void)reSetParameter{
    self.level=0;
    self.mark= true;
    self.failCount=0;
}


-(void)showRstView:(NSString *)result{
    TestResultViewController *trvc=[[TestResultViewController alloc] initWithRst:result];
    [self.navigationController pushViewController:trvc animated:YES];
    [trvc release];
}
@end
