//
//  AmslerGridImageView.h
//  EyeTest
//
//  Created by 叶 夏 on 07/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface AmslerGridImageView : UIView
@property (nonatomic, retain) UIImage *drawImage;
@property (nonatomic, retain) NSMutableArray *redArray;
-(id)initWithImage:(UIImage *)image;
@end
