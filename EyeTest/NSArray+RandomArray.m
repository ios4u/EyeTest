//
//  NSArray+RandomArray.m
//  EyeTest
//
//  Created by 夏 叶 on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSArray+RandomArray.h"

@implementation NSArray (RandomArray)
//用于随机获取数组中的object
-(id)getRandomObject{
    NSInteger rndIndex=[self getRndIndex];
    id rndObject=[self objectAtIndex:rndIndex];
    return rndObject;
}

//用于按照个数获取随机object
-(NSArray *)getRandomObjectByCount:(NSInteger) count{
    if (count>[self count]) 
        return self;
    NSMutableArray *rstArray=[NSMutableArray array];
    NSMutableArray *copyArray=[self mutableCopy];
    //copyArray=(NSMutableArray *)[self mutableCopy];
    for (int i=0; i<count; i++) {
        NSInteger end=[copyArray count]-1;
        NSInteger rndIndex=arc4random()%end;
        id rndObject=[copyArray objectAtIndex:rndIndex];
        [rstArray addObject:rndObject];
        [copyArray removeObject:rndObject];
    }
    [copyArray release];
    return rstArray;
}

-(NSInteger)getRndIndex{
    NSInteger end=[self count]-1;
    NSInteger rndIndex=arc4random()%end;
    return rndIndex;
}
@end
