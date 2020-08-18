//
//  GTDetailViewController.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/18.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController()
@property(nonatomic,strong,readwrite) WKWebView *webView;

@end


@implementation GTDetailViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:({self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-80)];
        self.webView;
      
    })];
    [self.webView loadRequest: [NSURLRequest requestWithURL: [NSURL  URLWithString: @"https://www.baidu.com/"]]];
}
@end
