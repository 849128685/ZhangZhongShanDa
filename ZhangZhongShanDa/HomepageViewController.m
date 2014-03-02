//
//  HomepageViewController.m
//  ZhangZhongShanDa
//
//  Created by iOS开发 on 2/28/14.
//  Copyright (c) 2014 iOS开发. All rights reserved.
//

#import "HomepageViewController.h"
#import "ListViewController.h"
//#import "NSURLRequestViewController.h"

@interface HomepageViewController ()

@end

@implementation HomepageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.title = @"掌中山大";
    //设置title
    self.slideSwitchView.tabItemNormalColor = [SUNSlideSwitchView colorFromHexRGB:@"868686"];
    //删除后只剩下“学线通知”一栏
    self.slideSwitchView.tabItemSelectedColor = [SUNSlideSwitchView colorFromHexRGB:@"bb0b15"];
    //不明白这句的作用的，但是注释之后未发现其影响
    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    //滑动的阴影条
    
    //设置有多少个滑动页面
    self.vc1 = [[ListViewController alloc] init];
    self.vc1.title = @"学线通知";
    
    self.vc2 = [[ListViewController alloc] init];
    self.vc2.title = @"青春山大";
    
    self.vc3 = [[ListViewController alloc] init];
    self.vc3.title = @"本科生院";
    
    self.vc4 = [[ListViewController alloc] init];
    self.vc4.title = @"研究生院";
    
    self.vc5 = [[ListViewController alloc] init];
    self.vc5.title = @"国际交流";
    
    self.vc6 = [[ListViewController alloc] init];
    self.vc6.title = @"招聘通知";
    
    self.vc7 = [[ListViewController alloc] init];
    self.vc7.title = @"就业预告";
    
    self.vc8 = [[ListViewController alloc] init];
    self.vc8.title = @"就业公告";
    
    /*UIButton *rightSideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"] forState:UIControlStateNormal];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"]  forState:UIControlStateHighlighted];
    rightSideButton.frame = CGRectMake(0, 0, 20.0f, 44.0f);
    rightSideButton.userInteractionEnabled = NO;
    self.slideSwitchView.rigthSideButton = rightSideButton;*/
    //向右划的button，以及其图片，但没实际用处
    
    [self.slideSwitchView buildUI];
    //


	// Do any additional setup after loading the view.
}

#pragma mark - 滑动tab视图代理方法

- (NSUInteger)numberOfTab:(SUNSlideSwitchView *)view
{
    return 8;
}

- (UIViewController *)slideSwitchView:(SUNSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if (number == 0) {
        return self.vc1;
    } else if (number == 1) {
        return self.vc2;
    } else if (number == 2) {
        return self.vc3;
    } else if (number == 3) {
        return self.vc4;
    } else if (number == 4) {
        return self.vc5;
    } else if (number == 5) {
        return self.vc6;
    } else if (number == 6) {
        return self.vc7;
    } else if (number == 7) {
        return self.vc8;
    } else {
        return nil;
    }
    
}

- (void)slideSwitchView:(SUNSlideSwitchView *)view panLeftEdge:(UIPanGestureRecognizer *)panParam
{
    

}

- (void)slideSwitchView:(SUNSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    ListViewController *vc = nil;
    if (number == 0) {
        vc = self.vc1;
    } else if (number == 1) {
        vc = self.vc2;
    } else if (number == 2) {
        vc = self.vc3;
    } else if (number == 3) {
        vc = self.vc4;
    } else if (number == 4) {
        vc = self.vc5;
    } else if (number == 5) {
        vc = self.vc6;
    } else if (number == 6) {
        vc = self.vc7;
    } else if (number == 7) {
        vc = self.vc8;
    }
    [vc viewDidCurrentView];
}

#pragma mark - 内存报警


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)URLRequest:(id)sender {
    
 
   
}
@end
