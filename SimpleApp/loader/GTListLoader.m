//
//  GTListLoader.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/4/7.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "GTListLoader.h"
#import "GTListItem.h"


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

-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock{
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];
    if(listData){
        finishBlock(YES, listData);
    }
    
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof (self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response,NSError *_Nullable error){
        __strong typeof (weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning 类型检查
        
        NSArray *dataArray =[((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        
        for(NSDictionary *info in dataArray){
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];
    [dataTask resume];
}

// 查找本地缓存数据
-(NSArray<GTListItem *> *)_readDataFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDate *readListData = [fileManager contentsAtPath:listDataPath];
    
    id unarchiveObj  = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class],nil] fromData:readListData error:nil];
    
    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    
    return nil;
}

//存数据到本地文件
-(void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //创建文件夹
    NSString *listDataPath  = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
}

@end
