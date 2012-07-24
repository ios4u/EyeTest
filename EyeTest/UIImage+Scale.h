//
//  UIImage+Scale.h
//  EyeTest
//
//  Created by 夏 叶 on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)
-(UIImage*)scaleToSize:(CGSize)size; 

-(UIImage*) scaleAndRotateImage:(CGFloat)bounds_width:(CGFloat)bounds_height;
@end
