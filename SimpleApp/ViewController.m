//
//  ViewController.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/3/22.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "ViewController.h"
#import "GtNormalTableViewCell.h"
#import "GTListLoader.h"
#import <AFNetworking.h>
// UITableViewDelegate 设置具体行高度 头尾视图 实现协议
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong,readwrite) GTListLoader *loader;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// 创建一个View
//    UIView *view =[[UIView alloc] init];
//    view.backgroundColor =[UIColor redColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview: view];
// 给view 添加点击事件
//    UITapGestureRecognizer *uiTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushCrotroller)];
//    [view addGestureRecognizer:uiTap];
  
    //隐藏头部标题栏 Navigation
  
// 创建 UITableView 也就是列表
    //style  UITableViewStylePlain 规范的列表视图
    //style  UITableViewStyleGrouped 分组列表视图
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    //tableView.editing = YES;
    [self.view addSubview: tableView];
    
    self.loader =[[GTListLoader alloc]init];
    [self.loader loadListData];
    
//
//    [[AFHTTPSessionManager manager] GET:@"https://wanandroid.com/wxarticle/chapters/json" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
}

//设置表格视图有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

// 设置有几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


//设置 cell 视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取注册过的cell
    GtNormalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (cell == nil) {
        //如果没有注册的cell 重新注册一个
        cell = [[GtNormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    [cell layouttableViewCell];
    return cell;
}





//这是 view 的点击方法
-(void) pushCrotroller{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor =[UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右边标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 100;
    }else{
        return 40;
    }
}

// 分区头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

//分区尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

//设置分区的头视图
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,50)];
    view.backgroundColor=[UIColor greenColor];
    return view;
}   // custom view for header. will be adjusted to default or specified header height

//设置分区的尾视图
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,50)];
    view.backgroundColor=[UIColor blueColor];
    return view;
}   // custom view for footer. will be adjusted to default or specified footer height

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"这是第 %@",indexPath);
}


// 需要实现这个方法来设置 cell 的编辑模式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return UITableViewCellEditingStyleDelete;
    }else{
        return UITableViewCellEditingStyleInsert;
        
    }
    
}


//删除调用
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}

//新增调用
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return @[@"1",@"2"];
}

@end
