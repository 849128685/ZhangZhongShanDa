//
//  SUNListViewController.h
//  ZhangZhongShanDa
//
//  Created by iOS开发 on 2/28/14.
//  Copyright (c) 2014 iOS开发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>//加载更多使用

typedef enum{
	PWLoadMoreNormal = 0,
    PWLoadMoreLoading,
    PWLoadMoreDone,
} PWLoadMoreState;

@protocol PWLoadMoreTableFooterDelegate;


@interface ListViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>//修改父类为uitbleviewcontrol

{
    UITableView *_tableViewList;
    
    
    id __unsafe_unretained delegate;
	PWLoadMoreState _state;
	UILabel *_statusLabel;
	UIActivityIndicatorView *_activityView;
    
}

//@property (nonatomic, strong) IBOutlet UITableView *tableViewList;

- (void)pwLoadMoreTableDataSourceDidFinishedLoading;
- (void)resetLoadMore;


@property(nonatomic,unsafe_unretained) id <PWLoadMoreTableFooterDelegate> delegate;
@end

@protocol PWLoadMoreTableFooterDelegate <NSObject>
@required
- (void)pwLoadMore;
- (BOOL)pwLoadMoreTableDataSourceAllLoaded;
@optional
- (BOOL)pwLoadMoreTableDataSourceIsLoading; //optional temporary










- (void)viewDidCurrentView;



@end
