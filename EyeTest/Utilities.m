//
//  Utilities.m
//  EyeTest
//
//  Created by 夏 叶 on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Utilities.h"
//#import "NSArray+RandomArray.h"
@implementation Utilities
@synthesize letterArray;

-(id)init{
    if (self=[super init]) {
        letterArray=[[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    }
    return self;
}

+(Utilities *)getInstance{
    static Utilities *utilities;
	@synchronized(self)
	{
		if (!utilities)
			utilities = [[Utilities alloc] init];
		return utilities;
	}
}

-(void)dealloc{
    self.letterArray=nil;
    [letterArray release];
    [super dealloc];
}

-(NSString *)getLetterKind:(TestKind)kind{
    NSString *letterKind=nil;
    //普通测试 白底黑字
    if (kind==Nomal) 
        letterKind=@"write+black";
    //相反 黑底白字
    if (kind==Inverse) 
        letterKind=@"black+white";
    //红蓝 黑底红/蓝字
    if (kind==RedBlue) 
        letterKind=@"black+red|blue";
    //敏感度 白底灰色字
    if (kind==Contrast) 
        letterKind=@"write+g2";
    //反转敏感度 黑底灰色字
    if (kind==InverseContrast) 
        letterKind=@"black+g2";
    //普通+敏感度 白底
    if (kind==AcuityAndContrast) 
        letterKind=@"write+black|g2";
    //低光 灰底黑色字
    if (kind==LowLight) 
        letterKind=@"gray+black";
    if (kind==AmslerGrid) 
        letterKind=@"white";
    return letterKind;
}

-(NSString *)getMaxAndMinByKind:(TestKind)kind{
    NSString *maxAndMin=nil;
    //普通测试 白底黑字
    if (kind==Nomal) 
        maxAndMin=@"6|-3";
    //相反 黑底白字
    if (kind==Inverse) 
        maxAndMin=@"6|-3";
    //红蓝 黑底红/蓝字
    if (kind==RedBlue) 
        maxAndMin=@"6|-3";
    //敏感度 白底灰色字
    if (kind==Contrast) 
        maxAndMin=@"6|-4";
    //反转敏感度 黑底灰色字
    if (kind==InverseContrast) 
        maxAndMin=@"6|-4";
    //普通+敏感度 白底
    if (kind==AcuityAndContrast) 
        maxAndMin=@"6|-4";
    //低光 灰底黑色字
    if (kind==LowLight) 
        maxAndMin=@"7|-2";
    if (kind==AmslerGrid) 
        maxAndMin=@"null";
    return maxAndMin;
}

-(NSString *)getAcuityScore:(NSInteger)level{
    NSString *score=nil;
    switch (level) {
        case 0:
            score= @"20/70";
            break;
        case 1:  
            score=@"20/60";
            break;
        case 2:
            score=@"20/50";
            break;
        case 3:
            score=@"20/40";
            break;
        case 4:
            score=@"20/30";
            break;
        case 5:
            score=@"20/25";
            break;
        case 6:
            score=@"20/20";
            break;
        case -1:
            score=@"20/100";
            break;
        case -2:
            score=@"20/200";
            break;
        case -3:
            score=@"≤20/200";
            break;
    }
    
    return score;
}

-(NSString *)getContrastScore:(NSInteger)level{
    NSString *score=nil;
    switch (level) {
        case 0:
            score= @"25%";
            break;
        case 1:  
            score=@"18%";
            break;
        case 2:
            score=@"13%";
            break;
        case 3:
            score=@"8.8%";
            break;
        case 4:
            score=@"6.3%";
            break;
        case 5:
            score=@"4.4%";
            break;
        case 6:
            score=@"3.1%";
            break;
        case -1:
            score=@"35%";
            break;
        case -2:
            score=@"50%";
            break;
        case -3:
            score=@"70%";
            break;
        case -4:
            score=@"100%";
            break;
    }
    
    return score;
}

-(NSString *)getLowLightScore:(NSInteger)level{
    NSString *score=nil;
    switch (level) {
        case 0:
            score= @"50%";
            break;
        case 1:  
            score=@"35%";
            break;
        case 2:
            score=@"25%";
            break;
        case 3:
            score=@"18%";
            break;
        case 4:
            score=@"13%";
            break;
        case 5:
            score=@"8.8%";
            break;
        case 6:
            score=@"6.3%";
            break;
        case 7:
            score=@"4.4%";
            break;
        case -1:
            score=@"71%";
            break;
        case -2:
            score=@"100%";
            break;
    }
    
    return score;
}

@end
