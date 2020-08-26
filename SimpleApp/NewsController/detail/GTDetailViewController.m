//
//  GTDetailViewController.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/18.
//  Copyright © 2020 Wenshuo. All rights reserved.
//
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController()<WKNavigationDelegate, GTNormalTableViewCellDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;
//进度条
@property(nonatomic,strong,readwrite)UIProgressView *progressView;
@end


@implementation GTDetailViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:({self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-80)];
        self.webView.navigationDelegate = self;
        self.webView;
      
    })];
    
    [self.view addSubview:({
        self.progressView  =[[UIProgressView alloc] initWithFrame:CGRectMake(0,88, self.view.frame.size.width,20)];
        
        self.progressView;
        
    })];
    
    [self.webView loadRequest: [NSURLRequest requestWithURL: [NSURL  URLWithString: @"https://www.baidu.com/"]]];
    //监听webview 加载进度
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

//webview 加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"");
}

//加载进度监听回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.progressView.progress = self.webView.estimatedProgress;
}


//销毁的时候移除监听
- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

//删除回调
- (void)tableViewCell:(UITableViewCell *)tabViewCell clickDelegateButton:(UIButton *)deleteButton{
    
}

@end
