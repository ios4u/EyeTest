//
//  OtherTestListViewController.h
//  EyeTest
//
//  Created by 夏 叶 on 12-6-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherTestListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *listTable;
@property(nonatomic,retain) NSArray *otherTestList;
@end
