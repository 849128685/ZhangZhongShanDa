//
//  HomepageViewController.h
//  ZhangZhongShanDa
//
//  Created by iOS开发 on 2/28/14.
//  Copyright (c) 2014 iOS开发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUNSlideSwitchView.h"
#import "ListViewController.h"

@interface HomepageViewController : UIViewController

{
    SUNSlideSwitchView *_slideSwitchView;
    ListViewController *_vc1;
    ListViewController *_vc2;
    ListViewController *_vc3;
    ListViewController *_vc4;
    ListViewController *_vc5;
    ListViewController *_vc6;
    ListViewController *_vc7;
    ListViewController *_vc8;

}

@property (nonatomic, strong) IBOutlet SUNSlideSwitchView *slideSwitchView;

@property (nonatomic, strong) ListViewController *vc1;
@property (nonatomic, strong) ListViewController *vc2;
@property (nonatomic, strong) ListViewController *vc3;
@property (nonatomic, strong) ListViewController *vc4;
@property (nonatomic, strong) ListViewController *vc5;
@property (nonatomic, strong) ListViewController *vc6;
@property (nonatomic, strong) ListViewController *vc7;
@property (nonatomic, strong) ListViewController *vc8;

- (IBAction)URLRequest:(id)sender;

@end
