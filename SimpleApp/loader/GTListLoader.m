//
//  GTListLoader.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/4/7.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "GTListLoader.h"

@implementation GTListLoader
-(void) loadListData{
    NSString *urlString = @"https://wanandroid.com/wxarticle/list/408/1/json";
    NSURL *url= [NSURL URLWithString:urlString];
    
 //   __unused NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session =[NSURLSession sharedSession];
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
    }];
    
    [dataTask resume];
    NSLog(@"");
}
@end
