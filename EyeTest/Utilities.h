//
//  Utilities.h
//  EyeTest
//
//  Created by 夏 叶 on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//static const NSArray *letterArray={@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"};
typedef enum {
    Nomal,
    Inverse,
    RedBlue,
    Contrast,
    InverseContrast,
    AcuityAndContrast,
    LowLight,
    AmslerGrid
} TestKind;


@interface Utilities : NSObject
@property(nonatomic,retain) NSArray *letterArray;

+(Utilities *)getInstance;
-(NSString *)getLetterKind:(TestKind)kind;
-(NSString *)getAcuityScore:(NSInteger)level;
-(NSString *)getContrastScore:(NSInteger)level;
-(NSString *)getLowLightScore:(NSInteger)level;
-(NSString *)getMaxAndMinByKind:(TestKind)kind;
@end
