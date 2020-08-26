//
//  GTListItem.h
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/18.
//  Copyright © 2020 Wenshuo. All rights reserved.
//
 
#import <Foundation/Foundation.h>
#import "IGListKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTListItem : NSObject <NSSecureCoding, NSCopying>

@property(nonatomic, copy, readwrite) NSString *uniqueKey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *authorName;
@property(nonatomic, copy, readwrite) NSString *url;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s02;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s03;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
