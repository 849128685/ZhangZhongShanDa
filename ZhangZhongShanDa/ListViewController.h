//
//  SUNListViewController.h
//  ZhangZhongShanDa
//
//  Created by iOS开发 on 2/28/14.
//  Copyright (c) 2014 iOS开发. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>//修改父类为uitbleviewcontrol

{
    UITableView *_tableViewList;
}

//@property (nonatomic, strong) IBOutlet UITableView *tableViewList;

- (void)viewDidCurrentView;



@end
