//
//  ViewController.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/3/22.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GtNormalTableViewCell.h"
#import "GTListLoader.h"
#import "GTDeleteCellView.h"

#import <AFNetworking.h>
#import "GTDetailViewController.h"

// UITableViewDelegate 设置具体行高度 头尾视图 实现协议
@interface GTNewsViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) GTListLoader *listLoader;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@end

@implementation GTNewsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
    
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"首页1-1"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"首页1"];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //tableView.editing = YES;
    [self.view addSubview: _tableView];
    
    self.listLoader =[[GTListLoader alloc]init];
    [self.listLoader loadListData];
    
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success,NSArray<GTListItem *> * _Nullable dataArray){
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray  = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
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
    return self.dataArray.count;
}



//设置 cell 视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取注册过的cell
    GtNormalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (cell == nil) {
        //如果没有注册的cell 重新注册一个
        cell = [[GtNormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
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
     
        return 100;
  
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"这是第 %@",indexPath);
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    
    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
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
 
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    
    //动画演示
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];

    __weak typeof(self)wself = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
         __strong typeof(wself) strongSelf = wself;
        NSIndexPath *delIndexPath = [strongSelf.tableView indexPathForCell:tableViewCell];
        if (strongSelf.dataArray.count > delIndexPath.row) {
            //删除数据
            NSMutableArray *dataArrayTmp = [strongSelf.dataArray mutableCopy];
            [dataArrayTmp removeObjectAtIndex:delIndexPath.row];
            strongSelf.dataArray = [dataArrayTmp copy];
            //删除cell
            [strongSelf.tableView deleteRowsAtIndexPaths:@[delIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
     }];
}
@end
