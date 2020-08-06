//
//  GTRecommendViewController.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/5.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()

@end

@implementation GTRecommendViewController

-(instancetype) init{
    self  = [super init];
    if(self){
        self.tabBarItem.title= @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"我的2"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"我的2-1"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor],[UIColor lightGrayColor],[UIColor grayColor]];
    
    for(int i = 0; i < 5; i++){
        [scrollView addSubview:({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0,scrollView.bounds.size.width,scrollView.bounds.size.height)];
            
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = YES; // 滑到一半自动收缩
    [self.view addSubview:scrollView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
