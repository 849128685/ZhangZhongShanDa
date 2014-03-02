//
//  SUNListViewController.m
//  ZhangZhongShanDa
//
//  Created by iOS开发 on 2/28/14.
//  Copyright (c) 2014 iOS开发. All rights reserved.
//  post请求，将参数放在body里面，post请求操作相对复杂，需要将参数和地址分开，不过安全性高，参数放在body里面，不易被捕获
//  ios异步post请求

#import "ListViewController.h"

@interface ListViewController ()
@property NSMutableData *data;
@property NSMutableData *receiveData;
@end

@implementation ListViewController


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
	// Do any additional setup after loading the view.
    self.tableViewList = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableViewList.delegate = self;
    self.tableViewList.dataSource = self;
    
    [self.view addSubview:self.tableViewList];
    
    
    _data = [[NSMutableData alloc] init];
    
    //创建URL
    NSURL *url = [NSURL URLWithString:@"http://202.194.15.193:8080/News2/servlet/NewestListServlet"];
    // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //[NSURLConnection connectionWithRequest:request delegate:self];
    
    //发起请求，定义代理,NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //
    [request setHTTPMethod:@"POST"];
    //设置请求方式为post，默认为get
    
    //链接服务器
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    NSLog(@"%@", connection);
}



#pragma mark - 表格视图数据源代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int row = indexPath.row;//下面做固定加载第x行。。indexpath。row是tableview的行
    NSString *ListViewCellId = @"ListViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListViewCellId];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListViewCellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ 第 %d 行",self.title,row];
    
    return cell;
}

//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    //NSLog(@"%@",[res allHeaderFields]);
    self.receiveData = [NSMutableData data];
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSData *newData = [self.receiveData subdataWithRange:NSMakeRange(2, [self.receiveData length] - 2)];
    //截取数据中从数据长度2到－2的长度
    
    NSString *receiveStr = [[NSString alloc]initWithData:newData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",receiveStr);
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}

- (void)viewDidCurrentView
{
    NSLog(@"加载为当前视图 = %@",self.title);
}


@end
