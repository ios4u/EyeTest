//
//  NSArray+RandomArray.h
//  EyeTest
//
//  Created by 夏 叶 on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RandomArray)
//@property(nonatomic) NSInteger pRndIndex;

-(id)getRandomObject;

-(id)getRandomObjectByCount:(NSInteger) count;
@end
