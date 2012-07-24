//
//  TestResultViewController.h
//  EyeTest
//
//  Created by 夏 叶 on 12-5-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestResultViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *rstLb;
@property(retain,nonatomic) NSString *result;
-(id)initWithRst:(NSString *)rst;
@end
